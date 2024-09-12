import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:whatsapp_stacked/base/theme_provider.dart';
import 'package:whatsapp_stacked/base/ui_toolkits/text/text_titlelarge.dart';
import 'package:whatsapp_stacked/base/ui_toolkits/text/text_titlemedium.dart';
import 'package:whatsapp_stacked/ui/views/message_detail/message_detail_view.form.dart';
import 'package:whatsapp_stacked/ui/views/message_detail/widgets/message_detail_header.dart';
import 'package:whatsapp_stacked/ui/views/message_detail/widgets/messages_widget.dart';

import 'message_detail_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'message'),
])
class MessageDetailView extends StackedView<MessageDetailViewModel>
    with $MessageDetailView {
  const MessageDetailView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    MessageDetailViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onSecondary,
        leading: Row(
          children: [
            Icon(Icons.arrow_back,
                color: Theme.of(context).colorScheme.surface),
            Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Theme.of(context).colorScheme.surface,
              ),
            ),
          ],
        ),
        title: const Column(
          children: [
            Row(
              children: [
                TextTitleLarge(text: "Name"),
              ],
            ),
            Row(
              children: [TextTitleMedium(text: "Online")],
            ),
          ],
        ),
        actions: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.video_call,
                  color: Theme.of(context).colorScheme.surface)),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.phone,
                  color: Theme.of(context).colorScheme.surface)),

          /// Toggle theme of app.
          GestureDetector(
              onTap: () {
                Provider.of<ThemeProvider>(context, listen: false)
                    .changeTheme();
              },
              child: Icon(
                Icons.more_vert,
                color: Theme.of(context).colorScheme.surface,
              ))
        ],
      ),
      body: Container(
        decoration: BoxDecoration(color: Theme.of(context).colorScheme.onError),
        child: Column(
          children: [
            const MessageDetailHeader(),

            /// Display list of messages.
            MessagesWidget(messages: viewModel.messages),

            /// Add text to list.
            Row(
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
                                  viewModel.addMessage();
                                },
                                child: const Icon(Icons.send),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.attach_file,
                                  color:
                                      Theme.of(context).colorScheme.onSurface,
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
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 16),
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
            )
          ],
        ),
      ),
    );
  }

  @override
  MessageDetailViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      MessageDetailViewModel();
}
