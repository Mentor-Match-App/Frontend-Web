import 'package:flutter/material.dart';
import 'package:my_flutter_app/mentee/screen/sidebar/my_class/my_class_booking_mentee.dart';
import 'package:my_flutter_app/widget/menucategory.dart';

class MyClassMentee extends StatefulWidget {
  const MyClassMentee({super.key});

  @override
  State<MyClassMentee> createState() => _MyClassMenteeState();
}

class _MyClassMenteeState extends State<MyClassMentee> {
  bool isClassActive = true;
  bool isSessionActive = false; // Renamed for consistency

  void changeClass(String menu) {
    setState(() {
      if (menu == "Premium Class") {
        isClassActive = true;
        isSessionActive = false;
      } else if (menu == "Session") {
        isClassActive = false;
        isSessionActive = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 150,
                  height: 38,
                  decoration: BoxDecoration(
                    color: Colors.white, // Mengatur background putih
                    border: Border(
                      bottom: BorderSide(
                        color: isClassActive
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
                            color: isClassActive
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
          ),
          Column(
            children: [
              isClassActive
                  ? MyClassBookingMentee()
                  // : isSessionActive
                  //     ? MySessionBooking()
                  : MyClassBookingMentee(),
            ],
          )
        ],
      ),
    );
  }
}
