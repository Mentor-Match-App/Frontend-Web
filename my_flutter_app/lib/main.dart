import 'package:firebase_core/firebase_core.dart';
import "package:flutter/material.dart";
import 'package:my_flutter_app/admin/screen/dasboard_admin_screen.dart';
import 'package:my_flutter_app/firebase_options.dart';
import 'package:my_flutter_app/preferences/%20preferences_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Pastikan ini dipanggil pertama
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await UserPreferences.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MentorMatch',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: DashboardAdminScreen(),
    );
  }
}
