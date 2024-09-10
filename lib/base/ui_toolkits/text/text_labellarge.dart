import 'package:flutter/material.dart';

class LabelLarge extends StatelessWidget {
  /// Creates a [Text] widget that has fontsize of 14.
  /// The color of font is [ColorScheme.onSurface].
  /// Requires [text] which is shown when [LabelLarge] is called.

  const LabelLarge({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context)
          .textTheme
          .labelLarge
          ?.copyWith(color: Theme.of(context).colorScheme.onSurface),
    );
  }
}
