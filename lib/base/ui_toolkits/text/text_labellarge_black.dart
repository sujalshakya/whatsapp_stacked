import 'package:flutter/material.dart';

class TextLabellargeBlack extends StatelessWidget {
  /// Creates a [Text] widget that has fontsize of 14.
  /// Requires [text] which is shown when [TextLabellargeBlack] is called.

  final String text;

  const TextLabellargeBlack({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.labelLarge,
    );
  }
}
