import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_flutter_app/Mentee/Screens/homepage_mentee.dart';

class CustomInfoContainer extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Widget? actionWidget;

  const CustomInfoContainer({
    required this.title,
    this.subtitle,
    this.actionWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Color(0xFFF8F1F1),
        borderRadius: BorderRadius.circular(1.0),
      ),
      margin: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left Section with Centered Icon
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Icon(
                  Icons.error_outline_rounded,
                  color: Colors.orange,
                  size: 55.0,
                ),
              ),
            ],
          ),

          // Right Section with Title, Subtitle, and ActionWidget
          SizedBox(width: 10.0), // Adjust spacing as needed
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 20),
                if (subtitle != null && subtitle!.isNotEmpty)
                  SingleChildScrollView(
                    child: Container(
                      width: double.infinity,
                      child: Text(
                        subtitle!,
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                if (actionWidget != null) SizedBox(height: 20),
                if (actionWidget != null) actionWidget!,
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NotificationMenteePage extends StatefulWidget {
  const NotificationMenteePage({Key? key}) : super(key: key);

  @override
  _NotificationMenteePageState createState() => _NotificationMenteePageState();
}

class _NotificationMenteePageState extends State<NotificationMenteePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: Padding(
          padding: const EdgeInsets.only(left: 55.0),
          child: Row(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MenteeHomePage()),
                    );
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Colors.black,
                  ),
                  label: Text(
                    'Notifikasi',
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      color: Colors.orange,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(55.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomInfoContainer(
                              title: "Pengingat Aktivitas Akun",
                              subtitle:
                                  "Kami ingin memberi tahu Anda bahwa akun sosial media Anda telah lama tidak digunakan  Kami rindu melihat Anda aktif dan berbagi momen-momen menarik dengan komunitas kamu.",
                            ),
                            CustomInfoContainer(
                              title: "Charline June",
                              subtitle:
                                  "Charline  mendaftar kedalam session “ Succes carier with flutter “",
                            ),
                            CustomInfoContainer(
                              title: "Pengingat Aktivitas Akun ",
                              subtitle:
                                  "Kami ingin memberi tahu Anda bahwa akun sosial media Anda telah lama tidak digunakan  Kami rindu melihat Anda aktif dan berbagi momen-momen menarik dengan komunitas kamu.",
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
