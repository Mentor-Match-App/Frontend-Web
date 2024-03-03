import "package:flutter/material.dart";
import 'package:my_flutter_app/admin/screen/menu_admin/create_community_admin.dart';
import 'package:my_flutter_app/admin/screen/menu_dasboard_admin/detail_pengajuan_verifikasi_kelas.dart';
import 'package:my_flutter_app/admin/screen/dasboard_admin_screen.dart';
import 'package:my_flutter_app/admin/screen/menu_admin/dasboard_home.dart';
import 'package:my_flutter_app/admin/screen/menu_admin/notification_admin_screen.dart';
import 'package:my_flutter_app/admin/screen/menu_dasboard_admin/verifikasi_mentor_screen.dart';
import 'package:my_flutter_app/admin/screen/test_table.dart';

void main() {
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
      home:DashboardAdminScreen()
    );
  }
}
