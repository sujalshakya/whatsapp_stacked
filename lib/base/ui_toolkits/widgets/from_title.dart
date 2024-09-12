import 'package:flutter/material.dart';

class FormTitle extends StatelessWidget {
  /// The text that shows waht the text field is for.
  /// Requires [text]
  const FormTitle({
    super.key,
    required this.text,
  });

  /// Title of Text Field.
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(text),
    );
  }
}
