// ignore_for_file: unused_local_variable, omit_local_variable_types, await_only_futures

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:to_do_list_app/features/crud/controller/crud_controller.dart';
import 'package:to_do_list_app/features/crud/data/models/request/local/local_request.dart';
import 'package:to_do_list_app/features/crud/presentation/home/components/function.dart';
import 'package:to_do_list_app/features/crud/presentation/home/widgets/appbar.dart';
import 'package:to_do_list_app/features/crud/presentation/home/widgets/my_project_card.dart';
import 'package:to_do_list_app/features/crud/presentation/home/widgets/project_today_card.dart';
import 'package:to_do_list_app/features/crud/presentation/home/widgets/show_all_project.dart';
import 'package:to_do_list_app/features/crud/presentation/home/widgets/show_all_today.dart';
import 'package:to_do_list_app/features/crud/presentation/home/widgets/title_row.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

final CrudController result = Get.find<CrudController>();
ValueNotifier<bool> isEmptyList = ValueNotifier<bool>(true);
ValueNotifier<bool> isProjectEmpty = ValueNotifier<bool>(true);
ValueNotifier<bool> lastStatus = ValueNotifier<bool>(true);
ValueNotifier<List<Activity>> dateActivity = ValueNotifier<List<Activity>>([]);

DateTime dateTimeIndex = DateTime.now();
String formattedDate = DateFormat('dd MMMM yyyy').format(dateTimeIndex);

// Hivebox
final id = Hive.box<dynamic>('user_id');

class _HomePageState extends State<HomePage> {
  late ScrollController _scrollController;

  double height = 100;

  bool get _isShrink {
    return _scrollController.hasClients &&
        _scrollController.offset > (height - kToolbarHeight);
  }

  void _scrollListener() {
    if (_isShrink != lastStatus.value) {
      lastStatus.value = _isShrink;
    }
  }

  Future<void> fetchData() async {
    await result.getProject();
    await result.getUser(int.parse(id.get('id').toString()));
    await fetchDataproject();
    await result.getStatistic();
    await result.getActivity();
  }

  @override
  void initState() {
    super.initState();
    fetchDataAndUpdateList(formattedDate);

    fetchData();
    _scrollController = ScrollController()..addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final presentTime = DateTime.now();
    final dayName = DateFormat('EEEE').format(presentTime);
    final day = presentTime.day;

    final monthName = DateFormat('MMMM').format(presentTime);
    final year = presentTime.year;
    final screenSize = MediaQuery.of(context).size;

    return FutureBuilder(
      future: fetchData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox(
            width: 40,
            height: 40,
            child: SizedBox(),
          );
        } else {
          return ScreenUtilInit(
            builder: (context, child) => SafeArea(
              top: false,
              child: SafeArea(
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
                          CustomHomeAppBar(
                            dayName: dayName,
                            day: day,
                            monthName: monthName,
                            year: year,
                          ),
                        ];
                      },
                      body: ShowUpAnimation(
                        child: AnimatedContainer(
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
                                TitleRow(
                                  title: 'My Projects',
                                  onPress: () {
                                    Get.to<void>(ShowAllProject.new);
                                  },
                                ),
                                ShowUpAnimation(
                                  child: SizedBox(
                                    height: 220,
                                    child: ValueListenableBuilder(
                                      valueListenable: isProjectEmpty,
                                      builder: (context, value, child) =>
                                          value || result.project_list.isEmpty
                                              ? Container(
                                                  alignment:
                                                      Alignment.topCenter,
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                    horizontal: 30,
                                                  ),
                                                  child: Lottie.asset(
                                                    'assets/lotties/sleep_cat.json',
                                                  ),
                                                )
                                              : ListView.builder(
                                                  itemCount: result
                                                      .project_list[0].length,
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  itemBuilder:
                                                      (context, index) => Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      FittedBox(
                                                        child: MyProjectCard(
                                                          projectActivity: result
                                                              .project_list[0],
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
                                const SizedBox(height: 10),
                                TitleRow(
                                  title: 'My Projects',
                                  onPress: () {
                                    Get.to<void>(ShowTodayProject.new);
                                  },
                                ),
                                ShowUpAnimation(
                                  delayStart: const Duration(milliseconds: 200),
                                  child: ValueListenableBuilder(
                                    valueListenable: isEmptyList,
                                    builder: (context, value, child) =>
                                        SizedBox(
                                      height: dateActivity.value.isNotEmpty
                                          ? 3 * 150
                                          : 200,
                                      child: value
                                          ? Container(
                                              alignment: Alignment.topCenter,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 30,
                                              ),
                                              child: Lottie.asset(
                                                'assets/lotties/sleep_cat.json',
                                              ),
                                            )
                                          : ValueListenableBuilder(
                                              valueListenable: dateActivity,
                                              builder:
                                                  (context, value, child) =>
                                                      ListView.builder(
                                                shrinkWrap: true,
                                                physics:
                                                    const NeverScrollableScrollPhysics(),
                                                padding: EdgeInsets.zero,
                                                itemCount:
                                                    value[0].data.length >= 3
                                                        ? 3
                                                        : value[0].data.length,
                                                itemBuilder: (context, index) =>
                                                    Slidable(
                                                  key: UniqueKey(),
                                                  child: ProjectCard(
                                                    index: index,
                                                    onComplete: () {
                                                      showConfirmationDialog(
                                                          context, () {
                                                        updateCategoryAndActivity(
                                                          result,
                                                          index,
                                                          value[0]
                                                              .data[index]
                                                              .id!,
                                                          value[0]
                                                              .data[index]
                                                              .category!,
                                                        );
                                                        fetchDataAndUpdateList(
                                                          formattedDate,
                                                        );
                                                      });
                                                    },
                                                    result:
                                                        value[0].data[index],
                                                  ),
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
            ),
          );
        }
      },
    );
  }
}
