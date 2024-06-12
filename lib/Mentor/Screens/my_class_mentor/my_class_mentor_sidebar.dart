import 'package:flutter/material.dart';
import 'package:my_flutter_app/mentor/Screens/my_class_mentor/my_session_mentor.dart';
import 'package:my_flutter_app/mentor/screens/my_class_mentor/class_submission_mentor.dart';
import 'package:my_flutter_app/mentor/screens/my_class_mentor/premium_class_mentor.dart';
import 'package:my_flutter_app/style/fontStyle.dart';
import 'package:my_flutter_app/widget/menucategory.dart';

class MyClassMentorListScreen extends StatefulWidget {
  const MyClassMentorListScreen({Key? key}) : super(key: key);

  @override
  State<MyClassMentorListScreen> createState() =>
      _MyClassMentorListScreenState();
}

class _MyClassMentorListScreenState extends State<MyClassMentorListScreen> {
  bool isClassSubmissionActive = true;
  bool isPremiumClassActive = false;
  bool isSessionActive = false; // Renamed for consistency
  void changeClass(String menu) {
    setState(() {
      if (menu == "Premium Class") {
        isClassSubmissionActive = false;
        isPremiumClassActive = true;
        isSessionActive = false;
      } else if (menu == "My Session") {
        isClassSubmissionActive = false;
        isPremiumClassActive = false;
        isSessionActive = true;
      } else {
        menu = "Class Submission";
        isClassSubmissionActive = true;
        isPremiumClassActive = false;
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
                      color: isClassSubmissionActive
                          ? ColorStyle().secondaryColors
                          : Colors.transparent,
                    ),
                  ),
                ),
                child: TextButton(
                    onPressed: () {
                      changeClass("Class Submission");
                    },
                    child: Text("Class Submission",
                        style: FontFamily().boldText.copyWith(
                            color: isClassSubmissionActive
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
                      color: isPremiumClassActive
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
                        color: isPremiumClassActive
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
            isClassSubmissionActive
                ? ClassSubmissionMentorScreen()
                : isSessionActive
                    ? MySessionCreate()
                    : isPremiumClassActive
                        ? PremiumClassMentorScreen()
                        : ClassSubmissionMentorScreen()
          ],
        )
      ],
    );
  }
}
