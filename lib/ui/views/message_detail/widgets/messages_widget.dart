import 'package:flutter/material.dart';

/// Shows messages alternatingly in different colored containers.

class MessagesWidget extends StatelessWidget {
  /// Requires [messages].
  /// The odd indexed message in [messages] which signifies message
  /// sent to user is [ColorScheme.surface] in color.
  /// The even indexed message in [messages] which signifies message
  /// sent by user is [ColorScheme.secondary] in color.
  const MessagesWidget(
      {super.key,
      required this.messages,
      required this.otherMessages,
      required this.allMessages,
      required this.sameList});

  /// List of texts added by the user
  final List<Map<String, dynamic>> messages;
  final List<Map<String, dynamic>> otherMessages;
  final List<Map<String, dynamic>> allMessages;
  final bool sameList;
  @override
  Widget build(BuildContext context) {
    return sameList
        ? Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final messageData = messages[index];
                final message = messageData['message'];
                return Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      width: 150,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(message),
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        : Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: allMessages.length,
              itemBuilder: (context, index) {
                final isUserMessage = messages.contains(allMessages[index]);
                final messageData = allMessages[index];
                final message = messageData['message'];
                return Align(
                  alignment: isUserMessage
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: isUserMessage
                            ? Theme.of(context).colorScheme.secondary
                            : Theme.of(context).colorScheme.surface,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      width: 150,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(message),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
  }
}
