import 'package:flutter/material.dart';

///Widget that shows a listtile that shows different texts and icons.

class ContactGroup extends StatelessWidget {
  /// Requires [icon].
  /// Requires [text].

  const ContactGroup({
    required this.text,
    super.key,
    required this.icon,
  });

  /// The image at the start of row.
  final IconData icon;

  /// The text after the icon
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Theme.of(context).colorScheme.onSecondary),
              child: Icon(
                icon,
                size: 28,
                color: Theme.of(context).colorScheme.surface,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
          ),
        ],
      ),
    );
  }
}
