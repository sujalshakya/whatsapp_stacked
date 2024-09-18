import 'package:flutter/material.dart';
import 'package:whatsapp_stacked/ui/views/message_detail/message_detail_viewmodel.dart';

/// Shows messages alternatingly in different colored containers.

// ignore: must_be_immutable
class MessagesWidget extends StatelessWidget {
  /// Requires [messages].
  /// The odd indexed message in [messages] which signifies message
  /// sent to user is [ColorScheme.surface] in color.
  /// The even indexed message in [messages] which signifies message
  /// sent by user is [ColorScheme.secondary] in color.
  MessagesWidget({
    super.key,
    required this.vm,
  });

  /// viewmodel of view
  MessageDetailViewModel vm;
  @override
  Widget build(BuildContext context) {
    return vm.busy(true)
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : vm.sameList
            ? Expanded(
                child: ListView.builder(
                  reverse: true,
                  itemCount: vm.userMessages.length,
                  itemBuilder: (context, index) {
                    final messageData = vm.userMessages[index];
                    final message = messageData.message;
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
                            child: Text(message!),
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
                  itemCount: vm.allMessages.length,
                  itemBuilder: (context, index) {
                    final isUserMessage =
                        vm.userMessages.contains(vm.allMessages[index]);
                    final messageData = vm.allMessages[index];
                    final message = messageData.message;
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
                            child: Text(message!),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
  }
}
