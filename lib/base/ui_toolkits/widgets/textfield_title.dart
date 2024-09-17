import 'package:flutter/material.dart';

class TextFieldTitleText extends StatelessWidget {
  /// The text that shows what to input for users.
  /// Requires [text]
  const TextFieldTitleText({
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
