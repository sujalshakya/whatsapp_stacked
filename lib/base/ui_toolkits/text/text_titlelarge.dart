import 'package:flutter/material.dart';

class TextTitleLarge extends StatelessWidget {
  /// Creates a [Text] widget that has fontsize of 22.
  /// The color of font is [ColorScheme.surface].
  /// Requires [text] which is shown when [TextTitleLarge] is called.

  final String text;

  const TextTitleLarge({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: Theme.of(context)
            .textTheme
            .titleLarge
            ?.copyWith(color: Theme.of(context).colorScheme.surface));
  }
}
