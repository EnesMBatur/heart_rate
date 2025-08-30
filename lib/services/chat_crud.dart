// ignore_for_file: prefer_final_locals, cascade_invocations

import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:heart_rate/core/enums/response_type_enum.dart';
import 'package:heart_rate/locale/lang/locale_keys.g.dart';
import 'package:heart_rate/models/chat_history.dart';
import 'package:heart_rate/models/chat_message.dart';

class ChatCrud {
  ChatCrud(String basePath) : ref = FirebaseDatabase.instance.ref(basePath);

  final DatabaseReference ref;

  Future<void> addMessage({required String msg, required String role}) async {
    await ref.push().set({
      'msg': msg,
      'role': role,
      'sentAt': DateTime.now().toIso8601String(),
    });
  }

  Stream<List<ChatHistory>> fetchHistoryQuestions() {
    return ref.onValue
        .map((event) {
          var sortedMessages = <ChatHistory>[];
          if (event.snapshot.exists) {
            final snapshotValue = event.snapshot.value;
            if (snapshotValue == null) {
              log('Data at ${ref.path} is null, though snapshot exists.');
              return sortedMessages;
            }

            if (snapshotValue is List) {
              log(
                'Data at ${ref.path} is a List. Processing as a list of chat sessions. Value: $snapshotValue',
              );
              // snapshotValue is List<Object?>
              // Each element could be a chat session (Map) or null
              snapshotValue.asMap().forEach((index, sessionObject) {
                if (sessionObject is Map) {
                  // sessionObject is the chat session map, e.g., {-OQixdD8INxDyQ3uGEfN: {msg: "hi", ...}, ...}
                  // The 'id' for ChatHistory will be the index of this session in the list.
                  final String chatSessionId = index.toString();

                  try {
                    var groupMessages = <ChatHistory>[];
                    // 'sessionObject' is the map of messages for the current chat session.
                    // Its keys are message IDs (String), values are message data (Map)
                    (sessionObject).forEach((messageKey, messageValue) {
                      try {
                        if (messageValue is! Map) {
                          log(
                            'Error: Message value for session ID $chatSessionId, messageKey $messageKey is not a Map: $messageValue',
                          );
                          return; // Skips this message
                        }
                        var messageData = Map<String, dynamic>.from(
                          messageValue,
                        );
                        if (messageData['role'] == 'user') {
                          if (messageData['msg'] is String &&
                              messageData['role'] is String &&
                              messageData['sentAt'] is String) {
                            var message = ChatHistory(
                              id: chatSessionId, // Use the list index as the ID for the session
                              msg: messageData['msg'] as String,
                              role: messageData['role'] as String,
                              sentAt: DateTime.parse(
                                messageData['sentAt'] as String,
                              ),
                            );
                            groupMessages.add(message);
                          } else {
                            log(
                              'Error: Message for session ID $chatSessionId, messageKey $messageKey has missing/invalid fields: $messageData',
                            );
                          }
                        }
                      } catch (e, s) {
                        log(
                          'Error processing individual message (session ID: $chatSessionId, messageKey: $messageKey): $e\nStackTrace: $s',
                        );
                      }
                    });

                    if (groupMessages.isNotEmpty) {
                      groupMessages.sort(
                        (a, b) => a.sentAt.compareTo(b.sentAt),
                      );
                      // We add the first user message of this session.
                      // The ID of this ChatHistory item is the session's ID (list index).
                      sortedMessages.add(groupMessages.first);
                    }
                  } catch (e, s) {
                    log(
                      'Error processing chat session at index $index (ID: $chatSessionId): $e\nStackTrace: $s. Session data: $sessionObject',
                    );
                  }
                } else if (sessionObject != null) {
                  log(
                    'Warning: Item at index $index in list at ${ref.path} is not a Map: $sessionObject. Type: ${sessionObject.runtimeType}',
                  );
                }
                // Null items in the list are skipped
              });
            } else if (snapshotValue is Map) {
              log(
                'Data at ${ref.path} is a Map. Processing as a map of chat sessions. Value: $snapshotValue',
              );
              var data = snapshotValue; // Already checked it's a Map
              data.forEach((outerKey, outerValue) {
                // outerKey is the chat session ID
                // outerValue is the chat session map (map of messages)
                final String chatSessionId = outerKey.toString();
                try {
                  if (outerValue is! Map) {
                    log(
                      'Error: outerValue for session ID $chatSessionId is not a Map: $outerValue',
                    );
                    return; // Skips this entry
                  }
                  var groupMessages = <ChatHistory>[];
                  // 'outerValue' is the map of messages for the current chat session.
                  (outerValue).forEach((messageKey, messageValue) {
                    try {
                      if (messageValue is! Map) {
                        log(
                          'Error: Message value for session ID $chatSessionId, messageKey $messageKey is not a Map: $messageValue',
                        );
                        return; // Skips this message
                      }
                      var messageData = Map<String, dynamic>.from(messageValue);
                      if (messageData['role'] == 'user') {
                        if (messageData['msg'] is String &&
                            messageData['role'] is String &&
                            messageData['sentAt'] is String) {
                          var message = ChatHistory(
                            id: chatSessionId, // ID is the key from the parent map
                            msg: messageData['msg'] as String,
                            role: messageData['role'] as String,
                            sentAt: DateTime.parse(
                              messageData['sentAt'] as String,
                            ),
                          );
                          groupMessages.add(message);
                        } else {
                          log(
                            'Error: Message for session ID $chatSessionId, messageKey $messageKey has missing/invalid fields: $messageData',
                          );
                        }
                      }
                    } catch (e, s) {
                      log(
                        'Error processing individual message (session ID: $chatSessionId, messageKey: $messageKey): $e\nStackTrace: $s',
                      );
                    }
                  });
                  if (groupMessages.isNotEmpty) {
                    groupMessages.sort((a, b) => a.sentAt.compareTo(b.sentAt));
                    sortedMessages.add(groupMessages.first);
                  }
                } catch (e, s) {
                  log(
                    'Error processing chat session with ID $chatSessionId: $e\nStackTrace: $s. Session data: $outerValue',
                  );
                }
              });
            } else {
              log(
                'Error: Data at ${ref.path} is neither a Map nor a List. Actual type: ${snapshotValue.runtimeType}, Value: $snapshotValue',
              );
            }

            // Sort all collected first user messages (one per session) by their sentAt time
            sortedMessages.sort((a, b) => a.sentAt.compareTo(b.sentAt));
          } else {
            log('No data at ${ref.path}');
          }
          return sortedMessages;
        })
        .handleError((error, stackTrace) {
          log(
            'Stream error in fetchHistoryQuestions: $error\nStackTrace: $stackTrace',
          );
          return <ChatHistory>[];
        });
  }

