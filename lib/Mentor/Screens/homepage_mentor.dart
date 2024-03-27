import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_flutter_app/Mentor/Screens/creatpremiumclass.dart';
import 'package:my_flutter_app/Mentor/Screens/creatsession.dart';
import 'package:my_flutter_app/widget/custombutton.dart';
import 'package:my_flutter_app/widget/footer.dart';
import 'package:my_flutter_app/widget/navbaruser.dart';

class MentorHomePage extends StatelessWidget {
  const MentorHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: NavbarWidgetMentor(),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 150, vertical: 100),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            style: GoogleFonts.poppins(
                              // Default text style for all spans
                              fontSize: 40,
                              fontWeight: FontWeight.normal,
                              color: Colors.black, // Default text color
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Halo ',
                              ),
                              TextSpan(
                                text: 'Charline,',
                                style: TextStyle(
                                    color: Colors
                                        .orange), // Highlight "Charline" in orange
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Jelajahi Dunia Mentoring yang Menginspirasi',
                          style: GoogleFonts.poppins(
                            fontSize: 40,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        SizedBox(height: 28),
                        Text(
                          'Bagikan kisah sukses dan tantangan pribadi Anda. Ini membuat Anda lebih mudah dicapai dan memberikan inspirasi nyata. Dorong peserta untuk berpikir kritis dengan mengajukan pertanyaan terbuka. Ini membuka pintu untuk diskusi yang mendalam.',
                          style: GoogleFonts.poppins(
                            fontSize: 24,
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                        SizedBox(height: 75),
                        CustomButton(
                          buttonText: "Buat Session",
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CreateSessionPage(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 100),
                  Expanded(
                    child: DecoratedBox(
                      decoration: BoxDecoration(color: Colors.white),
                      child: SizedBox(
                        width: 202.12,
                        child: Image.asset(
                          'Handoff/ilustrator/mentor_in_zoom.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Container(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 150, vertical: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: DecoratedBox(
                                decoration: BoxDecoration(color: Colors.white),
                                child: SizedBox(
                                  width: 902.12,
                                  child: Image.asset(
                                    'Handoff/ilustrator/learn_by_online.png',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 45),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    'Pimpin Perubahan, Jadi Mentor dalam Sesi Inovatif dan Pendidikan',
                                    textAlign: TextAlign.right,
                                    style: GoogleFonts.poppins(
                                      fontSize: 40,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  Text(
                                    'Bagikan kisah sukses dan tantangan pribadi Anda. Ini membuat Anda lebih mudah dicapai dan memberikan inspirasi nyata. Dorong peserta untuk berpikir kritis dengan mengajukan pertanyaan terbuka. Ini membuka pintu untuk diskusi yang mendalam.',
                                    textAlign: TextAlign.right,
                                    style: GoogleFonts.poppins(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w200,
                                    ),
                                  ),
                                  SizedBox(height: 75),
                                  CustomButton(
                                    buttonText: "Buat Kelas",
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              CreatePremiumClassPage(),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                FooterWidget(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
