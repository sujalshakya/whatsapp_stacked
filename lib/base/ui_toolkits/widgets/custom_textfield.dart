import 'package:flutter/material.dart';

/// Creates a custom textfield.
class CustomTextField extends StatelessWidget {
  /// Requires [controller].
  /// Requires [validator].

  const CustomTextField({
    super.key,

    /// Text written in text field.
    required this.controller,

    /// The rules to be followed while submitting [controller].
    required this.validator,
  });

  final TextEditingController controller;

  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          decoration: BoxDecoration(
              color: Colors.black12, borderRadius: BorderRadius.circular(12)),
          child: TextFormField(
            validator: validator,
            controller: controller,
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
          )),
    );
  }
}
