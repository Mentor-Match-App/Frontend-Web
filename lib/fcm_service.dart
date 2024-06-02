import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:my_flutter_app/firebase_options.dart';
import 'package:my_flutter_app/style/baseURl.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> sendTokenToServer(String token, String userId) async {
  try {
    Dio dio = Dio();
    var response = await dio.post(
      '$baseUrl/save-token',
      data: {
        'token': token,
        'userId': userId,
      },
    );
    if (response.statusCode == 200) {
      print('Token sent to server successfully');
    } else {
      print(
          'Failed to send token to server, status code: ${response.statusCode}');
    }
  } catch (e) {
    print('Error sending token to server: $e');
  }
}

class FCMService {
  static Future<void> initialize() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    FirebaseMessaging messaging = FirebaseMessaging.instance;

    if (kIsWeb) {
      await FirebaseMessaging.instance.requestPermission();

      FirebaseMessaging.onMessage.listen(_handleForegroundMessage);
      FirebaseMessaging.onMessageOpenedApp.listen(_handleMessageOpenedApp);
      FirebaseMessaging.onBackgroundMessage(
          _firebaseMessagingBackgroundHandler);

      String? token = await messaging.getToken();
      print('FCM Token: $token');
      final prefs = await SharedPreferences.getInstance();
      String? userId = prefs.getString('userId');
      if (userId != null && token != null) {
        await sendTokenToServer(token, userId);
      }

      messaging.onTokenRefresh.listen((newToken) async {
        print('New FCM Token: $newToken');
        if (userId != null) {
          await sendTokenToServer(newToken, userId);
        }
      });
    }
  }

  static Future<void> _handleForegroundMessage(RemoteMessage message) async {
    RemoteNotification? notification = message.notification;
    if (notification != null) {
      print(
          'Foreground web notification: ${notification.title}, ${notification.body}');
    }
  }

  static Future<void> _handleMessageOpenedApp(RemoteMessage message) async {
    print('Message clicked!');
  }

  static Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    print("Handling a background message: ${message.messageId}");
  }
}
