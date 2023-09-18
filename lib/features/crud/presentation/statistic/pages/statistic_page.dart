// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:to_do_list_app/features/crud/presentation/statistic/widgets/stat_bar.dart';
import 'package:to_do_list_app/infrastructure/theme/typography.dart';

class StatisticPage extends StatefulWidget {
  const StatisticPage({super.key});

  @override
  State<StatisticPage> createState() => _StatisticPageState();
}

List<double> percentBar = [0.45, 0.54, 0.87, 0.33, 0.60, 0.15];

class _StatisticPageState extends State<StatisticPage> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return ScreenUtilInit(
      builder: (context, child) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            'Statistic',
            style: MyTypography.bodySmall,
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(15),
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
                          '309/400',
                          style: MyTypography.bodySmall,
                        ),
                        Text('Task Completed', style: MyTypography.bodySmall),
                      ],
                    ),
                    Column(
                      children: [
                        Text('309/400', style: MyTypography.bodySmall),
                        Text('Task Completed', style: MyTypography.bodySmall),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text('Statistic', style: MyTypography.bodySmall),
                ),
                SizedBox(height: 10.h),
                SizedBox(
                  height: 220.h,
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 6,
                    itemBuilder: (context, index) =>
                        progressBar(percentBar[index], index),
                  ),
                ),
                SizedBox(height: 10.h),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text('Category', style: MyTypography.bodySmall),
                ),
                SizedBox(height: 10.h),
                Flexible(
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 6,
                    itemBuilder: (context, index) => ShowUpAnimation(
                      delayStart: Duration(milliseconds: 50 * index),
                      child: categoryBar(index),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
