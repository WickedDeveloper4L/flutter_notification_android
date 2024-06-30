import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_notification/api/firebase_api.dart';
import 'package:flutter_notification/firebase_options.dart';
import 'package:flutter_notification/pages/homepage.dart';
import 'package:flutter_notification/pages/notification_page.dart';

final navigationKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseApi().initNotifications();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Homepage(),
      navigatorKey: navigationKey,
      routes: {
        '/notification_screen': (context) => const NotificationPage(),
      },
    );
  }
}
