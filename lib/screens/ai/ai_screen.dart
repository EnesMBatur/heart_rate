// ignore_for_file: use_build_context_synchronously, inference_failure_on_instance_creation

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart' as providerone;

class AiScreen extends ConsumerStatefulWidget {
  const AiScreen({super.key});

  @override
  ConsumerState<AiScreen> createState() => _AiScreenState();
}

class _AiScreenState extends AiModelview {
  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.titleMedium!;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: buildAppBar(context),
      body: GestureDetector(
        onTap: () => focusNode.unfocus(),
        child: Column(
          children: [
            Flexible(
              child: StreamBuilder<List<ChatMessage>>(
                stream: chatService?.chatMessageStream(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    Future(() {
                      ref.watch(askProvider).setAnimationPlay(value: false);
                    });
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

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text(LocaleKeys.navbar_ai).tr(),
      centerTitle: true,
      automaticallyImplyLeading: false,
      leading: const ProLeading(),
      leadingWidth: 115,
      actions: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomIconButton(
              onPressed: () async {
                await newSpeech();
              },
              iconData: LineIcons.alternateMedicalChat,
            ),
            const SizedBox(width: 6),
            CustomIconButton(
              onPressed: () async {
                final basePath = await getPath();
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        AiDietitianHistory(basePath: basePath),
                  ),
                );
              },
              iconData: LineIcons.history,
            ),
            const SizedBox(width: 10),
          ],
        ),
      ],
    );
  }

  SpinKitThreeBounce buildSpinKit(BuildContext context) {
    return SpinKitThreeBounce(color: Theme.of(context).primaryColor, size: 18);
  }

  ListView buildListView(List<ChatMessage> chatList) {
    return ListView.builder(
      physics: const AlwaysScrollableScrollPhysics(),
      controller: scrollController,
      padding: const EdgeInsets.all(AppConst.kDefaultEdgeInsets),
      itemCount: chatList.length + 1,
      itemBuilder: (context, index) {
        if (index == 0) {
          return const HiAi();
        }
        final adjustedIndex = index - 1;
        return Consumer(
          builder: (context, ref, child) {
            final chatRef = ref.watch(askProvider);
            final lastIndex = index == chatList.length;
            return providerone.Consumer<RevenueCatProvider>(
              builder: (context, revenueCatProvider, child) {
                return Message(
                  lastIndex: lastIndex,
                  message: chatList[adjustedIndex].msg,
                  index:
                      ResponseTypeEnum.user.name == chatList[adjustedIndex].role
                      ? 0
                      : 1,
                  onTap: () async {
                    final value = await SecureStorage().readSecureData(
                      'aiChat',
                    );
                    final entitlement = revenueCatProvider.entitlement;
                    if (entitlement == Entitlement.free &&
                        value > AppConst.kTrialValue) {
                      if (!context.mounted) return;
                      await context.push(AppRouter.paywall);
                    } else {
                      await refreshMessage(chatRef);
                    }
                  },
                );
              },
            );
          },
        );
      },
    );
  }

  Material buildTextEditing(TextStyle textStyle, AskNotifier chatRef) {
    return Material(
      color: Theme.of(context).primaryColorLight,
      child: Padding(
        padding: const EdgeInsets.only(
          right: 16,
          left: AppConst.kDefaultPadding,
          top: 2 * AppConst.kDefaultEdgeInsets,
          bottom: AppConst.kDefaultPadding,
        ),
        child: providerone.Consumer<RevenueCatProvider>(
          builder: (context, revenueCatProvider, child) {
            return Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: textEditingController,
                    focusNode: focusNode,
                    maxLines: 12,
                    minLines: 1,
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
                        textEditingController.clear();
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
                      textEditingController.clear();
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
