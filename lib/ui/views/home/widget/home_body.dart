import 'package:flutter/material.dart';

/// Body part of [HomeView].
class HomeBody extends StatelessWidget {
  /// Contains the screens for all the tabbars.
  /// Message page is created where list of messages sent to user is shown [ChatsWidget] .
  /// Others pages remain to be built.
  const HomeBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TabBarView(children: [
      Column(
        children: [
          // ChatsWidget(users: context.watch<UserProvider>().users),
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'contact');
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
      ),

      /// A list of pages for tabbar yet to be made.
      const SizedBox(),
      const SizedBox(),
      const SizedBox(),
    ]);
  }
}
