import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:lottie/lottie.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:to_do_list_app/features/crud/presentation/home/components/function.dart';
import 'package:to_do_list_app/features/crud/presentation/home/pages/home_page.dart';
import 'package:to_do_list_app/features/crud/presentation/home/widgets/project_today_card.dart';

class ShowTodayProject extends StatelessWidget {
  const ShowTodayProject({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Today Projects',
          style: TextStyle(color: Colors.black),
        ),
        leading: const BackButton(
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: ShowUpAnimation(
            delayStart: const Duration(milliseconds: 200),
            child: ValueListenableBuilder(
              valueListenable: isEmptyList,
              builder: (context, value, child) => SizedBox(
                height: MediaQuery.of(context).size.height +
                    AppBar().preferredSize.height,
                child: value
                    ? Container(
                        child: Lottie.asset(
                          'assets/lotties/sleep_cat.json',
                        ),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        itemCount: dateActivity[0].data.length,
                        itemBuilder: (context, index) => Slidable(
                          key: UniqueKey(),
                          startActionPane: ActionPane(
                            motion: const ScrollMotion(),
                            dismissible: DismissiblePane(
                              onDismissed: () {
                                updateCategoryAndActivity(
                                  result,
                                  index,
                                  dateActivity[0].data[index].id!,
                                );
                              },
                            ),
                            children: [
                              SlidableAction(
                                onPressed: (context) {},
                                backgroundColor: const Color(0xFFFE4A49),
                                foregroundColor: Colors.white,
                                icon: Icons.delete,
                                label: 'Delete',
                              ),
                            ],
                          ),
                          child: ProjectCard(
                            index: index,
                            onComplete: () {
                              showConfirmationDialog(context, () {
                                updateCategoryAndActivity(
                                  result,
                                  index,
                                  dateActivity[0].data[index].id!,
                                );
                              });
                            },
                            result: dateActivity[0].data[index],
                          ),
                        ),
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
