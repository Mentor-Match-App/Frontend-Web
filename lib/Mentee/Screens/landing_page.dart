import 'package:flutter/material.dart';
import 'package:my_flutter_app/widget/footer.dart';
import 'package:my_flutter_app/widget/navbar.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: NavbarWidget(),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 150, vertical: 100),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Selamat datang di Aplikasi MentorMatch',
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.normal),
                        ),
                        SizedBox(height: 28),
                        Text(
                          'Mari lanjutkan langkah untuk dunia pendidikan yang lebih baik dengan sesio mentoring bersama mentor-mentor ahli yang dapat membantu kamu dalam mencapai target dan tujuan.',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w200),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 80),
                  Expanded(
                    child: DecoratedBox(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: SizedBox(
                        width: 202.12,
                        child: Image.asset(
                          'Handoff/ilustrator/first_screen.png',
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
                  padding: const EdgeInsets.symmetric(
                      horizontal: 150, vertical: 100),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Premium Class Program',
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                      const SizedBox(height: 65),
                      Container(
                        padding: const EdgeInsets.only(left: 60, right: 60),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Card(
                              color: Color(0xFFF9F1F0),
                              child: Container(
                                height: 400,
                                width: 300,
                                child: Column(
                                  children: [
                                    Image.asset(
                                      'Handoff/ilustrator/Premiumclassverified.png',
                                      fit: BoxFit.fill,
                                    ),
                                    const ListTile(
                                      title: Text(
                                        'Mentor Terpercaya & Terverifikasi baik',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      subtitle: Text(
                                        'Menyediakan mentor yang berpengalaman dan terverifikasi mampu memberikan bimbingan yang baik dibidang nya',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w200),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Card(
                              color: Color(0xFFF9F1F0),
                              child: Container(
                                height: 400,
                                width: 300,
                                child: Column(
                                  children: [
                                    Image.asset(
                                      'Handoff/ilustrator/Premiumclassverified.png',
                                      fit: BoxFit.fill,
                                    ),
                                    const ListTile(
                                      title: Text(
                                        'Mentor Terpercaya & Terverifikasi baik',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      subtitle: Text(
                                        'Menyediakan mentor yang berpengalaman dan terverifikasi mampu memberikan bimbingan yang baik dibidang nya',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w200),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Card(
                              color: Color(0xFFF9F1F0),
                              child: Container(
                                height: 400,
                                width: 300,
                                child: Column(
                                  children: [
                                    Image.asset(
                                      'Handoff/ilustrator/Premiumclassverified.png',
                                      fit: BoxFit.fill,
                                    ),
                                    const ListTile(
                                      title: Text(
                                        'Mentor Terpercaya & Terverifikasi baik',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      subtitle: Text(
                                        'Menyediakan mentor yang berpengalaman dan terverifikasi mampu memberikan bimbingan yang baik dibidang nya',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w200),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 150, vertical: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          children: [
                            Text(
                              'Session Gratis',
                              style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ),
                          ],
                        ),
                        const SizedBox(height: 45),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: DecoratedBox(
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                  ),
                                  child: SizedBox(
                                    width: 902.12,
                                    child: Image.asset(
                                      'Handoff/ilustrator/Sessiongratisteacher.png',
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 45),
                              const Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      'Nikmati Session Gratis dengan\n para mentor berpengalaman',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                          fontSize: 35,
                                          fontWeight: FontWeight.normal),
                                    ),
                                    SizedBox(height: 28),
                                    Text(
                                      'Bergabunglah dalam session gratis di MentorMatch dan rasakan pengalaman pembelajaran yang membawa\n Anda Keluar dari Zona nyaman. Sesi ini dirancang untuk memberi Anda gambaran nyata tentang potensi dan keuntungan belajar dengan mentor ahli.',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.w200),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
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
