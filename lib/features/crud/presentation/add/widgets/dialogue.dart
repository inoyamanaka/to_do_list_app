import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

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
        child: Text(
          description,
          style: const TextStyle(fontStyle: FontStyle.italic),
        ),
      ),
      title: title,
      btnOkColor: Colors.red,
      btnOkOnPress: btnOkOnPress,
    ).show();
  }
}
