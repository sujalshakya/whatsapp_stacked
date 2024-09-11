import 'package:flutter/material.dart';

class BlueContainer extends StatelessWidget {
  /// Blue colored Container that requires [text].
  /// Padding of 8 on all side of the [text].
  /// Padding of 8 around the [BlueContainer].
  const BlueContainer({super.key, required this.text});

  /// Text to be displayed in container.
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(text),
        ),
      ),
    );
  }
}
