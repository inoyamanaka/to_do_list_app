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
    return SizedBox(
      width: double.infinity,
      child: FittedBox(
        child: Container(
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
                padding: EdgeInsets.all(10.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 25,
                          child: Image.asset(
                            'assets/images/${result.category}.png',
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              result.category ?? '',
                              style: MyTypography.bodySmallWhite
                                  .copyWith(fontSize: 14),
                            ),
                            Text(
                              result.name ?? '',
                              style: MyTypography.bodyMedium
                                  .copyWith(fontSize: 12),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.watch,
                                  color: Colors.white,
                                  size: 15,
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Text(
                                  '${result.startTime}-${result.finishTime}',
                                  style: MyTypography.labelMedium
                                      .copyWith(fontSize: 10),
                                ),
                                SizedBox(
                                  width: 15.w,
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
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
