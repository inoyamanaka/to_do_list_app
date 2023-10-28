// ignore_for_file: use_full_hex_values_for_flutter_colors, await_only_futures

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:to_do_list_app/features/crud/controller/crud_controller.dart';
import 'package:to_do_list_app/features/crud/presentation/statistic/widgets/stat_bar.dart';
import 'package:to_do_list_app/infrastructure/theme/typography.dart';

class StatisticPage extends StatefulWidget {
  const StatisticPage({super.key});

  @override
  State<StatisticPage> createState() => _StatisticPageState();
}

final CrudController statistic = Get.find<CrudController>();
ScrollController _scrollController = ScrollController();

int totalComplete = 0;
int totalOngGoing = 0;
int totalPercent = 0;

class _StatisticPageState extends State<StatisticPage> {
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  void dispose() {
    totalComplete = 0;
    totalOngGoing = 0;
    totalPercent = 0;
    super.dispose();
  }

  Future<void> fetchData() async {
    await statistic.getStatistic();
    final result = await statistic.statisticResult;

    for (var i = 0; i < result[0].length; i++) {
      totalComplete += result[0][i].categoryFinished!;
      totalOngGoing += result[0][i].categoryOngoing!;
    }
    totalPercent = ((totalComplete / totalOngGoing) * 100).toInt();
  }

  @override
  Widget build(BuildContext context) {
    final result = statistic.statisticResult;
    final screenSize = MediaQuery.of(context).size;
    return ScreenUtilInit(
      builder: (context, child) => Scaffold(
        body: DecoratedBox(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff2b5876), Color(0xff4e4376)],
            ),
          ),
          child: NestedScrollView(
            // physics: const NeverScrollableScrollPhysics(),
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  elevation: innerBoxIsScrolled ? 3 : 0,
                  pinned: true,
                  backgroundColor:
                      innerBoxIsScrolled ? Colors.white : Colors.transparent,
                  titleSpacing: 10,
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: innerBoxIsScrolled ? false : true,
                    title: Text(
                      'Statistic Activity',
                      style: innerBoxIsScrolled
                          ? MyTypography.bodySmall
                          : MyTypography.bodySmall
                              .copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ];
            },
            body: SingleChildScrollView(
              child: ShowUpAnimation(
                child: Container(
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                  width: screenSize.width,
                  height: screenSize.height,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(35.r),
                      topLeft: Radius.circular(35.r),
                    ),
                    color: const Color(0xffF3F3F3),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Text(
                                '$totalComplete/$totalOngGoing',
                                style: MyTypography.bodySmall,
                              ),
                              Text(
                                'Task Completed',
                                style: MyTypography.bodySmall,
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                '$totalPercent%',
                                style: MyTypography.bodySmall,
                              ),
                              Text(
                                'Completion Rate',
                                style: MyTypography.bodySmall,
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text('Statistic', style: MyTypography.bodySmall),
                      ),
                      SizedBox(height: 5.h),
                      SizedBox(
                        height: 220.h,
                        child: ListView.builder(
                          shrinkWrap: true,
                          controller: _scrollController,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          itemCount: 6,
                          itemBuilder: (context, index) => progressBar(
                            percentBar[index],
                            index,
                            result[0][index].categoryOngoing!,
                            result[0][index].categoryFinished!,
                          ),
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text('Category', style: MyTypography.bodySmall),
                      ),
                      SizedBox(height: 10.h),
                      Flexible(
                        child: ListView.builder(
                          controller: _scrollController,
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 6,
                          itemBuilder: (context, index) => ShowUpAnimation(
                            delayStart: Duration(milliseconds: 50 * index),
                            child: categoryColumn(
                              index,
                              result[0][index].nameCategory!,
                              result[0][index].categoryOngoing!,
                              result[0][index].categoryFinished!,
                            ),
                          ),
                        ),
                      ),
                    ],
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
