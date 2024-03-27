import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_app/widget/appbar_widget.dart';

class HomeAdminScreen extends StatefulWidget {
  HomeAdminScreen({Key? key}) : super(key: key);

  @override
  State<HomeAdminScreen> createState() => _HomeAdminScreenState();
}

class _HomeAdminScreenState extends State<HomeAdminScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: AppBarLandingPageWidget(),
        ),
        body: ListView(
          children: [
            Column(
              children: [
                const Text(
                  'Welcome to MentorMatch!',
                ),
              ],
            )
          ],
        ));
  }
}
