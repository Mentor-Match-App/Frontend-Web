import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_flutter_app/Mentee/Screens/PremiumClass/evaluasiempty.dart';

import 'package:my_flutter_app/Mentee/Screens/myclass_page.dart';
import 'package:my_flutter_app/widget/custombutton.dart';
import 'package:my_flutter_app/Mentee/Screens/PremiumClass/reviewmentor.dart';

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
        borderRadius: BorderRadius.circular(8.0),
      ),
      margin: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.orange,
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
                    fontSize: 24,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
          if (actionWidget != null) SizedBox(height: 20),
          if (actionWidget != null) actionWidget!,
        ],
      ),
    );
  }
}

class PremiumClassDetailPage extends StatefulWidget {
  const PremiumClassDetailPage({Key? key}) : super(key: key);

  @override
  _PremiumClassDetailPageState createState() => _PremiumClassDetailPageState();
}

class _PremiumClassDetailPageState extends State<PremiumClassDetailPage> {
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
                      MaterialPageRoute(builder: (context) => MyClassPage()),
                    );
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Colors.black,
                  ),
                  label: Text(
                    'Premium Class',
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomInfoContainer(
                              title: "Periode Program",
                              subtitle: "3 Bulan",
                            ),
                            CustomInfoContainer(
                              title: "Nama Mentor",
                              subtitle: "Steven Jobs",
                            ),
                            CustomInfoContainer(
                              title: "UI/UX Research & Design",
                              subtitle:
                                  "Kelas UI/UX Research & Design ini akan berjalan selama 3 bulan sesuai dengan syarat & ketentuan yang berlaku. Modul pembelajaran akan diterima setiap meeting zoom berlangsung. Mentee akan mendapatkan modul pembelajaran yang dikirim langsung oleh mentor. Mentee dapat melakukan mentoring secara online dan offline  sesuai dengan syarat & ketentuan yang berlaku. Pada setiap topik atau materi mentee akan mengerjakan evaluasi yang akan di review oleh mentor pada aplikasi MentirMatch.",
                            ),
                            CustomInfoContainer(
                              title: "Syarat & Ketentuan",
                              subtitle: "• Mahasiswa semester 1-7\n"
                                  "• Mempunyai Komitmen untuk belajar secara serius\n"
                                  "• Kelas berlangsung selama 4 kali dalam seminggu\n"
                                  "• Dapat melakukan mentoring secara offline apabila jarak rumah dekat\n"
                                  "• Wajib melakukan evaluasi setelah menyelesaikan 1 materi dan seterusnya sampai selesai\n"
                                  "• Mentee akan mendapat modul pembelajaran dari mentor ketika zoom meeting\n"
                                  "• Memiliki Laptop dengan spesifikasi minimal \n(Prosesor i3/i5, Storage tersisa 160Gb, RAM Minimum 8Gb)",
                            ),
                            CustomInfoContainer(
                              title: "Link Zoom",
                              actionWidget: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "htttps/inilinkmentorigyangakankamuakses",
                                    style: GoogleFonts.poppins(
                                      fontSize: 24,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      // Menyalin teks ke clipboard
                                      Clipboard.setData(
                                        ClipboardData(
                                          text:
                                              'htttps/inilinkmentorigyangakankamuakses',
                                        ),
                                      );

                                      // Tampilkan snackbar atau pesan bahwa teks telah disalin
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          duration: const Duration(seconds: 2),
                                          backgroundColor:
                                              Color.fromARGB(255, 0, 0, 0),
                                          behavior: SnackBarBehavior.floating,
                                          content: Text(
                                            'Link disalin',
                                            style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w300,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                    icon: const Icon(
                                      Icons.copy_rounded,
                                      color: Colors.orange,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 85),
                            CustomButton(
                              buttonText: "Evaluasi",
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return EvaluasiMenteeEmptyPage();
                                  },
                                );
                              },
                            ),
                            SizedBox(height: 40),
                            CustomButton(
                              buttonText: "Review Mentor",
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return ReviewMentorDialog();
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
