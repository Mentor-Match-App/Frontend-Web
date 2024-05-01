import 'package:flutter/material.dart';
import 'package:my_flutter_app/mentor/Screens/my_class_mentor/my_class_list_mentor.dart';

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
  bool isPremiumClassActive = false;
  bool isClassActive = true;
  bool isSessionActive = false; // Renamed for consistency
  void changeClass(String menu) {
    setState(() {
      if (menu == "My Class") {
        isClassActive = true;
        isSessionActive = false;
        isPremiumClassActive = false;
      } else if (menu == "My Session") {
        // Corrected the condition
        isClassActive = false;
        isSessionActive = true;
        isPremiumClassActive = false;
      } else {
        menu == "My Premium Class";
        isPremiumClassActive = true;
        isClassActive = false;

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
                      color: isClassActive
                          ? ColorStyle().secondaryColors
                          : Colors.transparent,
                    ),
                  ),
                ),
                child: TextButton(
                  onPressed: () {
                    changeClass("My Class");
                  },
                  child: Text(
                    "My Class",
                    style: FontFamily().boldText.copyWith(
                        color: isClassActive
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
                      color: isPremiumClassActive
                          ? ColorStyle().secondaryColors
                          : Colors.transparent,
                    ),
                  ),
                ),
                  child: TextButton(
                      onPressed: () {
                        changeClass("My Premium Class");
                      },
                      child: Text("Premium Class",
                          style: FontFamily().boldText.copyWith(
                              color: isPremiumClassActive
                                  ? ColorStyle().blackColors
                                  : ColorStyle().disableColors))),
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
            isClassActive
                ? MyClassCreateMentor()
                : isSessionActive
                    ? MySessionCreate()
                    : isPremiumClassActive
                        ? MyPremiumClassMentorScreen()
                        : MyClassCreateMentor()
          ],
        )
      ],
    );
  }
}
