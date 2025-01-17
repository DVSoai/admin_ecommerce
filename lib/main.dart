import 'package:admin_ecommerce_app/core/di/locator.dart';
import 'package:admin_ecommerce_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';
import 'app.dart';

/// Entry point of Flutter App
ServiceLocator dependencyInjector = ServiceLocator();
Future<void> main() async {
  // Ensure that widgets are initialized
  WidgetsFlutterBinding.ensureInitialized();
  // Remove # sign from url
  setPathUrlStrategy();
  // Initialize Firebase & Authentication Repository
  dependencyInjector.servicesLocator();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Main App Starts here...
  runApp(const App());
}
