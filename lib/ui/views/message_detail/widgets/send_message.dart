import 'package:flutter/material.dart';
import 'package:whatsapp_stacked/ui/views/message_detail/message_detail_view.form.dart';
import 'package:whatsapp_stacked/ui/views/message_detail/message_detail_viewmodel.dart';

class SendMessage extends StatelessWidget with $MessageDetailView {
  /// The row of widgets with textfield, button and floating action button.
  ///
  /// The textfield contains hint message and 3 icons:
  /// [Icons.send] to call the [addMessage] method.
  /// [Icons. attach_file] and [Icons.camera_alt] yet to be implemented.
  /// The button adds controller text to messages list.
  /// Requires [vm]
  const SendMessage({super.key, required this.vm});

  /// [ViewModel] of the current view.
  final MessageDetailViewModel vm;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(24),
              ),
              width: 310,
              child: TextField(
                controller: messageController,
                decoration: InputDecoration(
                  suffixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: () {
                          vm.addMessage();
                        },
                        child: const Icon(Icons.send),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.attach_file,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.camera_alt),
                      ),
                    ],
                  ),
                  icon: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.emoji_emotions_outlined,
                      color: Colors.grey,
                    ),
                  ),
                  hintText: "Type a message",
                  contentPadding: const EdgeInsets.symmetric(vertical: 16),
                  hintStyle: Theme.of(context)
                      .textTheme
                      .labelLarge
                      ?.copyWith(color: Colors.grey),
                  border: InputBorder.none,
                ),
              )),
        ),
        FloatingActionButton(
          onPressed: () {},
          backgroundColor: Theme.of(context).colorScheme.onSecondary,
          foregroundColor: Theme.of(context).colorScheme.surface,
          shape: const CircleBorder(),
          child: const Icon(Icons.mic),
        )
      ],
    );
  }
}
