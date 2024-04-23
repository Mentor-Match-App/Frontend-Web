import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_flutter_app/mentee/screen/premium_class/Karier/karier_screen.dart';
import 'package:my_flutter_app/mentee/screen/premium_class/Kuliah/kuliah_screen.dart';
import 'package:my_flutter_app/mentee/screen/premium_class/SD/sd_screen.dart';
import 'package:my_flutter_app/mentee/screen/premium_class/SMA/sma_screen.dart';
import 'package:my_flutter_app/mentee/screen/premium_class/SMP/smp_screen.dart';
import 'package:my_flutter_app/widget/footer.dart';
import 'package:my_flutter_app/widget/navbaruser.dart';

class PremiumClassPage extends StatelessWidget {
  const PremiumClassPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: NavbarWidgetMentee(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(65.0),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(22.0),
                decoration: BoxDecoration(
                  color: Color(0xFFF9F1F0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildCategoryWidget(
                          'SD',
                          Color(0xFF0A1737),
                          'Lihat',
                          () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SDScreen()),
                            );
                          },
                        ),
                        buildCategoryWidget(
                          'SMP',
                          Color(0xFF0A1737),
                          'Lihat',
                          () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SMPScreen()),
                            );
                          },
                        ),
                        buildCategoryWidget(
                          'SMA',
                          Color(0xFF0A1737),
                          'Lihat',
                          () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SMAScreen()),
                            );
                          },
                        ),
                        buildCategoryWidget(
                          'Kuliah',
                          Color(0xFF0A1737),
                          'Lihat',
                          () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => KuliahScreen()),
                            );
                          },
                        ),
                        buildCategoryWidget(
                          'Karier',
                          Color(0xFF0A1737),
                          'Lihat',
                          () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => KarierScreen()),
                            );
                          },
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
      ),
    );
  }
}

Widget buildCategoryWidget(
  String title,
  Color bgColor,
  String buttonText,
  VoidCallback onPressed, // Added parameter for onPressed callback
) {
  return Padding(
    padding: const EdgeInsets.all(15.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title == 'SMP' || title == 'Kuliah'
            ? Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nikmati pembelajaran yang lebih baik dengan dukungan khusus dari mentor untuk tingkat $title yang membantu Anda dalam proses pembelajaran',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 150.0),
                    SizedBox(
                      height: 40.0,
                      width: 200.0,
                      child: ElevatedButton(
                        onPressed:
                            onPressed, // Use the provided onPressed callback
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(16.0),
                          backgroundColor:
                              buttonText == 'Lihat' ? Colors.orange : bgColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: Text(
                          buttonText,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 150.0),
                  ],
                ),
              )
            : Container(),
        Container(
          width: 250.0,
          height: 250.0,
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Center(
            child: Text(
              title,
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 60.0,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
        ),
        title == 'SD' || title == 'SMA' || title == 'Karier'
            ? Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Nikmati pembelajaran yang lebih baik dengan dukungan khusus dari mentor untuk tingkat $title yang membantu Anda dalam proses pembelajaran',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      textAlign: TextAlign.right,
                    ),
                    SizedBox(height: 150.0),
                    SizedBox(
                      height: 40.0,
                      width: 200.0,
                      child: ElevatedButton(
                        onPressed:
                            onPressed, // Use the provided onPressed callback
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(16.0),
                          backgroundColor:
                              buttonText == 'Lihat' ? Colors.orange : bgColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: Text(
                          buttonText,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 150.0),
                  ],
                ),
              )
            : Container(),
      ],
    ),
  );
}