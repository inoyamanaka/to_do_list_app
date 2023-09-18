import 'package:flutter/material.dart';
import 'package:time_picker_sheet/widget/sheet.dart';
import 'package:time_picker_sheet/widget/time_picker.dart';
import 'package:to_do_list_app/infrastructure/theme/typography.dart';

Future<DateTime?> timePicker(BuildContext context) async {
  final selectedTime = await TimePicker.show<DateTime?>(
    context: context,
    sheet: TimePickerSheet(
      sheetTitle: 'Set meeting schedule',
      hourTitle: 'Hour',
      minuteTitle: 'Minute',
      saveButtonText: 'Save',
      minuteInterval: 1,
      initialDateTime: DateTime.now(),
      sheetCloseIconColor: const Color(0xff302727),
      wheelNumberSelectedStyle: MyTypography.bodySmall,
      wheelNumberItemStyle: MyTypography.bodySmall,
      hourTitleStyle: MyTypography.bodySmall,
      minuteTitleStyle: MyTypography.bodySmall,
      sheetTitleStyle: MyTypography.bodySmall,
      saveButtonColor: const Color(0xff302727),
    ),
  );

  return selectedTime;
}

Future<DateTime?> datePicker(BuildContext context) async {
  final selectedTime = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(1950),
    lastDate: DateTime(2100),
  );
  return selectedTime;
}