  Future<List<ChatMessage>?> fetchChat() async {
    final event = await ref.once();
    final data = event.snapshot.value as Map<dynamic, dynamic>?;
    var messages = <ChatMessage>[
      ChatMessage(
        role: ResponseTypeEnum.system.name,
        msg: LocaleKeys.aiChat_chatbotSystem.tr(),
        sentAt: DateTime.now().subtract(const Duration(days: 1)),
      ),
    ];
    if (data != null) {
      data.forEach((key, value) {
        final messageMap = value as Map<dynamic, dynamic>;
        final safeMap = messageMap.cast<String, dynamic>();
        final message = ChatMessage.fromJson(safeMap);
        messages.add(message);
      });
    }
    messages.sort((a, b) => a.sentAt.compareTo(b.sentAt));
    return messages;
  }

  Future<void> deleteChatData() async {
    await ref.remove();
  }

  /// Delete all chat data for the user (all chat sessions)
  Future<void> deleteAllUserChatData() async {
    // If this is already the root path for the user, just remove it
    await ref.remove();
  }

  Future<void> deleteLastMessage() async {
    final lastMessageQuery = ref.orderByChild('timestamp').limitToLast(1);
    try {
      final event = await lastMessageQuery.once();
      final data = event.snapshot.value as Map<dynamic, dynamic>?;
      if (data != null) {
        final keyToDelete = data.keys.first as String;
        await ref.child(keyToDelete).remove();
      }
    } catch (e) {
      log('error: $e');
    }
  }

  Stream<List<ChatMessage>>? chatMessageStream() {
    log('Burada chat message stream');
    return ref.onValue.map((event) {
      final allData = event.snapshot.value as Map<dynamic, dynamic>? ?? {};
      log(allData.toString());

      return allData.values.map<ChatMessage>((json) {
        final messageMap = Map<String, dynamic>.from(
          json as Map<dynamic, dynamic>,
        );
        return ChatMessage.fromJson(messageMap);
      }).toList();
    });
  }
}
