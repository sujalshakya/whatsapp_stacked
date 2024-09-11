import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'message_detail_viewmodel.dart';

class MessageDetailView extends StackedView<MessageDetailViewModel> {
  const MessageDetailView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    MessageDetailViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      ),
    );
  }

  @override
  MessageDetailViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      MessageDetailViewModel();
}
