import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:whatsapp_stacked/app/app.locator.dart';
import 'package:whatsapp_stacked/app/app.router.dart';
import 'package:whatsapp_stacked/base/ui_toolkits/widgets/chats.dart';
import 'package:whatsapp_stacked/ui/views/home/home_viewmodel.dart';

class PeopleTabBar extends StatelessWidget {
  PeopleTabBar({super.key, required this.vm});

  /// [ViewModel] of the current view.
  final HomeViewModel vm;
  final _navigationService = locator<NavigationService>();

  @override
  Widget build(BuildContext context) {
    return vm.isBusy
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Column(
            children: [
              SizedBox(height: 450, child: ChatsWidget(users: vm.users)),
              const SizedBox(
                height: 30,
              ),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 32),
                    child: FloatingActionButton(
                      onPressed: () {
                        _navigationService.navigateToContactView();
                      },
                      backgroundColor:
                          Theme.of(context).colorScheme.onSecondary,
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
