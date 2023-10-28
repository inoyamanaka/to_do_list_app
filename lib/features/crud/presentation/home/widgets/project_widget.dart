import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:to_do_list_app/features/crud/presentation/home/pages/home_page.dart';
import 'package:to_do_list_app/features/crud/presentation/home/widgets/my_project_card.dart';

class ProjectWidget extends StatelessWidget {
  const ProjectWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ShowUpAnimation(
      child: SizedBox(
        height: 220,
        child: ValueListenableBuilder(
          valueListenable: isProjectEmpty,
          builder: (context, value, child) => value
              ? Container(
                  alignment: Alignment.topCenter,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  child: Lottie.asset(
                    'assets/lotties/sleep_cat.json',
                  ),
                )
              : ValueListenableBuilder(
                  valueListenable: projectList,
                  builder: (context, value, child) => ListView.builder(
                    itemCount: value.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FittedBox(
                          child: MyProjectCard(
                            projectActivity: value,
                            index: index,
                          ),
                        ),
                        SizedBox(width: 10.w),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
