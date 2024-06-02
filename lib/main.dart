import 'package:firebase_core/firebase_core.dart';
import "package:flutter/material.dart";
import 'package:my_flutter_app/Mentee/screen/homepage_mentee.dart';
import 'package:my_flutter_app/admin/screen/dasboard_admin_screen.dart';
import 'package:my_flutter_app/fcm_service.dart';
import 'package:my_flutter_app/firebase_options.dart';
import 'package:my_flutter_app/login/login_screen.dart';
import 'package:my_flutter_app/mentee/provider/review_mentor_provider.dart';
import 'package:my_flutter_app/mentor/Screens/homepage_mentor.dart';
import 'package:my_flutter_app/mentor/provider/create_class_provider.dart';
import 'package:my_flutter_app/mentor/provider/create_session_provider.dart';
import 'package:my_flutter_app/preferences/%20preferences_helper.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await FCMService.initialize();

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
          homeScreen = MenteeHomePage();
          break;
        case 'Mentor':
          homeScreen = MentorHomePage();
          break;
        case 'Admin':
          homeScreen = DashboardAdminScreen();
          break;
        default:
        // homeScreen = ChooseRoleScreen();
      }
    }
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CreateSessionProvider()),
        ChangeNotifierProvider(create: (_) => CreateClassProvider()),
        ChangeNotifierProvider(create: (_) => ReviewProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        //   home: Scaffold(
        // body: SearchWidgetini(),
        home: homeScreen,
      ),
    );
  }
}
