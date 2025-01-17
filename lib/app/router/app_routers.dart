import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'routers_name.dart';

class AppRouter {
  static final GoRouter router =
      GoRouter(initialLocation: RouterName.rootScreen, routes: [
    GoRoute(
        path: RouterName.rootScreen,
        builder: (context, state) => const Scaffold(
              body: Center(
                child: Text('ADMIN PANEL'),
              ),
            ))
  ]);
}
