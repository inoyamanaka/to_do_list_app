import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:timelines/timelines.dart';
import 'package:to_do_list_app/features/crud/presentation/home/pages/home_page.dart';
import 'package:to_do_list_app/features/crud/presentation/home/widgets/my_project_card.dart';

class ShowAllProject extends StatelessWidget {
  const ShowAllProject({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Today Projects',
          style: TextStyle(color: Colors.black),
        ),
        leading: const BackButton(
          color: Colors.black,
        ),
      ),
      body: Center(
        child: ShowUpAnimation(
          delayStart: const Duration(milliseconds: 200),
          child: ValueListenableBuilder(
            valueListenable: isProjectEmpty,
            builder: (context, value, child) => SizedBox(
              height: MediaQuery.of(context).size.height -
                  AppBar().preferredSize.height,
              child: value
                  ? Container(
                      padding: const EdgeInsets.all(35),
                      child: Lottie.asset(
                        'assets/lotties/sleep_cat.json',
                      ),
                    )
                  : Expanded(
                      child: Timeline.tileBuilder(
                        theme: TimelineTheme.of(context).copyWith(
                          nodePosition: 0.1,
                          connectorTheme: const ConnectorThemeData(
                            thickness: 2,
                          ),
                        ),
                        builder: TimelineTileBuilder.connected(
                          indicatorBuilder: (context, index) {
                            return ShowUpAnimation(
                              child: const DotIndicator(
                                color: Color(0xff989CBC),
                              ),
                            );
                          },
                          connectorBuilder: (_, index, connectorType) {
                            return ShowUpAnimation(
                              child: SolidLineConnector(
                                indent: connectorType == ConnectorType.start
                                    ? 0
                                    : 2.0,
                                endIndent: connectorType == ConnectorType.end
                                    ? 0
                                    : 2.0,
                                color: const Color(0xff33363F),
                              ),
                            );
                          },
                          contentsAlign: ContentsAlign.reverse,
                          oppositeContentsBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),
                            child: ShowUpAnimation(
                              delayStart: Duration(milliseconds: 80 * index),
                              child: MyProjectCard(
                                projectActivity: result.project_list[0],
                                index: index,
                              ),
                            ),
                          ),
                          itemCount: 5,
                        ),
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
