import 'package:flutter/material.dart';
import 'package:whatsapp_stacked/base/ui_toolkits/text/text_labellarge_black.dart';

/// Line at the bottom of register view which navigates to login page when tapped.

class AuthFooter extends StatelessWidget {
  /// Requires [tap] which is the text to be shown which is tappable to perform [ontap].
  /// Requires [message] which is the text to be shown before [tap].
  /// Requires [ontap] which is the task called when [tap] is tapped.
  const AuthFooter(
      {super.key,
      required this.tap,
      required this.message,
      required this.ontap});

  final String tap;
  final String message;
  final void Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(message),
        GestureDetector(
          onTap: () {},
          child: TextLabellargeBlack(
            text: tap,
          ),
        )
      ],
    );
  }
}
