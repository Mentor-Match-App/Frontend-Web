import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_flutter_app/widget/button.dart';
import 'package:my_flutter_app/widget/menucategory.dart';

class DashboardMentor extends StatefulWidget {
  const DashboardMentor({super.key});

  @override
  State<DashboardMentor> createState() => _DashboardMentorState();
}

class _DashboardMentorState extends State<DashboardMentor> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(32.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Jelajahi Dunia Mentoring\nyang Menginspirasi",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Tingkatkan karier Anda dengan membagikan\nkisah sukses dan tantangan pribadi Anda! Buat\nkelas premium yang unik dan memberikan\ninspirasi langsung kepada peserta.",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: ColorStyle().disableColors),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    ElevatedButtonWidget(
                      title: "Buat Kelas",
                      onPressed: () {},
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 200,
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: SizedBox(
                  width: 400,
                  child: Image.asset(
                    'Handoff/community.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(32.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: SizedBox(
                  width: 400,
                  child: Image.asset(
                    'Handoff/community.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(
                width: 200,
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Jelajahi Dunia Mentoring\nyang Menginspirasi",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Tingkatkan karier Anda dengan membagikan\nkisah sukses dan tantangan pribadi Anda! Buat\nkelas premium yang unik dan memberikan\ninspirasi langsung kepada peserta.",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: ColorStyle().disableColors),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    ElevatedButtonWidget(
                      title: "Buat Session",
                      onPressed: () {},
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
