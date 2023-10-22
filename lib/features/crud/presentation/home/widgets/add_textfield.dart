import 'package:flutter/material.dart';
import 'package:to_do_list_app/features/crud/presentation/add/components/function.dart';

class AddTextField extends StatelessWidget {
  const AddTextField({
    required this.controller,
    required this.title,
    super.key,
    this.ontap,
  });

  final TextEditingController controller;
  final String title;
  final VoidCallback? ontap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validateInput,
      onTap: ontap,
      decoration: InputDecoration(
        labelText: title,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
