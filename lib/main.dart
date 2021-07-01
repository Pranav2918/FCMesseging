import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:task_3/pages/notificationPage.dart';
import 'package:task_3/pages/greenpage.dart';
import 'package:task_3/pages/redpage.dart';
import 'package:task_3/services/nService.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FNotification(),
      routes: {"red": (_) => RedPage(), "green": (_) => GreenPage()},
    );
  }
}
