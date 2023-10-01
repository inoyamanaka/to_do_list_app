import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:to_do_list_app/infrastructure/constants/app_color.dart';
import 'package:to_do_list_app/infrastructure/theme/typography.dart';

class TimelineCard extends StatelessWidget {
  const TimelineCard({
    required this.category,
    required this.name,
    required this.startTime,
    required this.finishTime,
    required this.index,
    super.key,
  });

  final String category;
  final String name;
  final String startTime;
  final String finishTime;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15.r)),
        gradient: colorSchedule[index % colorSchedule.length],
      ),
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          const Align(
            alignment: Alignment.topRight,
            child: Icon(
              FontAwesomeIcons.ellipsis,
              color: Colors.white,
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              '$category-$name',
              style: MyTypography.labelMedium,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Icon(
                FontAwesomeIcons.clock,
                color: Colors.white,
                size: 15,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                '$startTime - $finishTime',
                style: MyTypography.bodyTinyWhite.copyWith(fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
