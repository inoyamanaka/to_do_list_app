// ignore_for_file: inference_failure_on_function_return_type

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:to_do_list_app/features/crud/data/models/request/local/local_request.dart';
import 'package:to_do_list_app/infrastructure/constants/app_color.dart';
import 'package:to_do_list_app/infrastructure/theme/typography.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    required this.index,
    required this.result,
    required this.onComplete,
    super.key,
  });
  final int index;
  final DataModel result;
  final Function() onComplete;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 8,
        ),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: colorSchedule[index % colorSchedule.length],
                borderRadius: const BorderRadius.all(Radius.circular(15)),
              ),
              padding: EdgeInsets.all(15.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        child:
                            Image.asset('assets/images/${result.category}.png'),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            result.category ?? '',
                            style: MyTypography.bodySmallWhite,
                          ),
                          Text(
                            result.name ?? '',
                            style: MyTypography.bodyMedium,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.watch,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Text(
                                '${result.startTime}-${result.finishTime}',
                                style: MyTypography.labelMedium,
                              ),
                              SizedBox(
                                width: 15.w,
                              ),
                              const Icon(
                                FontAwesomeIcons.circleCheck,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Text(
                                '1/4',
                                style: MyTypography.labelMedium,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: onComplete,
                    icon: const Icon(
                      FontAwesomeIcons.listUl,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
          ],
        ),
      ),
    );
  }
}
