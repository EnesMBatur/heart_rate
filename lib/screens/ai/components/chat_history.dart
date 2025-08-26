import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart' as providerone;

class ChatHistoryScreen extends ConsumerStatefulWidget {
  const ChatHistoryScreen({required this.basePath, super.key});

  final String basePath;

  @override
  ConsumerState<ChatHistoryScreen> createState() => _ChatHistoryScreenState();
}

class _ChatHistoryScreenState extends ChatHistoryModelView {
  @override
  Widget build(BuildContext context) {
    log(widget.basePath);
    final textStyle = Theme.of(context).textTheme.titleMedium!;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: buildAppBar(context),
      body: GestureDetector(
        onTap: focusNode.unfocus,
        child: Column(
          children: [
            Flexible(
              child: StreamBuilder<List<ChatMessage>>(
                stream: ChatCrud(widget.basePath).chatMessageStream(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    ref.read(askProvider).setAnimationPlay(value: false);
                    return Text('error: ${snapshot.error}', style: textStyle);
                  }
                  if (!snapshot.hasData) {
                    return const CustomLoading();
                  }
                  final chatList = snapshot.data!
                    ..sort((a, b) => a.sentAt.compareTo(b.sentAt));
                  return buildListView(chatList);
                },
              ),
            ),
            Consumer(
              builder: (context, ref, child) {
                final chatRef = ref.watch(askProvider);
                return Column(
                  children: [
                    if (chatRef.isTyping) ...[
                      const SizedBox(height: AppConst.kDefaultEdgeInsets),
                      buildSpinKit(context),
                      const SizedBox(height: AppConst.kDefaultEdgeInsets),
                    ],
                    buildTextEditing(textStyle, chatRef),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  ListView buildListView(List<ChatMessage> chatList) {
    return ListView.builder(
      physics: const AlwaysScrollableScrollPhysics(),
      controller: scrollController,
      padding: const EdgeInsets.all(AppConst.kDefaultEdgeInsets),
      itemCount: chatList.length,
      itemBuilder: (context, index) {
        return Consumer(
          builder: (context, ref, child) {
            final lastIndex = index == chatList.length - 1;
            return ChatHistoryMessage(
              index: ResponseTypeEnum.user.name == chatList[index].role ? 0 : 1,
              message: chatList[index].msg,
              lastIndex: lastIndex,
            );
          },
        );
      },
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const CustomIcon(),
        onPressed: () => Navigator.pop(context),
      ),
      centerTitle: true,
    );
  }

  SpinKitThreeBounce buildSpinKit(BuildContext context) {
    return SpinKitThreeBounce(color: Theme.of(context).primaryColor, size: 18);
  }

  Material buildTextEditing(TextStyle textStyle, AskNotifier chatRef) {
    return Material(
      color: Theme.of(context).primaryColorLight,
      child: Padding(
        padding: const EdgeInsets.only(
          right: 16,
          left: AppConst.kDefaultPadding,
          top: 2 * AppConst.kDefaultEdgeInsets,
          bottom: 2 * AppConst.kDefaultPadding,
        ),
        child: providerone.Consumer<RevenueCatProvider>(
          builder: (context, revenueCatProvider, child) {
            return Row(
              children: [
                Expanded(
                  child: TextField(
                    focusNode: focusNode,
                    controller: textEditingController,
                    onSubmitted: (value) async {
                      final value = await SecureStorage().readSecureData(
                        'aiChat',
                      );
                      final entitlement = revenueCatProvider.entitlement;
                      if (entitlement == Entitlement.free &&
                          value > AppConst.kTrialValue) {
                        if (!context.mounted) return;
                        await context.push(AppRouter.paywall);
                      } else {
                        await sendMessage(chatRef);
                      }
                    },
                    style: textStyle,
                    decoration: InputDecoration.collapsed(
                      hintText: LocaleKeys.aiChat_message.tr(),
                      hintStyle: textStyle.copyWith(color: Colors.grey),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    final value = await SecureStorage().readSecureData(
                      'aiChat',
                    );
                    final entitlement = revenueCatProvider.entitlement;
                    if (entitlement == Entitlement.free &&
                        value > AppConst.kTrialValue) {
                      if (!context.mounted) return;
                      await context.push(AppRouter.paywall);
                    } else {
                      await sendMessage(chatRef);
                    }
                  },
                  icon: Icon(
                    LineIcons.paperPlane,
                    size: 32,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
