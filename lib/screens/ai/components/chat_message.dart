import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:glycemic_index/core/constants/constants.dart';
import 'package:glycemic_index/provider/ask_provider.dart';

class ChatHistoryMessage extends StatelessWidget {
  const ChatHistoryMessage({
    required this.index,
    required this.message,
    required this.lastIndex,
    super.key,
  });

  final String message;
  final int index;
  final bool lastIndex;

  @override
  Widget build(BuildContext context) {
    final textStyle = index == 0
        ? Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(color: Theme.of(context).primaryColorLight)
        : Theme.of(context).textTheme.titleMedium!;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment:
          index == 0 ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        // if (index == 1)
        //   Padding(
        //     padding: const EdgeInsets.only(left: 4, right: 8, top: 8),
        //     child: ClipOval(
        //       child: SvgPicture.asset(
        //         CoreEnum.genius.svgPath,
        //         height: 32,
        //       ),
        //     ),
        //   ),
        Flexible(
          child: Container(
            margin: index == 0
                ? const EdgeInsets.only(top: 8, bottom: 8, left: 80)
                : const EdgeInsets.only(top: 8, bottom: 8, right: 60),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: BoxDecoration(
              color: index == 1
                  ? Theme.of(context).primaryColorLight
                  : AppConst.kPrimaryColor,
              borderRadius: const BorderRadius.all(
                Radius.circular(14),
              ),
            ),
            child: Consumer(
              builder: (context, ref, child) {
                final messageRef = ref.watch(askProvider);

                return Column(
                  crossAxisAlignment: index == 0
                      ? CrossAxisAlignment.end
                      : CrossAxisAlignment.start,
                  children: <Widget>[
                    if (index == 0 || !lastIndex || !messageRef.isAnimation)
                      Text(
                        message,
                        style: textStyle,
                      )
                    else
                      buildAnimatedText(textStyle, messageRef, context),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget buildAnimatedText(
    TextStyle? textStyle,
    AskNotifier ref,
    BuildContext context,
  ) {
    return AnimatedTextKit(
      isRepeatingAnimation: false,
      //displayFullTextOnTap: true,
      totalRepeatCount: 1,
      onFinished: () {
        ref
          ..setAnimationPlay(value: false)
          ..setIsAnimation(value: false);
        if (!ref.animatedMessages.contains(message)) {
          ref.setAnimatedMessages(message);
        }
      },
      animatedTexts: [
        TyperAnimatedText(
          message.trim(),
          textStyle: textStyle,
          speed: const Duration(milliseconds: 20),
        ),
      ],
    );
  }
}
