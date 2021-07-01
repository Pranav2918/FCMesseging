import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:task_3/services/nService.dart';

//Recieve Messege on background(Handler Must Be Global)
Future<void> backgroundHandler(RemoteMessage messege) async {
  print(messege.data.toString());
  print(messege.notification!.title);
}

class FNotification extends StatefulWidget {
  @override
  _FNotificationState createState() => _FNotificationState();
}

class _FNotificationState extends State<FNotification> {
  @override
  void initState() {
    super.initState();
    LocalNotificationService.initialize(context);
    FirebaseMessaging.instance.getInitialMessage();

    //Works on foreground...
    FirebaseMessaging.onMessage.listen((message) {
      if (message.notification != null) {
        print(message.notification!.body);
        print(message.notification!.title);
      }

      LocalNotificationService.display(message); //Used For HeadUp
    });

    //Works on background...(Must open in recent app.)
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      final routeFromMessage = message.data["route"];

      Navigator.of(context).pushNamed(routeFromMessage);
    });

    //Works on terminated state of app...
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        final routeFromMessage = message.data["route"];
        Navigator.of(context).pushNamed(routeFromMessage);
        // LocalNotificationService.display(message);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase Notification'),
      ),
      body: Center(
        child: Text(
          'You Will Recieve Notification Soon...',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
