import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heart_rate/core/constants/duration_items.dart';
import 'package:heart_rate/core/enums/response_type_enum.dart';
import 'package:heart_rate/locale/lang/locale_keys.g.dart';
import 'package:heart_rate/provider/ask_provider.dart';
import 'package:heart_rate/screens/ai/components/chat_history.dart';
import 'package:heart_rate/services/chat_crud.dart';
import 'package:heart_rate/services/chat_service.dart';
import 'package:heart_rate/utils/dio_manager.dart';
import 'package:heart_rate/utils/snackbar_manager.dart';

abstract class ChatHistoryModelView extends ConsumerState<ChatHistoryScreen>
    with SnackBarManager, DioManagerMixin {
  late ScrollController scrollController;
  late TextEditingController textEditingController;
  late FocusNode focusNode;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    textEditingController = TextEditingController();
    focusNode = FocusNode();
  }

  @override
  void dispose() {
    scrollController.dispose();
    textEditingController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  void scrollListToEnd(AskNotifier ref) {
    ref.setAnimationPlay(value: true);
    const period = Duration(milliseconds: 100);
    Timer.periodic(period, (timer) {
      if (ref.animationIsPlaying) {
        if (scrollController.hasClients) {
          scrollController.animateTo(
            scrollController.position.maxScrollExtent,
            duration: DurationItems.durationLow(),
            curve: Curves.easeInOut,
          );
        }
      } else {
        timer.cancel();
      }
    });
  }

  Future<void> sendMessageandGetAnswers({
    required AskNotifier chatRef,
    required String msg,
  }) async {
    final answers = await ChatService(service).fetchChatResponse(
      msg,
      // 'gpt-4o',
      widget.basePath,
    );
    await ChatCrud(widget.basePath).addMessage(
      msg: answers?[0].msg ?? '',
      role: answers?[0].role ?? ResponseTypeEnum.system.name,
    );
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

      await ChatCrud(
        widget.basePath,
      ).addMessage(msg: msg, role: ResponseTypeEnum.user.name);
      setState(() {
        textEditingController.clear();
        focusNode.unfocus();
      });
      await sendMessageandGetAnswers(msg: msg, chatRef: chatRef);
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
}
