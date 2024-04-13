import 'package:firebase_core/firebase_core.dart';
import "package:flutter/material.dart";
import 'package:my_flutter_app/admin/screen/dasboard_admin_screen.dart';
import 'package:my_flutter_app/firebase_options.dart';
import 'package:my_flutter_app/login/login_screen.dart';
import 'package:my_flutter_app/mentee/screen/homepage_mentee.dart';
import 'package:my_flutter_app/preferences/%20preferences_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await UserPreferences.init();

  final isLoggedIn = UserPreferences.isLoggedIn();
  final userType = UserPreferences.getUserType();

  runApp(MyApp(
    isLoggedIn: isLoggedIn,
    userType: userType,
  ));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  final String? userType;

  const MyApp({super.key, required this.isLoggedIn, this.userType});

  @override
  Widget build(BuildContext context) {
    Widget homeScreen = LoginScreen();
    if (isLoggedIn) {
      switch (userType) {
        case 'Mentee':
          // homeScreen = BottomNavbarMenteeScreen();
          break;
        case 'Mentor':
          // homeScreen = BottomNavbarMentorScreen();
          break;
        case 'Admin':
          homeScreen = DashboardAdminScreen();
          break;
        default:
        // homeScreen = ChooseRoleScreen();
      }
    }
    return MaterialApp(
      title: 'MentorMatch',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      // home: LoginScreen(),
      home: MenteeHomePage(),
    );
  }
}
