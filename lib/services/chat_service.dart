// ignore_for_file: avoid_dynamic_calls, inference_failure_on_function_invocation, lines_longer_than_80_chars

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:heart_rate/core/enums/response_type_enum.dart';
import 'package:heart_rate/core/hive/secure_storage.dart';
import 'package:heart_rate/models/chat_message.dart';
import 'package:heart_rate/services/chat_crud.dart' show ChatCrud;

abstract class IChatService {
  IChatService(this.dio);
  final Dio dio;

  // Future<Chat?> fetchRecipeResponse(
  //   String content,
  //   String trimester,
  //   String tags,
  // );
  Future<List<ChatMessage>?> fetchChatResponse(
    String content,
    String servicePath,
  );
}

class ChatService extends IChatService {
  ChatService(super.dio);

  // @override
  // Future<Chat?> fetchRecipeResponse(
  //   String content,
  //   String trimester,
  //   String tags,
  // ) async {
  //   Map<String, dynamic>? searchDetails;
  //   final msg = LocaleKeys.others_openaiservice.tr(
  //     namedArgs: {'tags': tags, 'content': content, 'trimester': trimester},
  //   );
  //   searchDetails = {
  //     'model': 'gpt-5-mini',
  //     'messages': [
  //       {'role': 'user', 'content': msg},
  //     ],
  //     'temperature': 0.7,
  //     'max_tokens': 1000,
  //   };

  //   final response = await dio.post('/responses', data: searchDetails);
  //   if (response.statusCode == HttpStatus.ok) {
  //     final datas = response.data;
  //     if (datas is Map<String, dynamic>) {
  //       return Chat.fromJson(datas);
  //     }
  //   } else {
  //     final datas = response.data;
  //     if (datas['error'] != null) {
  //       log(datas['error']['message']);

  //       throw HttpException(datas['error']['message'] as String);
  //     }
  //   }

  //   return null;
  // }

  @override
  Future<List<ChatMessage>?> fetchChatResponse(
    String content,
    String servicePath,
  ) async {
    Map<String, dynamic>? searchDetails;
    final chatsList = await ChatCrud(servicePath).fetchChat();
    final memChats = List<Map<String, String>>.empty(growable: true)
      ..addAll(
        chatsList!.map((chat) => {'role': chat.role, 'content': chat.msg}),
      );
    searchDetails = {
      'model': 'gpt-5-mini',
      'messages': memChats,
      'temperature': 0.7,
      'max_tokens': 1200,
    };
    final response = await dio.post('/chat/completions', data: searchDetails);
    if (response.statusCode == HttpStatus.ok) {
      await SecureStorage().controlandIncreaseSecureData('aiChat');
      final datas = response.data;
      var chatList = <ChatMessage>[];
      if (datas is Map<String, dynamic>) {
        chatList = List.generate(
          datas['choices'].length as int,
          (index) => ChatMessage(
            msg: datas['choices'][index]['message']['content'].toString(),
            role: ResponseTypeEnum.assistant.name,
          ),
        );
      }
      return chatList;
    } else {
      final datas = response.data;
      if (datas['error'] != null) {
        throw HttpException(datas['error']['message'] as String);
      }
    }
    return null;
  }
}
