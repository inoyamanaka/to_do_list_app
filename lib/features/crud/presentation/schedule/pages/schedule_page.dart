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
              SliverAppBar(
                expandedHeight: 180,
                elevation: 3,
                pinned: true,
                floating: true,
                backgroundColor: _isShrink ? Colors.white : Colors.transparent,
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
                              Container(
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
                                  itemBuilder: (context, index) => Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: ShowUpAnimation(
                                      delayStart:
                                          Duration(milliseconds: 80 * index),
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
                              const SizedBox(height: 10),
                            ],
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
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15.r),
                        topLeft: Radius.circular(15.r),
                      ),
                      color: const Color(0xffF3F3F3),
                    ),
                    child: isEmptyList
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
