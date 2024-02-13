import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_flutter_app/widget/navbaruser.dart';
import 'package:my_flutter_app/widget/reviewwidget.dart';
import 'package:my_flutter_app/widget/profileavatar.dart';
import 'package:my_flutter_app/Mentee/Screens/PremiumClass/bookingpopup.dart';
import 'package:my_flutter_app/widget/experiencewidget.dart';

class DetailMentorScreen extends StatefulWidget {
  DetailMentorScreen({Key? key}) : super(key: key);

  @override
  State<DetailMentorScreen> createState() => _DetailMentorScreenState();
  void _showBookingPopupMenu(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BookingPopupMenu();
      },
    );
  }
}

class _DetailMentorScreenState extends State<DetailMentorScreen> {
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
                  color: Color(0xFFF8F0F0),
                  width: MediaQuery.of(context).size.width / 2,
                  padding: EdgeInsets.all(55),
                  child: ListView(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    children: [
                      Text(
                        "Rincian Kegiatan Kelas",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 32,
                          color: Color(0xffE78938),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "UI/UX Research & Design",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.normal,
                          fontSize: 24,
                          color: Color(0xffE78938),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Kelas UI/UX Research & Design ini akan berjalan selama 3 bulan sesuai dengan syarat & ketentuan yang berlaku. Modul pembelajaran akan diterima setiap meeting zoom berlangsung. Mentee akan mendapatkan modul pembelajaran yang dikirim langsung oleh mentor. Mentee dapat melakukan mentoring secara online dan offline sesuai dengan syarat & ketentuan yang berlaku. Pada setiap topik atau materi mentee akan mengerjakan evaluasi yang akan di review oleh mentor pada aplikasi MentirMatch.",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.normal,
                          fontSize: 24,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Syarat & Kententuan",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.normal,
                          fontSize: 24,
                          color: Color(0xffE78938),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "• Mahasiswa semester 1-7\n"
                        "• Mempunyai Komitmen untuk belajar secara serius\n"
                        "• Kelas berlangsung selama 4 kali dalam seminggu\n"
                        "• Dapat melakukan mentoring secara offline apabila jarak rumah dekat\n"
                        "• Wajib melakukan evaluasi setelah menyelesaikan 1 materi dan seterusnya sampai selesai\n"
                        "• Mentee akan mendapat modul pembelajaran dari mentor ketika zoom meeting\n"
                        "• Memiliki Laptop dengan spesifikasi minimal \n(Prosesor i3/i5, Storage tersisa 160Gb, RAM Minimum 8Gb)",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.normal,
                          fontSize: 24,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: () {
                          DetailMentorScreen()._showBookingPopupMenu(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Color(0xffE78938), // Background color
                          padding: EdgeInsets.all(35.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "IDR 1.000.000,00",
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 24,
                              color: Colors.white,
                            ),
                          ),
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
