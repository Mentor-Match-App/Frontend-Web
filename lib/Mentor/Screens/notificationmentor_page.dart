import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_flutter_app/mentor/Screens/homepage_mentor.dart';

class CustomInfoContainer extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Widget? actionWidget;
  final Color? iconColor; // Existing icon color parameter
  final IconData? icon; // Add this line for the icon data

  const CustomInfoContainer({
    required this.title,
    this.subtitle,
    this.actionWidget,
    this.iconColor,
    this.icon, // Add this line
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Color(0xFFF8F1F1),
        borderRadius: BorderRadius.circular(8.0),
      ),
      margin: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Icon(
                  icon ??
                      Icons
                          .check_circle_outline_rounded, // Use the provided icon
                  color:
                      iconColor ?? Colors.green, // Use the provided icon color
                  size: 55.0,
                ),
              ),
            ],
          ),
          SizedBox(width: 10.0),
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
                  Text(
                    subtitle!,
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
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

class NotificationMentorPage extends StatefulWidget {
  const NotificationMentorPage({Key? key}) : super(key: key);

  @override
  _NotificationMentorPageState createState() => _NotificationMentorPageState();
}

class _NotificationMentorPageState extends State<NotificationMentorPage> {
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
                      MaterialPageRoute(builder: (context) => MentorHomePage()),
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
                                  "Kami ingin memberi tahu Anda bahwa akun sosial media Anda telah lama tidak digunakan Kami rindu melihat Anda aktif dan berbagi momen-momen menarik dengan komunitas kamu.",
                              icon: Icons.error_outline,
                              iconColor: Colors.orange,
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
