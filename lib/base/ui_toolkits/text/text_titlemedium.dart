import 'package:flutter/material.dart';

class TextTitleMedium extends StatelessWidget {
  final String text;

  /// Creates a [Text] widget that has fontsize of 16.
  /// The color of font is [ColorScheme.surface].
  /// Requires [text] which is shown when [TextTitleMedium] is called.

  const TextTitleMedium({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: Theme.of(context)
            .textTheme
            .titleMedium
            ?.copyWith(color: Theme.of(context).colorScheme.surface));
  }
}
