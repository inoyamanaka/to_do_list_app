import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:to_do_list_app/infrastructure/theme/typography.dart';

class TimelineCard extends StatelessWidget {
  const TimelineCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15.r)),
        color: Colors.pink,
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
              'Olahraga-Renang',
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
                '12.00 - 14.00',
                style: MyTypography.bodyTinyWhite,
              )
            ],
          )
        ],
      ),
    );
  }
}
