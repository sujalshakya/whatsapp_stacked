import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:whatsapp_stacked/base/theme_provider.dart';
import 'package:whatsapp_stacked/base/ui_toolkits/widgets/chats.dart';
import 'package:whatsapp_stacked/ui/views/contact/widget/contact_body.dart';
import 'contact_viewmodel.dart';

class ContactView extends StackedView<ContactViewModel> {
  const ContactView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ContactViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onSecondary,
        leading: Icon(
          Icons.arrow_back,
          color: Theme.of(context).colorScheme.surface,
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select contact",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: Theme.of(context).colorScheme.surface),
            ),
            Text(
              "256 contacts",
              style: Theme.of(context)
                  .textTheme
                  .labelSmall
                  ?.copyWith(color: Theme.of(context).colorScheme.surface),
            )
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.search,
              color: Theme.of(context).colorScheme.surface,
            ),
          ),
          // Toggle theme of app.
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ContactBody(),

            /// A list of list tiles with user data.
            ChatsWidget(
              users: viewModel.users,
            )
          ],
        ),
      ),
    );
  }

  @override
  void onViewModelReady(ContactViewModel viewModel) => SchedulerBinding.instance
      .addPostFrameCallback((timeStamp) => viewModel.fetchUsers());
  @override
  ContactViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ContactViewModel();
}
