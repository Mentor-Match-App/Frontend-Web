import 'package:flutter/material.dart';
import 'package:my_flutter_app/mentee/screen/sidebar/my_class/booking_class_mentee_screen.dart';
import 'package:my_flutter_app/mentee/screen/sidebar/my_class/my_session_booking_mentee_screen.dart';
import 'package:my_flutter_app/mentee/screen/sidebar/my_class/premium_class_mentee_screen.dart';
import 'package:my_flutter_app/style/fontStyle.dart';
import 'package:my_flutter_app/widget/menucategory.dart';

class MyClassMentee extends StatefulWidget {
  final String initialSubMenu; // New parameter for initial sub-menu

  const MyClassMentee({
    Key? key,
    this.initialSubMenu = 'All Class',
  }) : super(key: key);
  @override
  State<MyClassMentee> createState() => _MyClassMenteeState();
}

class _MyClassMenteeState extends State<MyClassMentee> {
  bool isBookingClassActive = true;
  bool isPremiumClassActive = false;
  bool isSessionActive = false;

  void changeClass(String menu) {
    setState(() {
      if (menu == "Booking Class") {
        isBookingClassActive = true;
        isPremiumClassActive = false;
        isSessionActive = false;
      } else if (menu == "Premium Class") {
        isBookingClassActive = false;
        isPremiumClassActive = true;
        isSessionActive = false;
      } else if (menu == "Session") {
        isBookingClassActive = false;
        isPremiumClassActive = false;
        isSessionActive = true;
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
                      color: isBookingClassActive
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
                          color: isBookingClassActive
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
              isBookingClassActive
                  ? BookingClassMenteeScreen()
                  : isPremiumClassActive
                      ? PremiumClassMenteeScreen()
                      : isSessionActive
                          ? MySessionBooking()
                          : BookingClassMenteeScreen()
            ],
          )
        ],
      ),
    );
  }
}
