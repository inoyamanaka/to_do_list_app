import 'package:flutter/material.dart';
import 'package:to_do_list_app/features/crud/presentation/add/components/function.dart';

class AddTextField extends StatelessWidget {
  const AddTextField({
    required this.controller,
    required this.title,
    required this.suffixIcon,
    super.key,
    this.ontap,
    this.isDescription = false,
  });

  final TextEditingController controller;
  final String title;
  final VoidCallback? ontap;
  final bool? isDescription;
  final Icon suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validateInput,
      onTap: ontap,
      maxLines: isDescription! ? 8 : 1,
      decoration: InputDecoration(
        labelText: title,
        isDense: true,
        alignLabelWithHint: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        suffixIcon: suffixIcon,
      ),
    );
  }
}
