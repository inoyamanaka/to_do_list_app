import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:timelines/timelines.dart';
import 'package:to_do_list_app/features/crud/presentation/schedule/widgets/date_card.dart';
import 'package:to_do_list_app/features/crud/presentation/schedule/widgets/timeline_event_card.dart';
import 'package:to_do_list_app/infrastructure/theme/typography.dart';

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
          const Padding(
            padding: EdgeInsets.all(15),
            child: Row(
              children: [
                SizedBox(
                  width: 50,
                  child: Text('All'),
                ),
                SizedBox(width: 50, child: Text('To do')),
                SizedBox(width: 100, child: Text('In Progress'))
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
            child: Timeline.tileBuilder(
              theme: TimelineTheme.of(context).copyWith(
                nodePosition: 0.2,
              ),
              builder: TimelineTileBuilder.fromStyle(
                indicatorStyle: IndicatorStyle.outlined,
                contentsAlign: ContentsAlign.reverse,
                oppositeContentsBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(5),
                  child: ShowUpAnimation(
                    delayStart: Duration(milliseconds: 80 * index),
                    child: const TimelineCard(),
                  ),
                ),
                contentsBuilder: (context, index) => Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                  child: FittedBox(child: Text('Timeline $index')),
                ),
                itemCount: 10,
              ),
            ),
          )
        ],
      ),
    );
  }
}
