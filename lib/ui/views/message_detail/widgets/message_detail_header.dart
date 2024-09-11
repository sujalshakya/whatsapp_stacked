import 'package:flutter/material.dart';
import 'package:whatsapp_stacked/base/ui_toolkits/text/text_labellarge.dart';
import 'package:whatsapp_stacked/ui/views/message_detail/widgets/blue_container.dart';

class MessageDetailHeader extends StatelessWidget {
  const MessageDetailHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const BlueContainer(text: 'SEPTEMBER 05, 2024'),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Theme.of(context).colorScheme.secondary,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  Icon(
                    Icons.lock,
                    color: Theme.of(context).colorScheme.onSurface,
                    size: 16,
                  ),
                  const Flexible(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Messages to this chat and calls are now secured with end-to-end encryption. Tap for more info.",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: Theme.of(context).colorScheme.surface,
            ),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: LabelLarge(text: "1 UNREAD MESSAGE"),
            ),
          ),
        ),

        /// Divider
        Container(
          width: double.infinity,
          height: 0.5,
          color: Theme.of(context).colorScheme.onSurface,
        ),
        const BlueContainer(
          text: 'TODAY',
        ),
      ],
    );
  }
}
