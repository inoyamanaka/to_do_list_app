import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:remixicon/remixicon.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:to_do_list_app/features/crud/controller/crud_controller.dart';
import 'package:to_do_list_app/features/crud/presentation/add/components/function.dart';
import 'package:to_do_list_app/features/crud/presentation/add/widgets/add_textfield.dart';
import 'package:to_do_list_app/features/crud/presentation/add/widgets/button.dart';
import 'package:to_do_list_app/features/crud/presentation/add/widgets/chip_card.dart';
import 'package:to_do_list_app/features/crud/presentation/add/widgets/time_picker.dart';
import 'package:to_do_list_app/infrastructure/theme/typography.dart';

class ActivityTabForm extends StatelessWidget {
  const ActivityTabForm({
    required this.formKey,
    required this.nameInput,
    required this.dateInput,
    required this.startInput,
    required this.finishInput,
    required this.optionSelected,
    required this.categoryIndex,
    required this.activity,
    required this.categoryOnGoing,
    required this.selectedDate,
    super.key,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController nameInput;
  final TextEditingController dateInput;
  final TextEditingController startInput;
  final TextEditingController finishInput;
  final ValueNotifier<String> optionSelected;
  final ValueNotifier<int> categoryIndex;
  final CrudController activity;
  final int categoryOnGoing;
  final DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    DateTime selectedDateFinal;

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
                    'Information',
                    style: MyTypography.bodySmall,
                  ),
                ),
                SizedBox(height: 15.h),
                AddTextField(
                  controller: nameInput,
                  title: 'Name',
                  suffixIcon: const Icon(Remix.focus_2_line),
                ),
                SizedBox(height: 15.h),
                AddTextField(
                  controller: dateInput,
                  title: 'Date',
                  ontap: () async {
                    FocusScope.of(context).requestFocus(FocusNode());
                    final pickedDate = await datePicker(context);
                    final formattedDate =
                        DateFormat('dd MMMM yyyy').format(pickedDate!);
                    dateInput.text = formattedDate;
                  },
                  suffixIcon: const Icon(Remix.calendar_2_line),
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
                  suffixIcon: const Icon(Remix.calendar_2_line),
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
                  suffixIcon: const Icon(Remix.time_line),
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
                SizedBox(height: 25.h),
                SubmitButton(
                  title: 'Create Task',
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      selectedDateFinal = parseAndFormatDate(
                        dateInput.text,
                        startInput.text,
                      );
                      await updateStatisticActivity(
                        context,
                        activity,
                        optionSelected.value,
                        categoryOnGoing,
                        nameInput,
                        dateInput,
                        startInput,
                        finishInput,
                        selectedDateFinal,
                      );
                    }
                  },
                ),
                SizedBox(height: 35.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
