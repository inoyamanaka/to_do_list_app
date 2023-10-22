// ignore_for_file: unused_local_variable, omit_local_variable_types

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:to_do_list_app/features/crud/controller/crud_controller.dart';
import 'package:to_do_list_app/features/crud/data/models/request/local/local_request.dart';
import 'package:to_do_list_app/features/crud/presentation/home/components/function.dart';
import 'package:to_do_list_app/features/crud/presentation/home/widgets/my_project_card.dart';
import 'package:to_do_list_app/features/crud/presentation/home/widgets/project_today_card.dart';
import 'package:to_do_list_app/features/crud/presentation/home/widgets/show_all_project.dart';
import 'package:to_do_list_app/features/crud/presentation/home/widgets/show_all_today.dart';
import 'package:to_do_list_app/infrastructure/theme/typography.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

final CrudController result = Get.find<CrudController>();
ValueNotifier<bool> isEmptyList = ValueNotifier<bool>(true);

// bool isEmptyList = true;
List<Activity> dateActivity = [];

// KALO GA KEPAKE HAPUS ?
DateTime dateTimeIndex = DateTime.now();
String formattedDate = DateFormat('dd MMMM yyyy').format(dateTimeIndex);

class _HomePageState extends State<HomePage> {
  late ScrollController _scrollController;

  bool lastStatus = true;
  double height = 100;

  bool get _isShrink {
    return _scrollController.hasClients &&
        _scrollController.offset > (height - kToolbarHeight);
  }

  void _scrollListener() {
    if (_isShrink != lastStatus) {
      setState(() {
        lastStatus = _isShrink;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    result.getActivity();
    _scrollController = ScrollController()..addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> fetchDataAndUpdateList(String formattedDate) async {
    try {
      dateActivity = result.result[0].where((activity) {
        return activity.date == formattedDate;
      }).toList();
      // print(dateActivity[0].data);
      if (dateActivity.isEmpty) {
        setState(() {
          isEmptyList.value = true;
        });
      } else {
        setState(() {
          isEmptyList.value = false;
        });
      }
    } catch (e) {
      setState(() {
        isEmptyList.value = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final presentTime = DateTime.now();
    final dayName = DateFormat('EEEE').format(presentTime);
    final day = presentTime.day;

    final monthName = DateFormat('MMMM').format(presentTime);
    final year = presentTime.year;

    fetchDataAndUpdateList(formattedDate);
    final screenSize = MediaQuery.of(context).size;
    return ScreenUtilInit(
      builder: (context, child) => SafeArea(
        top: false,
        child: Scaffold(
          body: DecoratedBox(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xff2b5876), Color(0xff4e4376)],
              ),
            ),
            child: NestedScrollView(
              controller: _scrollController,
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    pinned: true,
                    floating: true,
                    elevation: 3,
                    backgroundColor:
                        _isShrink ? Colors.white : Colors.transparent,
                    title: _isShrink
                        ? Text(
                            'Home',
                            style: MyTypography.bodySmall.copyWith(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          )
                        : null,
                    expandedHeight: height,
                    systemOverlayStyle: const SystemUiOverlayStyle(
                      statusBarColor: Colors.transparent,
                    ),
                    flexibleSpace: FlexibleSpaceBar(
                      titlePadding: EdgeInsets.zero,
                      expandedTitleScale: 1,
                      title: _isShrink
                          ? null
                          : AnimatedContainer(
                              duration: const Duration(milliseconds: 500),
                              height: 100,
                              width: double.infinity,
                              padding: const EdgeInsets.only(left: 8),
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xff2b5876),
                                    Color(0xff4e4376),
                                  ],
                                ),
                              ),
                              child: Center(
                                child: SingleChildScrollView(
                                  child: Row(
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(left: 15),
                                        child: CircleAvatar(
                                          radius: 35,
                                          backgroundImage: AssetImage(
                                            'assets/images/avatar.png',
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Kirito',
                                            style:
                                                MyTypography.bodySmall.copyWith(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            '$dayName, $day $monthName $year',
                                            style:
                                                MyTypography.bodyTiny.copyWith(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                    ),
                  ),
                ];
              },
              body: ShowUpAnimation(
                child: AnimatedContainer(
                  // height: 1000,
                  duration: const Duration(milliseconds: 300),
                  decoration: _isShrink
                      ? const BoxDecoration(
                          color: Color(0xffF3F3F3),
                        )
                      : BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(15.r),
                            topLeft: Radius.circular(15.r),
                          ),
                          color: const Color(0xffF3F3F3),
                        ),
                  child: SingleChildScrollView(
                    physics: const NeverScrollableScrollPhysics(),
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
                              TextButton(
                                onPressed: () {
                                  Get.to<void>(ShowAllProject.new);
                                },
                                child: Text(
                                  'Show all',
                                  style: MyTypography.bodySmall,
                                ),
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
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AutoSizeText(
                                'My Projects',
                                style: MyTypography.bodySmall,
                              ),
                              TextButton(
                                onPressed: () {
                                  Get.to<void>(ShowTodayProject.new);
                                },
                                child: Text(
                                  'Show all',
                                  style: MyTypography.bodySmall,
                                ),
                              ),
                            ],
                          ),
                        ),
                        ShowUpAnimation(
                          delayStart: const Duration(milliseconds: 200),
                          child: ValueListenableBuilder(
                            valueListenable: isEmptyList,
                            builder: (context, value, child) => SizedBox(
                              height: dateActivity.isNotEmpty ? 3 * 150 : 200,
                              child: value || dateActivity[0].data.isEmpty
                                  ? Container(
                                      alignment: Alignment.topCenter,
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 30,
                                      ),
                                      child: Lottie.asset(
                                        'assets/lotties/sleep_cat.json',
                                      ),
                                    )
                                  : ListView.builder(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      padding: EdgeInsets.zero,
                                      itemCount:
                                          dateActivity[0].data.length >= 3
                                              ? 3
                                              : dateActivity[0].data.length,
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
                                            setState(() {
                                              showConfirmationDialog(context,
                                                  () {
                                                updateCategoryAndActivity(
                                                  result,
                                                  index,
                                                  dateActivity[0]
                                                      .data[index]
                                                      .id!,
                                                );
                                              });
                                            });
                                          },
                                          result: dateActivity[0].data[index],
                                        ),
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
        ),
      ),
    );
  }
}
