// ignore_for_file: unused_local_variable, omit_local_variable_types

import 'package:auto_size_text/auto_size_text.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:to_do_list_app/features/crud/controller/crud_controller.dart';
import 'package:to_do_list_app/features/crud/presentation/home/widgets/appbar_widget.dart';
import 'package:to_do_list_app/features/crud/presentation/home/widgets/my_project_card.dart';
import 'package:to_do_list_app/features/crud/presentation/home/widgets/project_today_card.dart';
import 'package:to_do_list_app/infrastructure/theme/typography.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

final CrudController c = Get.find<CrudController>();

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    c.getActivity();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return ScreenUtilInit(
      builder: (context, child) => Scaffold(
        backgroundColor: Colors.white,
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(65),
          child: AppBarWidget(),
        ),
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
                    height: 450,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount:
                          c.result[0].length >= 3 ? 3 : c.result[0].length,
                      itemBuilder: (context, index) => Slidable(
                        key: UniqueKey(),
                        startActionPane: ActionPane(
                          motion: const ScrollMotion(),
                          dismissible: DismissiblePane(
                            onDismissed: () {
                              c.deleteActivity(index);
                              c.getActivity();
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
                          onComplete: () {
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.warning,
                              body: const Center(
                                child: Text(
                                  'Apakah Aktivitas Sudah Selesai',
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                ),
                              ),
                              title: 'This is Ignored',
                              desc: 'This is also Ignored',
                              btnCancelOnPress: () {},
                              btnCancelText: 'Belum',
                              btnOkOnPress: () {},
                              btnOkText: 'Sudah',
                            ).show();
                          },
                          result: c.result[0][index],
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
    );
  }
}