import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:whatsapp_stacked/base/theme_provider.dart';
import 'package:whatsapp_stacked/base/ui_toolkits/text/text_titlelarge.dart';
import 'package:whatsapp_stacked/ui/views/message_detail/widgets/messages_widget.dart';
import 'package:whatsapp_stacked/ui/views/message_detail/widgets/send_message.dart';
import 'message_detail_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'message'),
])
class MessageDetailView extends StackedView<MessageDetailViewModel> {
  final String firstName;
  final String uid;
  final int index;
  const MessageDetailView(
      {Key? key,
      required this.firstName,
      required this.uid,
      required this.index})
      : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    MessageDetailViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onSecondary,
        leadingWidth: 70,
        leading: Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
              child: Container(
                  margin: const EdgeInsets.only(right: 16.0),
                  child: const CircleAvatar(
                    radius: 22,
                  )),
            ),
          ],
        ),
        title: Column(
          children: [
            Row(
              children: [
                TextTitleLarge(text: firstName),
              ],
            ),
            Row(
              children: [
                Text("Online",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).colorScheme.surface))
              ],
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
        height: 750,
        decoration: BoxDecoration(color: Theme.of(context).colorScheme.onError),
        child: Column(
          children: [
            /// Display list of messages.

            MessagesWidget(vm: viewModel),

            /// Add text to list.
            SendMessage(vm: viewModel),
          ],
        ),
      ),
    );
  }

  @override
  void onViewModelReady(MessageDetailViewModel viewModel) =>
      SchedulerBinding.instance
          .addPostFrameCallback((timeStamp) => viewModel.fetchMessages());

  @override
  MessageDetailViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      MessageDetailViewModel(uid: uid);
}
