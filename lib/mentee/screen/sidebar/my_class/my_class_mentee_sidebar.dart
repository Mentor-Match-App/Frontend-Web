import 'package:flutter/material.dart';
import 'package:my_flutter_app/mentee/screen/sidebar/my_class/all_class_mentee_screen.dart';
import 'package:my_flutter_app/mentee/screen/sidebar/my_class/my_session_booking_mentee_screen.dart';
import 'package:my_flutter_app/mentee/screen/sidebar/my_class/premium_class_mentee_screen.dart';
import 'package:my_flutter_app/widget/menucategory.dart';
import 'package:my_flutter_app/style/fontStyle.dart';

class MyClassMentee extends StatefulWidget {
  const MyClassMentee({super.key});

  @override
  State<MyClassMentee> createState() => _MyClassMenteeState();
}

class _MyClassMenteeState extends State<MyClassMentee> {
  bool isAllClassActive = true;
  bool isSessionActive = false; // Renamed for consistency
  bool isPremiumClassActive = false;

  void changeClass(String menu) {
    setState(() {
      if (menu == "All Class") {
        isAllClassActive = true;
        isSessionActive = false;
        isPremiumClassActive = false;
      } else if (menu == "Session") {
        // Corrected the condition
        isAllClassActive = false;
        isSessionActive = true;
        isPremiumClassActive = false;
      } else if (menu == "Premium Class") {
        isAllClassActive = false;
        isSessionActive = false;
        isPremiumClassActive = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 150,
                height: 38,
                decoration: BoxDecoration(
                  color: Colors.white, // Mengatur background putih
                  border: Border(
                    bottom: BorderSide(
                      color: isAllClassActive
                          ? ColorStyle()
                              .secondaryColors // Warna border ketika aktif
                          : Colors.transparent,
                      width: 2, // Lebar border
                    ),
                  ),
                ),
                child: TextButton(
                  onPressed: () {
                    changeClass("All Class");
                  },
                  child: Text(
                    "All Class",
                    style: FontFamily().boldText.copyWith(
                          color: isAllClassActive
                              ? ColorStyle().blackColors
                              : ColorStyle().disableColors,
                        ),
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                width: 150,
                height: 38,
                decoration: BoxDecoration(
                  color: Colors.white, // Mengatur background putih
                  border: Border(
                    bottom: BorderSide(
                      color: isPremiumClassActive
                          ? ColorStyle()
                              .secondaryColors // Warna border ketika aktif
                          : Colors.transparent,
                      width: 2, // Lebar border
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
                              : ColorStyle().disableColors,
                        ),
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                width: 150,
                height: 38,
                decoration: BoxDecoration(
                  color: Colors.white, // Mengatur background putih
                  border: Border(
                    bottom: BorderSide(
                      color: isSessionActive
                          ? ColorStyle()
                              .secondaryColors // Warna border ketika aktif
                          : Colors.transparent,
                      width: 2, // Lebar border
                    ),
                  ),
                ),
                child: TextButton(
                    onPressed: () {
                      changeClass("Session");
                    },
                    child: Text("Session",
                        style: FontFamily().boldText.copyWith(
                            color: isSessionActive
                                ? ColorStyle().blackColors
                                : ColorStyle().disableColors))),
              ),
            ],
          ),
          Column(
            children: [
              isAllClassActive
                  ? AllClassMenteeScreen()
                  : isPremiumClassActive
                      ? PremiumClassMenteeScreen()
                      : isSessionActive
                          ? MySessionBooking()
                          : AllClassMenteeScreen()
            ],
          )
        ],
      ),
    );
  }
}
