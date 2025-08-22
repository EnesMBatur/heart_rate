import 'dart:async';
import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:glycemic_index/core/constants/duration_items.dart';
import 'package:glycemic_index/core/enums/response_type_enum.dart';
import 'package:glycemic_index/core/hive/secure_storage.dart';
import 'package:glycemic_index/locale/lang/locale_keys.g.dart';
import 'package:glycemic_index/provider/ask_provider.dart';
import 'package:glycemic_index/screens/ai/ai_screen.dart';
import 'package:glycemic_index/services/chat_crud.dart';
import 'package:glycemic_index/services/chat_service.dart';
import 'package:glycemic_index/utility/dio_manager.dart';
import 'package:glycemic_index/utility/history_manager.dart';
import 'package:glycemic_index/utility/id_manager.dart';
import 'package:glycemic_index/utility/snackbar_manager.dart';

abstract class AiModelview extends ConsumerState<AiScreen>
    with DioManagerMixin, IdManager, SnackBarManager, HistoryManager {
  late FocusNode focusNode;
  ChatCrud? chatService;
  String basePath = '';
  late ScrollController scrollController;
  late TextEditingController textEditingController;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
    scrollController = ScrollController();
    textEditingController = TextEditingController();
    setBasePath();
  }

  @override
  void dispose() {
    focusNode.dispose();
    scrollController.dispose();
    textEditingController.dispose();
    super.dispose();
  }

  Future<void> setBasePath() async {
    try {
      basePath = await getBasePath();
      log('Base path: $basePath');
      chatService = ChatCrud(basePath);
      if (mounted) setState(() {});
    } catch (e) {
      log('Error setting base path: $e');
    }
  }

  Future<void> newSpeech() async {
    ref.read(askProvider).setAnimationPlay(value: false);
    await SecureStorage().setupInitialID();
    basePath = await getBasePath();
    chatService = ChatCrud(basePath);
    setState(() {});
  }

  void scrollListToEnd(AskNotifier ref) {
    ref.setAnimationPlay(value: true);
    const period = Duration(milliseconds: 100);
    Timer.periodic(period, (timer) {
      if (ref.animationIsPlaying) {
        log('evet');
        if (scrollController.hasClients) {
          scrollController.animateTo(
            scrollController.position.maxScrollExtent,
            duration: DurationItems.durationLow(),
            curve: Curves.easeInOut,
          );
        }
      } else {
        log('hayır');
        timer.cancel();
      }
    });
  }

  Future<void> refreshMessage(
    AskNotifier chatRef,
  ) async {
    if (chatRef.isTyping) {
      showErrorSnackBar(context, LocaleKeys.aiChat_multiple.tr());
      return;
    }
    if (chatRef.refreshMessage == null) {
      return;
    }
    try {
      final msg = chatRef.refreshMessage!;
      chatRef
        ..setTyping()
        ..setIsAnimation(value: true)
        ..setCustomLike(value: false)
        ..setCustomDislike(value: false);
      await sendMessageandGetAnswers(
        msg: msg,
        chatRef: chatRef,
      );
    } on Exception catch (e) {
      chatRef
        ..setAnimationPlay(value: false)
        ..setIsAnimation(value: false);
      if (mounted) showErrorSnackBar(context, e.toString());
    } finally {
      scrollListToEnd(chatRef);
      chatRef.setTyping();
    }
  }

  Future<void> sendMessage(AskNotifier chatRef) async {
    if (chatRef.isTyping) {
      showErrorSnackBar(context, LocaleKeys.aiChat_multiple.tr());
      return;
    }
    if (textEditingController.text.isEmpty) {
      return;
    }
    try {
      final msg = textEditingController.text;
      chatRef
        ..setTyping()
        ..setIsAnimation(value: true)
        ..setRefreshMessage(msg);

      await chatService?.addMessage(
        msg: msg,
        role: ResponseTypeEnum.user.name,
      );
      setState(() {
        textEditingController.clear();
        focusNode.unfocus();
      });
      await sendMessageandGetAnswers(
        msg: msg,
        chatRef: chatRef,
      );
    } on Exception catch (e) {
      chatRef
        ..setAnimationPlay(value: false)
        ..setIsAnimation(value: false);
      if (mounted) showErrorSnackBar(context, e.toString());
    } finally {
      scrollListToEnd(chatRef);
      chatRef.setTyping();
    }
  }

  Future<void> sendMessageandGetAnswers({
    required AskNotifier chatRef,
    required String msg,
  }) async {
    final answers = await ChatService(service).fetchChatResponse(
      msg,
      basePath,
    );
    await chatService?.addMessage(
      msg: answers?[0].msg ?? '',
      role: answers?[0].role ?? ResponseTypeEnum.system.name,
    );
  }
}
