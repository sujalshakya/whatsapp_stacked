import 'package:flutter/material.dart';
import 'package:whatsapp_stacked/base/ui_toolkits/widgets/chats.dart';
import 'package:whatsapp_stacked/ui/views/contact/contact_viewmodel.dart';
import 'package:whatsapp_stacked/ui/views/contact/widget/contact_group.dart';

class ContactBody extends StatelessWidget {
  const ContactBody({super.key, required this.vm});

  /// [ViewModel] of the current view.
  final ContactViewModel vm;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text("Create"),
            ),
          ],
        ),
        const ContactGroup(
          text: 'New Group',
          icon: Icons.people,
        ),
        const ContactGroup(
          text: 'New Contact',
          icon: Icons.people,
        ),
        const ContactGroup(
          text: 'New Community',
          icon: Icons.people,
        ),
        const Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text("Discover"),
            ),
          ],
        ),
        const ContactGroup(
          text: 'Businesses',
          icon: Icons.house,
        ),
        const Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text("Contacts on WhatsApp"),
            ),
          ],
        ),
        vm.isBusy
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ChatsWidget(
                users: vm.users,
              )
      ],
    );
  }
}
