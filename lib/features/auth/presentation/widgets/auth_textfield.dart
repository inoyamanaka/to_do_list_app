import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import 'package:to_do_list_app/features/auth/presentation/pages/login_page.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    required this.label,
    required this.icon,
    required this.controller,
    super.key,
    this.isPassword = false,
  });

  final String label;
  final Icon icon;
  final bool? isPassword;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: showPassword,
      builder: (context, value, child) => TextFormField(
        controller: controller,
        cursorColor: const Color(0xff171820),
        obscureText: isPassword! ? showPassword.value : false,
        decoration: InputDecoration(
          prefixIconColor: const Color.fromARGB(255, 9, 12, 35),
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          prefixIcon: icon,
          suffixIcon: isPassword!
              ? IconButton(
                  icon: Icon(
                    value ? Remix.eye_line : Remix.eye_off_line,
                    color: const Color(0xff171820),
                  ),
                  onPressed: () {
                    showPassword.value = !showPassword.value;
                  },
                )
              : null,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xff171820)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0xff171820),
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          labelStyle: const TextStyle(
            color: Color(
              0xff171820,
            ),
          ),
        ),
      ),
    );
  }
}
