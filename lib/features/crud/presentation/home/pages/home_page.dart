// ignore_for_file: unused_local_variable, omit_local_variable_types, await_only_futures

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:to_do_list_app/features/crud/controller/crud_controller.dart';
import 'package:to_do_list_app/features/crud/data/models/request/local/local_project_request.dart';
import 'package:to_do_list_app/features/crud/data/models/request/local/local_request.dart';
import 'package:to_do_list_app/features/crud/presentation/home/components/function.dart';
import 'package:to_do_list_app/features/crud/presentation/home/widgets/appbar.dart';
import 'package:to_do_list_app/features/crud/presentation/home/widgets/project_widget.dart';
import 'package:to_do_list_app/features/crud/presentation/home/widgets/show_all_project.dart';
import 'package:to_do_list_app/features/crud/presentation/home/widgets/show_all_today.dart';
import 'package:to_do_list_app/features/crud/presentation/home/widgets/skelton_home.dart';
import 'package:to_do_list_app/features/crud/presentation/home/widgets/title_row.dart';
import 'package:to_do_list_app/features/crud/presentation/home/widgets/today_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

final CrudController result = Get.find<CrudController>();
ValueNotifier<bool> isEmptyList = ValueNotifier<bool>(true);
ValueNotifier<bool> isProjectEmpty =
    ValueNotifier<bool>(result.project_list.isEmpty);
ValueNotifier<bool> lastStatus = ValueNotifier<bool>(true);
ValueNotifier<List<Activity>> activityList = ValueNotifier<List<Activity>>([]);
ValueNotifier<List<ProjectActivity>> projectList =
    ValueNotifier<List<ProjectActivity>>([]);

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
    await result.getStatistic();
  }

  @override
  void initState() {
    super.initState();
    fetchDataAndUpdateList(formattedDate);
    fetchDataproject();
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
    return ScreenUtilInit(
      child: SafeArea(
        child: Scaffold(
          body: FutureBuilder(
            future: fetchData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xff2b5876), Color(0xff4e4376)],
                    ),
                  ),
                  child: SkeltonHome(),
                );
              } else {
                return Scaffold(
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
                                const ProjectWidget(),
                                const SizedBox(height: 10),
                                TitleRow(
                                  title: 'Today Activity',
                                  onPress: () {
                                    Get.to<void>(ShowTodayProject.new);
                                  },
                                ),
                                const TodayActivityWidget(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
