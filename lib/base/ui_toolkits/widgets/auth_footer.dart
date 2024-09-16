import 'package:flutter/material.dart';
import 'package:whatsapp_stacked/base/ui_toolkits/text/text_labellarge_black.dart';

/// Line at the bottom of register view which navigates to login page when tapped.

class AuthFooter extends StatelessWidget {
  /// Requires [button].
  /// Requires [message]
  /// Requires [ontap]
  const AuthFooter(
      {super.key,
      required this.button,
      required this.message,
      required this.ontap});

  ///  the text to be shown which is tappable to perform [ontap].
  final String button;

  ///  the text to be shown before [button].
  final String message;

  /// The function called when [button] is tapped.
  final void Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(message),
        GestureDetector(
          onTap: ontap,
          child: TextLabellargeBlack(
            text: button,
          ),
        )
      ],
    );
  }
}
