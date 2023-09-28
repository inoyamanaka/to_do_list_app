import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:to_do_list_app/features/crud/controller/crud_controller.dart';
import 'package:to_do_list_app/features/crud/presentation/add/components/function.dart';
import 'package:to_do_list_app/infrastructure/theme/typography.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    required this.formKey,
    required this.activity,
    required this.optionSelected,
    required this.categoryOnGoing,
    required this.nameInput,
    required this.dateInput,
    required this.startInput,
    required this.finishInput,
    required this.selectedDate,
    super.key,
  });

  final GlobalKey<FormState> formKey;
  final CrudController activity;
  final String optionSelected;
  final int categoryOnGoing;
  final TextEditingController nameInput;
  final TextEditingController dateInput;
  final TextEditingController startInput;
  final TextEditingController finishInput;
  final DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (formKey.currentState!.validate()) {
          await updateStatisticActivity(
            context,
            activity,
            optionSelected,
            categoryOnGoing,
            nameInput,
            dateInput,
            startInput,
            finishInput,
            selectedDate!,
          );
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
    );
  }
}
