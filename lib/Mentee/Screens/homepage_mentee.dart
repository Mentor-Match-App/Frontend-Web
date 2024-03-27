import 'package:flutter/material.dart';
import 'package:my_flutter_app/widget/footer.dart';
import 'package:my_flutter_app/widget/navbaruser.dart';
import 'package:my_flutter_app/widget/mentorcard.dart';
import 'package:my_flutter_app/widget/educationbutton.dart';

class MenteeHomePage extends StatelessWidget {
  const MenteeHomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: NavbarWidgetMentee(),
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
                        Text(
                          'Selamat Datang di Aplikasi Mentoring Terbaik!',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        SizedBox(height: 28),
                        Text(
                          'Apakah Anda siap untuk mempercepat pertumbuhan Anda dan mencapai potensi tertinggi dalam karir atau pendidikan Anda? Kami bangga mempersembahkan aplikasi mentoring terbaik yang dirancang khusus untuk Anda, para mentee berbakat di segala bidang!',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 80),
                  Expanded(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: SizedBox(
                        width: 202.12,
                        child: Image.asset(
                          'Handoff/ilustrator/looking_mentor.png',
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
                  padding: EdgeInsets.symmetric(horizontal: 150, vertical: 100),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Popular Mentor',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 28),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(10, (index) {
                            return MentorCard(
                              imageUrl: 'Handoff/ilustrator/profile.png',
                              name: 'Mentor ${index + 1}',
                              workTitle: 'Job Title ${index + 1}',
                              workplace: 'Workplace ${index + 1}',
                              status: 'Available',
                            );
                          }),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
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
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                ),
                                child: SizedBox(
                                  width: 902.12,
                                  child: Image.asset(
                                    'Handoff/ilustrator/learn_together_2.png',
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
                                    'Program  & Layanan',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  SizedBox(height: 28),
                                  Text(
                                    'Dapatkan akses eksklusif ke mentor pilihan Anda yang akan membimbing langkah-langkah Anda menuju sukses. Mereka adalah ahli di bidang mereka dan siap membantu Anda mencapai tujuan Anda.',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w200,
                                    ),
                                  ),
                                  SizedBox(height: 50),
                                  CustomButtonGroup(),
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
