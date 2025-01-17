import 'package:admin_ecommerce_app/pages/argument_page/argument_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'routers_name.dart';

class AppRouter {
  static final GoRouter router =
      GoRouter(initialLocation: RouterName.rootScreen, routes: [
    GoRoute(
        path: RouterName.rootScreen,
        builder: (context, state) => Scaffold(
              body: Center(
                  child: TextButton(
                      onPressed: () {
                        context.go(RouterName.argumentScreen,
                            extra: 'Argument');
                      },
                      child: const Text('ArgumentScreen'))),
            )),
    GoRoute(
      path: RouterName.argumentScreen,
      builder: (context, state) {
        final String extraData = state.extra as String;
        return ArgumentScreen(text: extraData);
      },
    )
  ]);
}
