import 'package:flutter/material.dart';

class HomePageMenteeScreen extends StatefulWidget {
  HomePageMenteeScreen({Key? key}) : super(key: key);

  @override
  State<HomePageMenteeScreen> createState() => _HomePageMenteeScreenState();
}

class _HomePageMenteeScreenState extends State<HomePageMenteeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MentorMatch"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'Welcome to MentorMatch!',
            ),
          ],
        ),
      ),
    );
  }
}