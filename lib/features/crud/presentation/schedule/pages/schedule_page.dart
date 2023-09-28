import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:timelines/timelines.dart';
import 'package:to_do_list_app/features/crud/controller/crud_controller.dart';
import 'package:to_do_list_app/features/crud/data/models/request/local/local_request.dart';
import 'package:to_do_list_app/features/crud/presentation/schedule/widgets/date_card.dart';
import 'package:to_do_list_app/features/crud/presentation/schedule/widgets/timeline_event_card.dart';
import 'package:to_do_list_app/infrastructure/theme/typography.dart';

final CrudController activity = Get.find<CrudController>();
int selectedIndex = 0;
bool isEmptyList = true;
List<Activity> dateActivity = [];

// KALO GA KEPAKE HAPUS ?
DateTime dateTimeIndex = DateTime(2023, 9, 28);
String formattedDate = DateFormat('dd MMMM yyyy').format(dateTimeIndex);

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  @override
  Widget build(BuildContext context) {
    try {
      dateActivity = activity.result[0].where((activity) {
        return activity.date == formattedDate;
      }).toList();
      if (dateActivity.isEmpty) {
        isEmptyList = true;
      } else {
        isEmptyList = false;
      }
    } catch (e) {
      isEmptyList = true;
    }

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
                  child: DateCard(
                    index: index,
                    getDate: (thisDate) {
                      setState(() {
                        formattedDate = thisDate;
                      });
                    },
                    getIndex: (indexi) {
                      setState(() {
                        selectedIndex = indexi;
                      });
                    },
                    selectedIndex: selectedIndex,
                  ),
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
              child: isEmptyList
                  ? Padding(
                      padding: const EdgeInsets.all(25),
                      child: Lottie.asset('assets/lotties/not_found.json'),
                    )
                  : Timeline.tileBuilder(
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
                            indent:
                                connectorType == ConnectorType.start ? 0 : 2.0,
                            endIndent:
                                connectorType == ConnectorType.end ? 0 : 2.0,
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
                              category: dateActivity[0].data[index].category!,
                              name: dateActivity[0].data[index].name!,
                              startTime: dateActivity[0].data[index].startTime!,
                              finishTime:
                                  dateActivity[0].data[index].finishTime!,
                              index: index,
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
                                dateActivity[0].data[index].startTime!,
                              ),
                            ),
                          ),
                        ),
                        itemCount: dateActivity[0].data.length,
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
