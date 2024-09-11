import 'package:flutter/material.dart';
import 'package:whatsapp_stacked/base/ui_toolkits/widgets/chats.dart';
import 'package:whatsapp_stacked/ui/views/contact/widget/contact_group.dart';

class ContactBody extends StatelessWidget {
  const ContactBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text("Create"),
              ),
            ],
          ),
          ContactGroup(
            text: 'New Group',
            icon: Icons.people,
          ),
          ContactGroup(
            text: 'New Contact',
            icon: Icons.people,
          ),
          ContactGroup(
            text: 'New Community',
            icon: Icons.people,
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text("Discover"),
              ),
            ],
          ),
          ContactGroup(
            text: 'Businesses',
            icon: Icons.house,
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text("Contacts on WhatsApp"),
              ),
            ],
          ),

          /// A list of list tiles with user data.
          // ChatsWidget(users: context.read<UserProvider>().users)
        ],
      ),
    );
  }
}
