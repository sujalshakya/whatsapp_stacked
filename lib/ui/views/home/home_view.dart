import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:whatsapp_stacked/app/app.locator.dart';
import 'package:whatsapp_stacked/app/app.router.dart';
import 'package:whatsapp_stacked/base/ui_toolkits/widgets/chats.dart';
import 'package:whatsapp_stacked/services/token_storage_service.dart';
import 'package:whatsapp_stacked/ui/views/home/widget/home_body.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  HomeView({Key? key}) : super(key: key);
  final _tokenService = locator<TokenStorageService>();
  final _navigationService = locator<NavigationService>();

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          appBar: AppBar(
            /// 4 tabbars 1 icon and 3 text.

            bottom: TabBar(tabs: [
              Tab(
                icon: Icon(
                  Icons.people,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              const Tab(text: 'CHATS'),
              const Tab(text: 'CALLS'),
              const Tab(text: 'STATUS'),
            ]),
            leading: Container(),
            backgroundColor: Theme.of(context).colorScheme.onSecondary,
            title: Text(
              "WhatsApp",
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium
                  ?.copyWith(color: Theme.of(context).colorScheme.surface),
            ),
            centerTitle: false,
            leadingWidth: 0,
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () async {
                    _navigationService.replaceWithLoginView();
                    await _tokenService.deleteToken('token');
                  },
                  child: Icon(
                    Icons.logout,
                    color: Theme.of(context).colorScheme.surface,
                  ),
                ),
              ),

              /// Toggle theme of app.
              GestureDetector(
                onTap: () {
                  // Provider.of<ThemeProvider>(context, listen: false)
                  //     .changeTheme();
                },
                child: Icon(
                  Icons.more_vert,
                  color: Theme.of(context).colorScheme.surface,
                ),
              )
            ],
          ),
          body: TabBarView(children: [
            Column(
              children: [
                ChatsWidget(users: viewModel.users),
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
            ),

            /// A list of pages for tabbar yet to be made.
            const SizedBox(),
            const SizedBox(),
            const SizedBox(),
          ])),
    );
  }

  @override
  void onViewModelReady(HomeViewModel viewModel) => SchedulerBinding.instance
      .addPostFrameCallback((timeStamp) => viewModel.fetchUsers());

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
