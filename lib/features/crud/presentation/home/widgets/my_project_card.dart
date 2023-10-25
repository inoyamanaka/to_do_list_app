import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:to_do_list_app/features/crud/data/models/request/local/local_project_request.dart';
import 'package:to_do_list_app/features/crud/presentation/home/pages/my_project_page.dart';
import 'package:to_do_list_app/infrastructure/theme/typography.dart';

class MyProjectCard extends StatelessWidget {
  const MyProjectCard({
    required this.projectActivity,
    required this.index,
    super.key,
  });

  final List<ProjectActivity> projectActivity;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to<void>(
          () => MyProjectPage(
            projectActivity: projectActivity[index],
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Container(
          padding: EdgeInsets.all(15.h),
          width: 240,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Color(0xff82B0BC),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.calendar_month,
                        color: Color(0xff33363F),
                      ),
                      const SizedBox(width: 10),
                      Text(projectActivity[index].projectDate),
                    ],
                  ),
                  const Icon(
                    FontAwesomeIcons.lightbulb,
                    color: Color(0xff33363F),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Text(
                projectActivity[index].projectName,
                style: MyTypography.bodyLarge,
              ),
              SizedBox(height: 10.h),
              Text(
                projectActivity[index].projectDescription,
                style: MyTypography.bodyTiny,
              ),
              const SizedBox(height: 20),
              const LinearProgressIndicator(
                value: 0.4,
                backgroundColor: Color(0xffD9D9D9),
                valueColor: AlwaysStoppedAnimation<Color>(
                  Color(0xff33363F),
                ),
              ),
              SizedBox(height: 10.h),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text('Progress'), Text('40%')],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
