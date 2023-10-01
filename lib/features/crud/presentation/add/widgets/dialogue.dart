import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list_app/infrastructure/theme/typography.dart';

class DialogueBox {
  static void show({
    required BuildContext context,
    required String title,
    required String description,
    required VoidCallback btnOkOnPress,
    required DialogType type,
  }) {
    AwesomeDialog(
      context: context,
      dialogType: type,
      animType: AnimType.rightSlide,
      headerAnimationLoop: false,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: MyTypography.bodySmall.copyWith(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ),
      title: title,
      btnOkText: 'OK',
      btnOkColor: Colors.red,
      btnOkOnPress: btnOkOnPress,
    ).show();
  }
}
