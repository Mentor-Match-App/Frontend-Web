import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_flutter_app/Mentee/Screens/Session/bookingsessionpopup.dart';
import 'package:my_flutter_app/widget/custombutton.dart';
import 'package:my_flutter_app/widget/navbaruser.dart';
import 'package:my_flutter_app/widget/reviewwidget.dart';
import 'package:my_flutter_app/widget/profileavatar.dart';
import 'package:my_flutter_app/Mentee/Screens/PremiumClass/bookingpremiumpopup.dart';
import 'package:my_flutter_app/widget/experiencewidget.dart';

class DetailSessionMentorScreen extends StatefulWidget {
  DetailSessionMentorScreen({Key? key}) : super(key: key);

  @override
  State<DetailSessionMentorScreen> createState() =>
      _DetailSessionMentorScreenState();
  void _showBookingPopupMenu(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BookingPremiumPopupMenu();
      },
    );
  }
}

class _DetailSessionMentorScreenState extends State<DetailSessionMentorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: NavbarWidgetUser(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Larger Green Section
            Container(
              height: 500,
              width: double.maxFinite,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFf8f0f0), // #F8F0F0
                    Colors.white,
                  ],
                  stops: [0.5, 0.5],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(50.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ProfileAvatar(
                      imageUrl: 'assets/Handoff/ilustrator/profile.png',
                      radius: 80,
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Charline June",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 24,
                              color: Colors.black, // Text color adjusted
                            ),
                          ),
                          SizedBox(height: 35),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.work_outline_outlined,
                                    size: 16,
                                    color: const Color(0xffE78938),
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    "UI/UX Designer",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 24,
                                      color: Color(0xff313030),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(width: 20),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Icon(
                                      Icons.location_on_outlined,
                                      size: 16,
                                      color: const Color(0xffE78938),
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      "Jakarta Selatan",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 24,
                                        color: Color(0xff313030),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Icon(
                                Icons.home_work_outlined,
                                size: 16,
                                color: const Color(0xffE78938),
                              ),
                              SizedBox(width: 4),
                              Text(
                                "SMA SATU NUSA SATU BANGSA",
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 24,
                                  color: Color(0xff313030),
                                ),
                              ),
                              SizedBox(width: 20),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Red and Orange Sections side by side
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width / 2,
                  padding: EdgeInsets.all(55.0),
                  child: ListView(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    children: [
                      Text(
                        "About",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 24,
                          color: Color(0xffE78938),
                        ),
                      ),
                      SizedBox(height: 12),
                      Text(
                        'Experienced in business strategy, startup development, and leadership. Specialized expertise in building mobile applications.',
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 24,
                          color: Color(0xff313030),
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 10.0, bottom: 10.0, right: 475),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Color(0xffE78938), // Primary color
                            padding: EdgeInsets.symmetric(
                              vertical: 20.0,
                              horizontal: 34.0,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0.0),
                            ),
                          ),
                          onPressed: () {},
                          child: Row(
                            children: [
                              Image.asset(
                                'Handoff/icon/social-icons/linkedin.png',
                                width: 20.0,
                                height: 20.0,
                                color: Colors.white,
                              ),
                              SizedBox(width: 8.0),
                              Text(
                                "Linkedin",
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Skill",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 24,
                          color: Color(0xffE78938),
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 8.0, bottom: 8.0),
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                foregroundColor: Color(0xffE78938),
                                padding: EdgeInsets.symmetric(
                                  vertical: 20.0,
                                  horizontal: 16.0,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0.0),
                                ),
                              ),
                              onPressed: () {},
                              child: Text(
                                "Java Script",
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 24,
                                  color: Color(0xff0A1737), // Text color
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 8),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 8.0, bottom: 8.0),
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                foregroundColor: Color(0xffE78938),
                                padding: EdgeInsets.symmetric(
                                  vertical: 20.0,
                                  horizontal: 16.0,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0.0),
                                ),
                              ),
                              onPressed: () {},
                              child: Text(
                                "Flutter/Dart",
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 24,
                                  color: Color(0xff0A1737), // Text color
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Experience",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 24,
                          color: Color(0xffE78938),
                        ),
                      ),
                      SizedBox(height: 20),
                      ExperienceWidget(
                        role: "English Teacher",
                        company: "SMA SATU NUSA SATU BANGSA",
                      ),
                      SizedBox(height: 10),
                      ExperienceWidget(
                        role: "Interpreter",
                        company: "Freelance",
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Review",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: Color(0xffE78938),
                        ),
                      ),
                      SizedBox(height: 10),
                      ReviewWidget(
                        name: "Andrew Justin",
                        review:
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat !!!",
                      ),
                      SizedBox(height: 10),
                      ReviewWidget(
                        name: "Andrew Justin",
                        review:
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat !!!.",
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width / 2,
                  padding: EdgeInsets.all(55),
                  child: ListView(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    children: [
                      Text(
                        "Jadwal Session",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 24,
                          color: Color(0xffE78938),
                        ),
                      ),
                      SizedBox(height: 30),
                      Container(
                        decoration: BoxDecoration(
                          color: Color(
                              0xFFf8f0f0), // Adjust the container background color if needed
                          borderRadius: BorderRadius.all(
                              Radius.circular(24)), // Corner radius
                        ),
                        padding: EdgeInsets.all(24), // Adjust padding as needed
                        child: Column(
                          children: [
                            Text(
                              "Mastering Modern Web Development with Node.js and React",
                              style: TextStyle(
                                color: Colors.black, // Text color
                                fontWeight: FontWeight.w800,
                                fontSize: 24,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 45),
                            Row(
                              mainAxisAlignment: MainAxisAlignment
                                  .spaceEvenly, // To distribute space evenly between the items
                              children: [
                                Text(
                                  "24 November 2024",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 24, // Adjust font size as needed
                                    color: Colors
                                        .black, // Adjust text color if needed
                                  ),
                                ),
                                Text(
                                  "14:00 WIB",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 24, // Adjust font size as needed
                                    color: Colors
                                        .black, // Adjust text color if needed
                                  ),
                                ),
                                Text(
                                  "kuota: 150",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 24, // Adjust font size as needed
                                    color: Colors
                                        .black, // Adjust text color if needed
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 45),
                            CustomButton(
                              buttonText: "Booking Session",
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return BookingSessionPopupMenu();
                                  },
                                );
                              },
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
