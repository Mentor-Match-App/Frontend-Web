import 'package:flutter/material.dart';
import 'package:my_flutter_app/mentor/Screens/my_class_mentor/my_class_mentor_screen.dart';

import 'package:my_flutter_app/mentor/Screens/my_class_mentor/my_premium_class_mentor.dart';
import 'package:my_flutter_app/mentor/Screens/my_class_mentor/my_session_mentor.dart';
import 'package:my_flutter_app/mentor/Screens/notificationmentor_page.dart';
import 'package:my_flutter_app/widget/menucategory.dart';

class MyClassMentorListScreen extends StatefulWidget {
  const MyClassMentorListScreen({Key? key}) : super(key: key);

  @override
  State<MyClassMentorListScreen> createState() =>
      _MyClassMentorListScreenState();
}

class _MyClassMentorListScreenState extends State<MyClassMentorListScreen> {
  bool isAllClassActive = true; 
  bool isMyClassActive = false;
  bool isSessionActive = false; // Renamed for consistency
  void changeClass(String menu) {
    setState(() {
      if (menu == "Premium Class") {
        isMyClassActive = true;
        isSessionActive = false;
        isAllClassActive = false;
      } else if (menu == "My Session") {
        // Corrected the condition
        isMyClassActive = false;
        isSessionActive = true;
        isAllClassActive = false;
      } else {
        menu == "All Class";
        isAllClassActive = true;
        isMyClassActive = false;

        isSessionActive = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 150,
                height: 38,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 2,
                      color: isAllClassActive
                          ? ColorStyle().secondaryColors
                          : Colors.transparent,
                    ),
                  ),
                ),
                child: TextButton(
                    onPressed: () {
                      changeClass("All Class");
                    },
                    child: Text("All Class",
                        style: FontFamily().boldText.copyWith(
                            color: isAllClassActive
                                ? ColorStyle().blackColors
                                : ColorStyle().disableColors))),
              ),
              Container(
                width: 150,
                height: 38,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 2,
                      color: isMyClassActive
                          ? ColorStyle().secondaryColors
                          : Colors.transparent,
                    ),
                  ),
                ),
                child: TextButton(
                  onPressed: () {
                    changeClass("Premium Class");
                  },
                  child: Text(
                    "Premium Class",
                    style: FontFamily().boldText.copyWith(
                        color: isMyClassActive
                            ? ColorStyle().blackColors
                            : ColorStyle().disableColors),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 150,
                  height: 38,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 2,
                        color: isSessionActive
                            ? ColorStyle().secondaryColors
                            : Colors.transparent,
                      ),
                    ),
                  ),
                  child: TextButton(
                      onPressed: () {
                        changeClass("My Session");
                      },
                      child: Text("My Session",
                          style: FontFamily().boldText.copyWith(
                              color: isSessionActive
                                  ? ColorStyle().blackColors
                                  : ColorStyle().disableColors))),
                ),
              ),
            ],
          ),
        ),
        Column(
          children: [
            isAllClassActive
                ? AllClassMentorScreen()
                : isSessionActive
                    ? MySessionCreate()
                    : isMyClassActive
                        ? MyClassMentorScreen()
                        :   AllClassMentorScreen()
          ],
        )
      ],
    );
  }
}
