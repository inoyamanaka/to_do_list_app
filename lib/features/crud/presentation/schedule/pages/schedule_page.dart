import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:remixicon/remixicon.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:timelines/timelines.dart';
import 'package:to_do_list_app/features/crud/controller/crud_controller.dart';
import 'package:to_do_list_app/features/crud/data/models/request/local/local_request.dart';
import 'package:to_do_list_app/features/crud/presentation/schedule/widgets/date_card.dart';
import 'package:to_do_list_app/features/crud/presentation/schedule/widgets/timeline_event_card.dart';
import 'package:to_do_list_app/infrastructure/theme/typography.dart';

final CrudController activity = Get.find<CrudController>();
int selectedIndex = 0;
bool isEmptyList = true;
ValueNotifier<bool> isCalender = ValueNotifier<bool>(false);
ValueNotifier<int> expandedHeight = ValueNotifier<int>(250);
List<Activity> dateActivity = [];

DateTime dateTimeIndex = DateTime.now();
String formattedDate = DateFormat('dd MMMM yyyy').format(dateTimeIndex);

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  late ScrollController _scrollController;

  bool lastStatus = true;
  double height = 100;

  bool get _isShrink {
    return _scrollController.hasClients &&
        _scrollController.offset > (height - kToolbarHeight);
  }

  void _scrollListener() {
    if (_isShrink != lastStatus) {
      setState(() {
        lastStatus = _isShrink;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    activity.getActivity();
    _scrollController = ScrollController()..addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

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
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff2b5876), Color(0xff4e4376)],
          ),
        ),
        child: NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              ValueListenableBuilder(
                valueListenable: expandedHeight,
                builder: (context, value, child) => SliverAppBar(
                  expandedHeight: value.toDouble(),
                  elevation: 3,
                  pinned: true,
                  floating: true,
                  backgroundColor:
                      _isShrink ? Colors.white : Colors.transparent,
                  title: _isShrink
                      ? AnimatedContainer(
                          duration: const Duration(milliseconds: 500),
                          child: Text(
                            'Schedule',
                            style: MyTypography.bodySmall.copyWith(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          ),
                        )
                      : null,
                  flexibleSpace: FlexibleSpaceBar(
                    titlePadding: EdgeInsets.zero,
                    expandedTitleScale: 1,
                    title: _isShrink
                        ? null
                        : SingleChildScrollView(
                            physics: const NeverScrollableScrollPhysics(),
                            child: Column(
                              children: [
                                const SizedBox(height: 20),
                                const Text('Schedule'),
                                const SizedBox(height: 20),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'November 19',
                                          style: MyTypography.bodySmall
                                              .copyWith(color: Colors.white),
                                        ),
                                        Row(
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                isCalender.value = true;
                                                expandedHeight.value = 450;
                                              },
                                              icon: const Icon(
                                                Remix.calendar_line,
                                                color: Colors.white,
                                              ),
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                isCalender.value = false;
                                                expandedHeight.value = 250;
                                              },
                                              icon: const Icon(
                                                Remix.sun_cloudy_fill,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                ValueListenableBuilder(
                                  valueListenable: isCalender,
                                  builder: (context, value, child) => value
                                      ? TableCalendar<void>(
                                          firstDay: DateTime.utc(2010, 10, 16),
                                          lastDay: DateTime.utc(2030, 3, 14),
                                          focusedDay: DateTime.now(),
                                          headerStyle: const HeaderStyle(
                                            titleTextStyle: TextStyle(
                                              fontSize: 12,
                                            ),
                                          ),
                                          daysOfWeekStyle:
                                              const DaysOfWeekStyle(
                                            weekdayStyle: TextStyle(
                                              fontSize: 12,
                                            ),
                                            weekendStyle: TextStyle(
                                              fontSize: 12,
                                            ),
                                          ),
                                          calendarStyle: const CalendarStyle(
                                            outsideTextStyle: TextStyle(
                                              fontSize: 12,
                                            ),
                                            defaultTextStyle: TextStyle(
                                              fontSize: 12,
                                            ),
                                          ),
                                        )
                                      : Container(
                                          decoration: const BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                Color(0xff2b5876),
                                                Color(0xff4e4376),
                                              ],
                                            ),
                                          ),
                                          height: 120.h,
                                          child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemCount: 7,
                                            itemBuilder: (context, index) =>
                                                Padding(
                                              padding: const EdgeInsets.all(10),
                                              child: ShowUpAnimation(
                                                delayStart: Duration(
                                                  milliseconds: 80 * index,
                                                ),
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
                                ),
                                const SizedBox(height: 10),
                              ],
                            ),
                          ),
                  ),
                ),
              ),
            ];
          },
          body: Column(
            children: [
              Expanded(
                child: ShowUpAnimation(
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: double.infinity,
                    decoration: _isShrink
                        ? const BoxDecoration(
                            color: Color(0xffF3F3F3),
                          )
                        : BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(15.r),
                              topLeft: Radius.circular(15.r),
                            ),
                            color: const Color(0xffF3F3F3),
                          ),
                    child: isEmptyList || dateActivity[0].data.isEmpty
                        ? Padding(
                            padding: const EdgeInsets.all(25),
                            child:
                                Lottie.asset('assets/lotties/not_found.json'),
                          )
                        : Timeline.tileBuilder(
                            physics: const NeverScrollableScrollPhysics(),
                            theme: TimelineTheme.of(context).copyWith(
                              nodePosition: 0.2,
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
                                    endIndent:
                                        connectorType == ConnectorType.end
                                            ? 0
                                            : 2.0,
                                    color: const Color(0xff33363F),
                                  ),
                                );
                              },
                              contentsAlign: ContentsAlign.reverse,
                              oppositeContentsBuilder: (context, index) =>
                                  Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 10,
                                ),
                                child: ShowUpAnimation(
                                  delayStart:
                                      Duration(milliseconds: 80 * index),
                                  child: TimelineCard(
                                    category:
                                        dateActivity[0].data[index].category!,
                                    name: dateActivity[0].data[index].name!,
                                    startTime:
                                        dateActivity[0].data[index].startTime!,
                                    finishTime:
                                        dateActivity[0].data[index].finishTime!,
                                    index: index,
                                  ),
                                ),
                              ),
                              contentsBuilder: (context, index) =>
                                  ShowUpAnimation(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 15,
                                    horizontal: 5,
                                  ),
                                  child: FittedBox(
                                    child: Text(
                                      dateActivity[0].data[index].startTime!,
                                      style: MyTypography.bodySmall,
                                    ),
                                  ),
                                ),
                              ),
                              itemCount: dateActivity[0].data.length,
                            ),
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
