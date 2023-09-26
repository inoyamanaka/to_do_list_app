import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:timelines/timelines.dart';
import 'package:to_do_list_app/features/crud/controller/crud_controller.dart';
import 'package:to_do_list_app/features/crud/presentation/schedule/widgets/date_card.dart';
import 'package:to_do_list_app/features/crud/presentation/schedule/widgets/timeline_event_card.dart';
import 'package:to_do_list_app/infrastructure/theme/typography.dart';

final CrudController activity = Get.find<CrudController>();

class SchedulePage extends StatelessWidget {
  const SchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Schedule',
          style: MyTypography.bodySmall,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 120.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 7,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(10),
                child: ShowUpAnimation(
                  delayStart: Duration(milliseconds: 80 * index),
                  child: DateCard(index: index),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 1),
            child: Row(
              children: [
                SizedBox(
                  width: 100,
                  child: Text('In Progress', style: MyTypography.bodySmall),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(35.r),
                topLeft: Radius.circular(35.r),
              ),
              color: const Color(0xffF3F3F3),
            ),
          ),
          Expanded(
            child: ShowUpAnimation(
              child: Timeline.tileBuilder(
                theme: TimelineTheme.of(context).copyWith(
                  nodePosition: 0.2,
                  connectorTheme: const ConnectorThemeData(
                    thickness: 2,
                  ),
                ),
                builder: TimelineTileBuilder.connected(
                  indicatorBuilder: (context, index) {
                    return const DotIndicator(
                      color: Color(0xff989CBC),
                    );
                  },
                  connectorBuilder: (_, index, connectorType) {
                    return SolidLineConnector(
                      indent: connectorType == ConnectorType.start ? 0 : 2.0,
                      endIndent: connectorType == ConnectorType.end ? 0 : 2.0,
                      color: const Color(0xff33363F),
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
                      child: TimelineCard(
                        category: activity.result[0][index].category!,
                        name: activity.result[0][index].name!,
                        startTime: activity.result[0][index].startTime!,
                        finishTime: activity.result[0][index].finishTime!,
                        index: index
                      ),
                    ),
                  ),
                  contentsBuilder: (context, index) => ShowUpAnimation(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 5,
                      ),
                      child: FittedBox(
                        child: Text(
                          activity.result[0][index].startTime!,
                        ),
                      ),
                    ),
                  ),
                  itemCount: activity.result[0].length,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
