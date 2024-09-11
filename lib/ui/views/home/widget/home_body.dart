import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:whatsapp_stacked/app/app.locator.dart';
import 'package:whatsapp_stacked/app/app.router.dart';

class TabBar2 extends StatelessWidget {
  TabBar2({
    super.key,
  });
  final _navigationService = locator<NavigationService>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            color: Colors.grey,
            height: 2,
            width: 380,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.lock,
                size: 12,
              ),
              const Text(" Your personal messages are "),
              Text(
                "end to end encrypted",
                style: Theme.of(context)
                    .textTheme
                    .labelLarge
                    ?.copyWith(color: Colors.blue),
              )
            ],
          ),
        ),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
              child: FloatingActionButton(
                onPressed: () {
                  _navigationService.navigateToContactView();
                },
                backgroundColor: Theme.of(context).colorScheme.onSecondary,
                foregroundColor: Theme.of(context).colorScheme.surface,
                shape: const CircleBorder(),
                child: const Icon(Icons.message),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
