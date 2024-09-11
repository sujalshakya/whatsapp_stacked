import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_stacked/base/ui_toolkits/text/text_labellarge.dart';
import 'package:whatsapp_stacked/ui/views/message_detail/widgets/blue_container.dart';
import 'package:whatsapp_stacked/ui/views/message_detail/widgets/messages_widget.dart';
import 'package:whatsapp_stacked/ui/views/message_detail/widgets/send_message.dart';

class MessageDetailBody extends StatelessWidget {
  /// The body of the MessageDetail View
  /// Contains the containers data about the [messages].
  /// Contains the list of messages i.e. [MessagesWidget].
  /// Contains the widget that is used to send messages i.e. [SendMessage].
  const MessageDetailBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.onError),
      child: Column(
        children: [
          /// Date
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

          /// Display list of messages.
          // MessagesWidget(messages: context.watch<MessageViewModel>().messages),

          /// Add text to list.
          const SendMessage(),
        ],
      ),
    );
  }
}
