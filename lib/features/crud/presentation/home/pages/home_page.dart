// ignore_for_file: unused_local_variable, omit_local_variable_types

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:to_do_list_app/features/crud/controller/crud_controller.dart';
import 'package:to_do_list_app/features/crud/presentation/home/components/function.dart';
import 'package:to_do_list_app/features/crud/presentation/home/widgets/appbar_widget.dart';
import 'package:to_do_list_app/features/crud/presentation/home/widgets/my_project_card.dart';
import 'package:to_do_list_app/features/crud/presentation/home/widgets/project_today_card.dart';
import 'package:to_do_list_app/infrastructure/theme/typography.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

final CrudController result = Get.find<CrudController>();

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    result.getActivity();
  }

  @override
  Widget build(BuildContext context) {
    print(result.result[0]);
    final screenSize = MediaQuery.of(context).size;
    return ScreenUtilInit(
      builder: (context, child) => Scaffold(
        body: DecoratedBox(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff2b5876), Color(0xff4e4376)],
            ),
          ),
          child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return [const AppBarWidget()];
            },
            body: SingleChildScrollView(
              child: Container(
                width: screenSize.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(35.r),
                    topLeft: Radius.circular(35.r),
                  ),
                  color: const Color(0xffF3F3F3),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AutoSizeText(
                            'My Projects',
                            style: MyTypography.bodySmall,
                          ),
                          AutoSizeText(
                            'Show all',
                            style: MyTypography.bodySmall,
                          ),
                        ],
                      ),
                    ),
                    ShowUpAnimation(
                      child: SizedBox(
                        height: 220,
                        child: ListView.builder(
                          itemCount: 4,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const FittedBox(child: MyProjectCard()),
                              SizedBox(width: 10.w),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AutoSizeText(
                            'My Projects',
                            style: MyTypography.bodySmall,
                          ),
                          AutoSizeText(
                            'Show all',
                            style: MyTypography.bodySmall,
                          ),
                        ],
                      ),
                    ),
                    ShowUpAnimation(
                      delayStart: const Duration(milliseconds: 200),
                      child: SizedBox(
                        height:
                            result.result[0].isEmpty ? 300 : (300.h + (55 * 3)),
                        child: result.result[0].isEmpty
                            ? Padding(
                                padding: const EdgeInsets.all(38),
                                child: Lottie.asset(
                                  'assets/lotties/sleep_cat.json',
                                  fit: BoxFit.contain,
                                ),
                              )
                            : ListView.builder(
                                shrinkWrap: true,
                                padding: EdgeInsets.zero,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: result.result[0][0].data.length >= 3
                                    ? 3
                                    : result.result[0].length,
                                itemBuilder: (context, index) => Slidable(
                                  key: UniqueKey(),
                                  startActionPane: ActionPane(
                                    motion: const ScrollMotion(),
                                    dismissible: DismissiblePane(
                                      onDismissed: () {
                                        updateCategoryAndActivity(
                                          result,
                                          index,
                                        );
                                      },
                                    ),
                                    children: [
                                      SlidableAction(
                                        onPressed: (context) {},
                                        backgroundColor:
                                            const Color(0xFFFE4A49),
                                        foregroundColor: Colors.white,
                                        icon: Icons.delete,
                                        label: 'Delete',
                                      ),
                                    ],
                                  ),
                                  child: ProjectCard(
                                    index: index,
                                    onComplete: () {
                                      showConfirmationDialog(context, () {});
                                    },
                                    result: result.result[0][0].data[index],
                                  ),
                                ),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
