import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:to_do_list_app/infrastructure/theme/typography.dart';

class TimelineCard extends StatelessWidget {
  const TimelineCard({
    required this.category,
    required this.name,
    required this.startTime,
    required this.finishTime,
    super.key,
  });

  final String category;
  final String name;
  final String startTime;
  final String finishTime;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15.r)),
        color: const Color(0xff82B0BC),
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
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                '$startTime - $finishTime',
                style: MyTypography.bodyTinyWhite,
              )
            ],
          )
        ],
      ),
    );
  }
}
