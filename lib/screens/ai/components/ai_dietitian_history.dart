// ignore_for_file: prefer_is_empty, inference_failure_on_instance_creation

import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:line_icons/line_icons.dart';

class AiDietitianHistory extends StatelessWidget with DialogManager {
  const AiDietitianHistory({required this.basePath, super.key});

  final String basePath;
  @override
  Widget build(BuildContext context) {
    log('basePath: $basePath');
    final chatCrud = ChatCrud(basePath);
    final textStyle = Theme.of(context).textTheme.titleMedium;
    return Scaffold(
      appBar: buildAppBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: StreamBuilder<List<ChatHistory>>(
          stream: chatCrud.fetchHistoryQuestions(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CustomLoading();
            }
            if (snapshot.hasError) {
              return EmptyList(
                svgPath: SvgGeneralEnum.notFound.svgPath,
                text: LocaleKeys.aiChat_notFound.tr(),
              );
            }
            if (snapshot.data == null || snapshot.data?.length == 0) {
              return EmptyList(
                svgPath: SvgGeneralEnum.notFound.svgPath,
                text: LocaleKeys.aiChat_notFound.tr(),
              );
            }
            return ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              physics: const BouncingScrollPhysics(),
              itemCount: snapshot.data?.length ?? 0,
              itemBuilder: (context, index) {
                final question = snapshot.data![index];
                return Padding(
                  padding: const EdgeInsets.only(
                    right: AppConst.kDefaultPadding,
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 40,
                        child: Center(
                          child: Text((index + 1).toString(), style: textStyle),
                        ),
                      ),
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Slidable(
                            key: Key(question.id),
                            endActionPane: ActionPane(
                              motion: const DrawerMotion(),
                              extentRatio: 0.25,
                              children: [
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: InkWell(
                                      onTap: () {
                                        chatDialog(
                                          context,
                                          '$basePath/${question.id}',
                                        );
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        color: Colors.red,
                                        width: 24 * 4,
                                        child: const Icon(
                                          LineIcons.alternateTrashAlt,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ChatHistoryScreen(
                                          basePath: '$basePath/${question.id}',
                                        ),
                                      ),
                                    ),
                                    child: ColoredBox(
                                      color: Theme.of(context).cardColor,
                                      child: Padding(
                                        padding: const EdgeInsets.all(
                                          AppConst.kDefaultEdgeInsets,
                                        ),
                                        child: Text(
                                          question.msg,
                                          style: textStyle,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const CustomIcon(),
        onPressed: () => context.pop(context),
      ),
      centerTitle: true,
      title: const Text(LocaleKeys.others_aihistory).tr(),
    );
  }
}
