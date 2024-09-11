import 'package:flutter/material.dart';

import 'package:whatsapp_stacked/base/models/user.dart';
import 'package:whatsapp_stacked/base/ui_toolkits/widgets/message.dart';

/// This is used to build list of user chats.

class ChatsWidget extends StatelessWidget {
  /// Creates individual ListView by using the [MessageWidget]
  /// Uses the index in list to separate data of each widget.
  /// Requires [users]
  const ChatsWidget({
    super.key,
    required this.users,
  });

  /// List of user data.
  final UserData users;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 450,
      child: ListView.builder(
          itemCount: users.data!.length,
          itemBuilder: (context, index) {
            final user = users.data![index];
            return MessageWidget(
              firstName: user.firstName,
              avatar: user.avatar,
              lastName: user.lastName,
            );
          }),
    );
  }
}
