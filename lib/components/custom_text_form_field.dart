import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  TextInputType? keyboardType;
  void Function()? onTap;
  bool readOnly;
  Widget? suffixIcon;
  final String? Function(String?) validator;
  CustomTextFormField(
      {super.key,
      required this.controller,
      required this.label,
      this.keyboardType,
      this.onTap,
      this.suffixIcon,
      this.readOnly = false,
      required this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
        label: Text(label),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(25.0),
          ),
        ),
        suffixIcon: suffixIcon,
      ),
      onTap: onTap,
      readOnly: readOnly,
    );
  }
}
