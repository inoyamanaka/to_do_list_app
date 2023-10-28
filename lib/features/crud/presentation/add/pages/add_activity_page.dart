import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:to_do_list_app/features/crud/controller/crud_controller.dart';
import 'package:to_do_list_app/features/crud/presentation/add/widgets/activity_tab_form.dart';
import 'package:to_do_list_app/features/crud/presentation/add/widgets/project_tab_form.dart';
import 'package:to_do_list_app/features/crud/presentation/statistic/pages/statistic_page.dart';
import 'package:to_do_list_app/infrastructure/theme/typography.dart';

class AddActivityPage extends StatefulWidget {
  const AddActivityPage({super.key});

  @override
  State<AddActivityPage> createState() => _AddActivityPageState();
}

class _AddActivityPageState extends State<AddActivityPage> {
  DateTime? selectedDate;
  ValueNotifier<String> optionSelected = ValueNotifier<String>('Olahraga');
  ValueNotifier<int> categoryIndex = ValueNotifier<int>(0);

  GlobalKey<FormState> activityKey = GlobalKey<FormState>();
  GlobalKey<FormState> projectKey = GlobalKey<FormState>();

  TextEditingController nameInput = TextEditingController();
  TextEditingController dateInput = TextEditingController();
  TextEditingController startInput = TextEditingController();
  TextEditingController finishInput = TextEditingController();

  TextEditingController projectNameInput = TextEditingController();
  TextEditingController projectDescInput = TextEditingController();

  int categoryOnGoing = 0;
  final CrudController activity = Get.find<CrudController>();

  Future<void> fetchData() async {
    await statistic.getStatistic();
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff2b5876), Color(0xff4e4376)],
          ),
        ),
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                elevation: innerBoxIsScrolled ? 3 : 0,
                pinned: true,
                backgroundColor:
                    innerBoxIsScrolled ? Colors.white : Colors.transparent,
                titleSpacing: 10,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text(
                    'Create New Activity',
                    style: innerBoxIsScrolled
                        ? MyTypography.bodySmall
                        : MyTypography.bodySmall.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ];
          },
          body: ShowUpAnimation(
            child: Container(
              width: screenSize.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15.r),
                  topLeft: Radius.circular(15.r),
                ),
                color: const Color(0xffF3F3F3),
              ),
              child: ContainedTabBarView(
                tabBarViewProperties: const TabBarViewProperties(
                  physics: NeverScrollableScrollPhysics(),
                ),
                tabBarProperties: const TabBarProperties(
                  indicatorWeight: 8,
                  indicatorColor: Color(0xff325476),
                  labelColor: Color(0xff325476),
                  indicatorPadding: EdgeInsets.symmetric(horizontal: 12),
                  height: 65,
                  unselectedLabelColor: Color(0xff363D45),
                ),
                onChange: (p0) {
                  nameInput.clear();
                  dateInput.clear();
                  startInput.clear();
                  finishInput.clear();
                  projectNameInput.clear();
                  projectDescInput.clear();
                },
                tabs: [
                  Text(
                    'ACTIVITY',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    'PROJECT',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
                views: [
                  ActivityTabForm(
                    formKey: activityKey,
                    nameInput: nameInput,
                    dateInput: dateInput,
                    startInput: startInput,
                    finishInput: finishInput,
                    optionSelected: optionSelected,
                    categoryIndex: categoryIndex,
                    activity: activity,
                    categoryOnGoing: categoryOnGoing,
                    selectedDate: selectedDate,
                  ),
                  ProjectTabForm(
                    formKey: projectKey,
                    projectName: projectNameInput,
                    projectDate: dateInput,
                    projectDes: projectDescInput,
                    nameInput: nameInput,
                    startInput: startInput,
                    finishInput: finishInput,
                    optionSelected: optionSelected,
                    categoryIndex: categoryIndex,
                    activity: activity,
                    categoryOnGoing: categoryOnGoing,
                    selectedDate: selectedDate,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
