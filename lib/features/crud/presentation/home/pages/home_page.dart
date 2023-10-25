// ignore_for_file: unused_local_variable, omit_local_variable_types, await_only_futures

import 'package:auto_size_text/auto_size_text.dart';
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
ValueNotifier<bool> isProjectEmpty = ValueNotifier<bool>(true);
ValueNotifier<bool> lastStatus = ValueNotifier<bool>(true);

// bool isEmptyList = true;
List<Activity> dateActivity = [];
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
    if (_isShrink != lastStatus) {
      lastStatus.value = _isShrink;
    }
  }

  Future<void> fetchData() async {
    await result.getActivity();
    await result.getProject();
    await result.getUser(int.parse(id.get('id').toString()));
    await fetchDataAndUpdateList(formattedDate);
    await fetchDataproject();
    await result.getStatistic();
  }

  @override
  void initState() {
    super.initState();
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
          print(result.result[0]);
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
                          ValueListenableBuilder(
                            valueListenable: lastStatus,
                            builder: (context, value, child) => SliverAppBar(
                              pinned: true,
                              floating: true,
                              elevation: 3,
                              backgroundColor: Colors.transparent,
                              expandedHeight: 120,
                              collapsedHeight: 100,
                              flexibleSpace: FlexibleSpaceBar(
                                titlePadding: EdgeInsets.zero,
                                expandedTitleScale: 1,
                                title: AnimatedContainer(
                                  duration: const Duration(milliseconds: 500),
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
                                                result.user_data[0][0].username,
                                                style: MyTypography.bodySmall
                                                    .copyWith(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                '''$dayName, $day $monthName $year''',
                                                style: MyTypography.bodyTiny
                                                    .copyWith(
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 15,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      AutoSizeText(
                                        'Today Activity',
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
                                    builder: (context, value, child) =>
                                        SizedBox(
                                      height: dateActivity.isNotEmpty
                                          ? 3 * 150
                                          : 200,
                                      child: value ||
                                              dateActivity[0].data.isEmpty
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
                                          : ListView.builder(
                                              shrinkWrap: true,
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              padding: EdgeInsets.zero,
                                              itemCount: dateActivity[0]
                                                          .data
                                                          .length >=
                                                      3
                                                  ? 3
                                                  : dateActivity[0].data.length,
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
                                                        dateActivity[0]
                                                            .data[index]
                                                            .id!,
                                                      );
                                                    });
                                                  },
                                                  result: dateActivity[0]
                                                      .data[index],
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
