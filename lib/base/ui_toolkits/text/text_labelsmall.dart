import 'package:flutter/material.dart';

class TextLabelSmall extends StatelessWidget {
  final String text;

  /// Creates a [Text] widget that has fontsize of 11.
  /// The color of font is [ColorScheme.onSurface].
  /// Requires [text] which is shown when [TextLabelSmall] is called.

  const TextLabelSmall({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context)
          .textTheme
          .labelSmall
          ?.copyWith(color: Theme.of(context).colorScheme.onSurface),
    );
  }
}
