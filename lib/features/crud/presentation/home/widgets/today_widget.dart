import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:lottie/lottie.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:to_do_list_app/features/crud/presentation/home/components/function.dart';
import 'package:to_do_list_app/features/crud/presentation/home/pages/home_page.dart';
import 'package:to_do_list_app/features/crud/presentation/home/widgets/project_today_card.dart';

class TodayActivityWidget extends StatelessWidget {
  const TodayActivityWidget({
    super.key,
  });

  

  @override
  Widget build(BuildContext context) {
    return ShowUpAnimation(
      delayStart: const Duration(milliseconds: 200),
      child: ValueListenableBuilder(
        valueListenable: isEmptyList,
        builder: (context, value, child) => SizedBox(
          height: activityList.value.isNotEmpty ? 3 * 150 : 200,
          child: value
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
                  valueListenable: activityList,
                  builder: (context, value, child) => ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemCount:
                        value[0].data.length >= 3 ? 3 : value[0].data.length,
                    itemBuilder: (context, index) => Slidable(
                      key: UniqueKey(),
                      child: ProjectCard(
                        index: index,
                        onComplete: () {
                          showConfirmationDialog(context, () {
                            updateCategoryAndActivity(
                              result,
                              index,
                              value[0].data[index].id!,
                              value[0].data[index].category!,
                            );
                            fetchDataAndUpdateList(
                              formattedDate,
                            );
                          });
                        },
                        result: value[0].data[index],
                      ),
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
