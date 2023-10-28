import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:to_do_list_app/features/crud/controller/crud_controller.dart';
import 'package:to_do_list_app/features/crud/data/models/request/local/local_project_request.dart';
import 'package:to_do_list_app/features/crud/presentation/add/widgets/add_textfield.dart';
import 'package:to_do_list_app/features/crud/presentation/add/widgets/button.dart';
import 'package:to_do_list_app/features/crud/presentation/add/widgets/chip_card.dart';
import 'package:to_do_list_app/features/crud/presentation/add/widgets/time_picker.dart';
import 'package:to_do_list_app/features/crud/presentation/home/components/function.dart';
import 'package:to_do_list_app/features/crud/presentation/home/pages/home_page.dart';
import 'package:to_do_list_app/infrastructure/shared/widget/custom_snackbar.dart';
import 'package:to_do_list_app/infrastructure/theme/typography.dart';

class ProjectTabForm extends StatelessWidget {
  const ProjectTabForm({
    required this.formKey,
    required this.nameInput,
    required this.startInput,
    required this.finishInput,
    required this.optionSelected,
    required this.categoryIndex,
    required this.activity,
    required this.categoryOnGoing,
    required this.selectedDate,
    required this.projectName,
    required this.projectDate,
    required this.projectDes,
    super.key,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController projectName;
  final TextEditingController projectDes;
  final TextEditingController projectDate;
  final TextEditingController nameInput;
  final TextEditingController startInput;
  final TextEditingController finishInput;
  final ValueNotifier<String> optionSelected;
  final ValueNotifier<int> categoryIndex;
  final CrudController activity;
  final int categoryOnGoing;
  final DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return ShowUpAnimation(
      child: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 15.h),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Project Information',
                    style: MyTypography.bodySmall,
                  ),
                ),
                SizedBox(height: 15.h),
                AddTextField(
                  controller: projectName,
                  title: 'Name',
                ),
                SizedBox(height: 15.h),
                AddTextField(
                  controller: projectDate,
                  title: 'Date',
                  ontap: () async {
                    FocusScope.of(context).requestFocus(FocusNode());
                    final pickedDate = await datePicker(context);
                    final formattedDate =
                        DateFormat('dd MMMM yyyy').format(pickedDate!);
                    projectDate.text = formattedDate;
                  },
                ),
                SizedBox(height: 15.h),
                AddTextField(
                  controller: projectDes,
                  title: 'Description',
                  isDescription: true,
                ),
                SizedBox(height: 15.h),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Activity Information',
                    style: MyTypography.bodySmall,
                  ),
                ),
                SizedBox(height: 15.h),
                AddTextField(
                  controller: nameInput,
                  title: 'Name',
                ),
                SizedBox(height: 15.h),
                AddTextField(
                  controller: startInput,
                  title: 'Start Time',
                  ontap: () async {
                    FocusScope.of(context).requestFocus(FocusNode());
                    final result = await timePicker(context);
                    final formattedDate = DateFormat.Hm().format(result!);
                    startInput.text = formattedDate;
                  },
                ),
                SizedBox(height: 15.h),
                AddTextField(
                  controller: finishInput,
                  title: 'Finish Time',
                  ontap: () async {
                    FocusScope.of(context).requestFocus(FocusNode());
                    final result = await timePicker(context);
                    final formattedDate = DateFormat.Hm().format(result!);
                    finishInput.text = formattedDate;
                  },
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
                      return ValueListenableBuilder(
                        valueListenable: optionSelected,
                        builder: (context, value, child) => ChoiceChip(
                          label: Text(
                            options[index],
                            style: index == categoryIndex.value
                                ? const TextStyle(
                                    color: Colors.white,
                                  )
                                : const TextStyle(
                                    color: Colors.black,
                                  ),
                          ),
                          selectedColor: const Color(0xff302727),
                          selected: categoryIndex.value == index,
                          onSelected: (bool selected) {
                            optionSelected.value = options[index];
                            categoryIndex.value = (selected ? index : null)!;
                          },
                        ),
                      );
                    },
                  ).toList(),
                ),
                SizedBox(height: 15.h),
                SubmitButton(
                  title: 'Create Task',
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      await result.addProject(
                        ProjectActivity(
                          projectId:
                              DateTime.now().microsecondsSinceEpoch.toString(),
                          projectDate: projectDate.text,
                          projectDescription: projectDes.text,
                          projectName: projectName.text,
                          projectDataActivity: [
                            ProjectDataActivity(
                              projectDataName: nameInput.text,
                              projectStartTime: startInput.text,
                              projectFinishTime: finishInput.text,
                            ),
                          ],
                        ),
                      );
                      if (context.mounted) {
                        const TodoSnackbar(
                          title: 'Pemberitahuan',
                          message: 'Project berhasil ditambahkan',
                          type: SnackbarType.success,
                        ).show();
                      }
                      await fetchDataproject();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
