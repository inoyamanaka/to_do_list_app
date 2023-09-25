import 'package:flutter/material.dart';
// import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:to_do_list_app/features/crud/controller/crud_controller.dart';
import 'package:to_do_list_app/features/crud/presentation/add/components/function.dart';
import 'package:to_do_list_app/features/crud/presentation/add/widgets/chip_card.dart';
import 'package:to_do_list_app/features/crud/presentation/add/widgets/time_picker.dart';
import 'package:to_do_list_app/features/crud/presentation/statistic/pages/statistic_page.dart';
import 'package:to_do_list_app/infrastructure/theme/typography.dart';

class AddActivityPage extends StatefulWidget {
  const AddActivityPage({super.key});

  @override
  State<AddActivityPage> createState() => _AddActivityPageState();
}

class _AddActivityPageState extends State<AddActivityPage> {
  DateTime? selectedDate;
  String optionSelected = '';
  int? _value = 1;

  final formKey = GlobalKey<FormState>();
  TextEditingController nameInput = TextEditingController();
  TextEditingController descInput = TextEditingController();
  TextEditingController dateInput = TextEditingController();
  TextEditingController startInput = TextEditingController();
  TextEditingController finishInput = TextEditingController();

  int categoryOnGoing = 0;
  final CrudController c = Get.find<CrudController>();

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
    print(c.statistic_result.isEmpty);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Create New Activity',
          style: MyTypography.bodySmall,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
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
          child: ShowUpAnimation(
            child: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 15.h),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Information',
                        style: MyTypography.bodySmall,
                      ),
                    ),
                    SizedBox(height: 15.h),
                    TextFormField(
                      controller: nameInput,
                      validator: validateInput,
                      decoration: InputDecoration(
                        hintText: 'Nama kegiatan',
                        labelText: 'Name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    SizedBox(height: 15.h),
                    TextFormField(
                      controller: dateInput,
                      validator: validateInput,
                      onTap: () async {
                        FocusScope.of(context).requestFocus(FocusNode());
                        final pickedDate = await datePicker(context);
                        final formattedDate =
                            DateFormat('dd MMMM yyyy').format(pickedDate!);
                        setState(() {
                          dateInput.text = formattedDate;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'Date',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    SizedBox(height: 15.h),
                    TextFormField(
                      controller: startInput,
                      validator: validateInput,
                      onTap: () async {
                        FocusScope.of(context).requestFocus(FocusNode());
                        final result = await timePicker(context);
                        final formattedDate = DateFormat.Hm().format(result!);
                        setState(() {
                          startInput.text = formattedDate;
                          selectedDate = result;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'Start Time',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    SizedBox(height: 15.h),
                    TextFormField(
                      controller: finishInput,
                      validator: validateInput,
                      onTap: () async {
                        FocusScope.of(context).requestFocus(FocusNode());
                        final result = await timePicker(context);
                        final formattedDate = DateFormat.Hm().format(result!);
                        setState(() {
                          finishInput.text = formattedDate;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'Finish Time',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    SizedBox(height: 15.h),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Category',
                        style: MyTypography.bodySmall,
                      ),
                    ),
                    SizedBox(height: 15.h),
                    Wrap(
                      children: List.generate(
                        6,
                        (int index) {
                          return ChoiceChip(
                            padding: const EdgeInsets.all(8),
                            label: Text(
                              options[index],
                              style: index == _value
                                  ? const TextStyle(color: Colors.white)
                                  : const TextStyle(color: Colors.black),
                            ),
                            selectedColor: const Color(0xff302727),
                            selected: _value == index,
                            onSelected: (bool selected) {
                              setState(() {
                                optionSelected = options[index];
                                _value = selected ? index : null;
                              });
                            },
                          );
                        },
                      ).toList(),
                    ),
                    SizedBox(height: 15.h),
                    GestureDetector(
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          await updateStatisticActivity(context);
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          color: Color(0xff302727),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              FontAwesomeIcons.circlePlus,
                              color: Colors.white,
                            ),
                            SizedBox(width: 10.w),
                            Text(
                              'CREATE TASK',
                              style: MyTypography.bodyMedium,
                            ),
                          ],
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

  Future<void> updateStatisticActivity(BuildContext context) async {
    if (c.statistic_result.isNotEmpty) {
      categoryOnGoing = 0;

      for (final dataModel in c.statistic_result[0]) {
        if (dataModel.nameCategory == optionSelected) {
          categoryOnGoing = dataModel.categoryOngoing!;
          categoryOnGoing += 1;

          break;
        }
      }
    } else {
      categoryOnGoing += 1;
    }

    await createDataModelAndScheduleNotification(
      name: nameInput.text,
      category: optionSelected,
      date: dateInput.text,
      startTime: startInput.text,
      finishTime: finishInput.text,
      selectedDate: selectedDate!,
      onFinish: 0,
      onGoing: categoryOnGoing,
      context: context
    );
  }
}
