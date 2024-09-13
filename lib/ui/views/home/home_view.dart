import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:whatsapp_stacked/app/app.locator.dart';
import 'package:whatsapp_stacked/app/app.router.dart';
import 'package:whatsapp_stacked/base/theme_provider.dart';
import 'package:whatsapp_stacked/services/token_storage_service.dart';
import 'package:whatsapp_stacked/ui/views/home/widget/people_tabbar.dart';
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
            /// 4 tabbars with 1 icon and 3 text.

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
                  Provider.of<ThemeProvider>(context, listen: false)
                      .changeTheme();
                },
                child: Icon(
                  Icons.more_vert,
                  color: Theme.of(context).colorScheme.surface,
                ),
              )
            ],
          ),
          body: TabBarView(children: [
            PeopleTabBar(vm: viewModel),

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
