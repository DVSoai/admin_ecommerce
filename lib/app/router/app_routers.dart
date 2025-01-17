import 'package:admin_ecommerce_app/pages/root_page/root_page.dart';
import 'package:admin_ecommerce_app/pages/second_page/second_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'routers_name.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
      initialLocation: RouterName.rootScreen,
      routes: [
        GoRoute(
            path: RouterName.rootScreen,
            builder: (context, state) => const RootPage()),
        GoRoute(
          path: RouterName.secondPage,
          name: RouterName.secondPage,
          builder: (context, state) {
            final String argumentExtra =
                state.extra is String ? state.extra as String : '';
            final String device = state.uri.queryParameters['device'] ?? '';
            final String id = state.uri.queryParameters['id'] ?? '';
            final String name = state.uri.queryParameters['name'] ?? '';
            // final String device = state.pathParameters['device'] ?? '';
            // final String id = state.pathParameters['id'] ?? '';
            // final String name = state.pathParameters['name'] ?? '';
            return SecondPage(
              argument: argumentExtra,
              device: device,
              id: id,
              name: name,
            );
          },
        )
      ],
      // Định nghĩa redirection logic:
      redirect: (context, state) async {},

      //theo dõi điều hướng và ghi đè
      observers: [RouteObserver()]);
}
