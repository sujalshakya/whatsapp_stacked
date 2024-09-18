import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:whatsapp_stacked/app/app.locator.dart';
import 'package:whatsapp_stacked/app/app.router.dart';

/// An individual chat box.
class MessageWidget extends StatelessWidget {
  final _navigationService = locator<NavigationService>();

  /// Text containing users first name.
  final String firstName;

  /// URL of profile picture converted to image using [NetworkImage].

  /// Text containing users last name.
  final int index;

  /// User id of chatter.
  final String uid;

  /// Requires [firstName]

  MessageWidget(
      {super.key,
      required this.firstName,
      required this.index,
      required this.uid});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _navigationService.navigateToMessageDetailView(
            firstName: firstName, index: index, uid: uid);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            Container(
                margin: const EdgeInsets.only(right: 16.0),
                child: const CircleAvatar(
                  radius: 20,
                )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        firstName,
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: Theme.of(context).colorScheme.onSurface),
                      )
                    ],
                  ),
                  const Text("Message")
                ],
              ),
            ),
            const Spacer(),
            Column(
              children: [
                // Static time
                const Text("14:24"),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Theme.of(context).colorScheme.onSecondary),
                    width: 25,
                    height: 25,

                    // Static number of messages.
                    child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 4, 0, 0),
                        child: Text(
                          "3",
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall
                              ?.copyWith(
                                  color:
                                      Theme.of(context).colorScheme.onSurface),
                        )),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
