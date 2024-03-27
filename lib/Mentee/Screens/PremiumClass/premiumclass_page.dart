import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_flutter_app/Mentee/Screens/PremiumClass/Karier/Karier_page.dart';
import 'package:my_flutter_app/Mentee/Screens/PremiumClass/SD/sd_page.dart';
import 'package:my_flutter_app/widget/navbaruser.dart';
import 'package:my_flutter_app/widget/footer.dart';

class PremiumClassPage extends StatelessWidget {
  const PremiumClassPage({Key? key});

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
                            fontSize: 24,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 165.0),
                      SizedBox(
                        height: 65.0,
                        width: 257.0,
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
                              fontSize: 24.0,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 165.0),
                    ],
                  ),
                )
              : Container(),
          Container(
            width: 353.0,
            height: 330.0,
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
                    fontSize: 100.0,
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
                            fontSize: 24,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        textAlign: TextAlign.right,
                      ),
                      SizedBox(height: 165.0),
                      SizedBox(
                        height: 65.0,
                        width: 257.0,
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
                              fontSize: 24.0,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 165.0),
                    ],
                  ),
                )
              : Container(),
        ],
      ),
    );
  }

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
                                  builder: (context) =>
                                      const SekolahDasarPage()),
                            );
                          },
                        ),
                        buildCategoryWidget(
                          'SMP',
                          Color(0xFF0A1737),
                          'Lihat',
                          () {
                            // Add your specific onPressed action for 'SMP'
                            print('SMP button pressed!');
                          },
                        ),
                        buildCategoryWidget(
                          'SMA',
                          Color(0xFF0A1737),
                          'Lihat',
                          () {
                            // Add your specific onPressed action for 'SMA'
                            print('SMA button pressed!');
                          },
                        ),
                        buildCategoryWidget(
                          'Kuliah',
                          Color(0xFF0A1737),
                          'Lihat',
                          () {
                            // Add your specific onPressed action for 'Kuliah'
                            print('Kuliah button pressed!');
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
                                  builder: (context) => const KarierPage()),
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
