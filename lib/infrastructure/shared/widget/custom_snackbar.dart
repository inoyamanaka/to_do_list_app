import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remixicon/remixicon.dart';
import 'package:to_do_list_app/infrastructure/theme/typography.dart';

enum SnackbarType {
  info,
  warning,
  success,
  error,
}

class TodoSnackbar {
  const TodoSnackbar({
    required this.title,
    required this.message,
    required this.type,
  });

  final String title;
  final String message;
  final SnackbarType type;

  void show() {
    Color backgroundColor;
    switch (type) {
      case SnackbarType.info:
        backgroundColor = const Color(0xff1584CB);
      case SnackbarType.warning:
        backgroundColor = const Color(0xffFFD159);
      case SnackbarType.success:
        backgroundColor = const Color(0xff3ABD9F);
      case SnackbarType.error:
        backgroundColor = const Color(0xffF4B50F);
    }

    Icon icon;
    switch (type) {
      case SnackbarType.info:
        icon = const Icon(Remix.checkbox_circle_fill);
      case SnackbarType.warning:
        icon = const Icon(Remix.checkbox_circle_fill);
      case SnackbarType.success:
        icon = const Icon(Remix.checkbox_circle_fill);
      case SnackbarType.error:
        icon = const Icon(Remix.checkbox_circle_fill);
    }

    Get.rawSnackbar(
      padding: EdgeInsets.zero,
      margin: const EdgeInsets.symmetric(horizontal: 12),
      messageText: Container(
        padding: const EdgeInsets.only(left: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: backgroundColor,
        ),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
              child: Container(
                padding: const EdgeInsets.only(
                  left: 24,
                  top: 12,
                  bottom: 12,
                  right: 24,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: MyTypography.bodyLarge
                              .copyWith(fontSize: 16, color: Colors.white),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          message,
                          style: MyTypography.bodyLarge
                              .copyWith(fontSize: 12, color: Colors.white),
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: null,
                      icon: icon,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      snackPosition: SnackPosition.TOP,
      backgroundColor: backgroundColor,
      borderRadius: 10,
      boxShadows: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 5,
          blurRadius: 7,
          offset: const Offset(0, 3),
        ),
      ],
    );
  }
}
