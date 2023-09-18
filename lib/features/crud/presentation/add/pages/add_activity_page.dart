// ignore_for_file: inference_failure_on_uninitialized_variable, type_annotate_public_apis, prefer_typing_uninitialized_variables, avoid_dynamic_calls, inference_failure_on_function_invocation, prefer_final_locals, omit_local_variable_types

import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:to_do_list_app/features/crud/controller/crud_controller.dart';
import 'package:to_do_list_app/features/crud/data/models/request/local/local_request.dart';
import 'package:to_do_list_app/features/crud/presentation/add/widgets/time_picker.dart';
import 'package:to_do_list_app/infrastructure/theme/typography.dart';
import 'package:to_do_list_app/infrastructure/utils/notification.dart';

class AddActivityPage extends StatefulWidget {
  const AddActivityPage({super.key});

  @override
  State<AddActivityPage> createState() => _AddActivityPageState();
}

final CrudController c = Get.find<CrudController>();

List<String> options = [
  'Olahraga',
  'Hiburan',
  'Pekerjaan',
  'Belajar',
  'Ibadah',
  'Hobi',
];
String? user;

String optionSelected = '';
final usersMemoizer = C2ChoiceMemoizer<String>();

final formKey = GlobalKey<FormState>();
List<String> formValue = [];

int? _value = 1;

TextEditingController nameInput = TextEditingController();
TextEditingController descInput = TextEditingController();
TextEditingController dateInput = TextEditingController();
TextEditingController startInput = TextEditingController();
TextEditingController finishInput = TextEditingController();

class _AddActivityPageState extends State<AddActivityPage> {
  var selectedValue;
  DateTime? selectedDate;
  var box;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

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
          child: Form(
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
                    decoration: InputDecoration(
                      hintText: 'Uzumaki Naruto',
                      labelText: 'Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  SizedBox(height: 15.h),
                  TextFormField(
                    controller: descInput,
                    decoration: InputDecoration(
                      hintText: 'Olahraga renang untuk melatih kesehatan',
                      labelText: 'Deskripsi',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  SizedBox(height: 15.h),
                  TextField(
                    controller: dateInput,
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
                  TextField(
                    controller: startInput,
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
                  TextField(
                    controller: finishInput,
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
                      final dataModel = DataModel(
                        name: nameInput.text,
                        category: optionSelected,
                        date: dateInput.text,
                        startTime: startInput.text,
                        finishTime: finishInput.text,
                      );

                      // await c.addActivity(dataModel);
                      await NotificationService().scheduleNotification(
                        title: 'Scheduled Notification',
                        body: '$selectedDate',
                        scheduledNotificationDateTime: selectedDate!,
                      );
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
                          )
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
    );
  }
}
