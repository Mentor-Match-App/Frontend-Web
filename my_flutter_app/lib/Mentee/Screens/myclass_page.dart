import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_flutter_app/Mentee/Screens/PremiumClass/detailpremiumclass_page.dart';
import 'package:my_flutter_app/widget/navbaruser.dart';

class MyClassPage extends StatefulWidget {
  MyClassPage({Key? key}) : super(key: key);

  @override
  State<MyClassPage> createState() => _MyClassPageState();
}

class MyClass {
  final String title;
  final String duration;
  final String mentor;

  MyClass({required this.title, required this.duration, required this.mentor});
}

class MySession {
  final String title;
  final String time;
  final String mentor;

  MySession({required this.title, required this.time, required this.mentor});
}

class _MyClassPageState extends State<MyClassPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  List<MyClass> myClasses = [
    MyClass(
      title: 'UI/UX Design & Research',
      duration: '3 Bulan',
      mentor: 'Charline June',
    ),
    // Tambahkan item kelas lainnya sesuai kebutuhan
  ];
  List<MySession> mySession = [
    MySession(
      title: 'Mastering Modern Web Development with Node.js and React',
      time: '28 Februari 2021 (19.00 WIB)',
      mentor: 'Charline June',
    ),
    // Tambahkan item kelas lainnya sesuai kebutuhan
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: NavbarWidgetUser(),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 55, right: 55, top: 75, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 400,
                  child: TabBar(
                    controller: _tabController,
                    indicator: UnderlineTabIndicator(
                      borderSide: BorderSide(
                        width: 2,
                        color: Color(0xffE78938), // Underline Color
                      ),
                    ),
                    tabs: [
                      Tab(
                        icon: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.menu_book_rounded,
                              color: _tabController.index == 0
                                  ? Color(0xffE78938) // Primary Color
                                  : Colors.black, // Ganti warna sesuai kondisi
                            ),
                            SizedBox(width: 10),
                            Text(
                              "Premium Class",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: _tabController.index == 0
                                    ? Color(0xffE78938) // Primary Color
                                    : Colors
                                        .black, // Ganti warna sesuai kondisi
                              ),
                            ),
                          ],
                        ),
                      ),
                      Tab(
                        icon: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.volume_down_rounded,
                              color: _tabController.index == 1
                                  ? Color(0xffE78938) // Primary Color
                                  : Colors.black, // Ganti warna sesuai kondisi
                            ),
                            SizedBox(width: 10),
                            Text(
                              "Session",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: _tabController.index == 1
                                    ? Color(0xffE78938) // Primary Color
                                    : Colors
                                        .black, // Ganti warna sesuai kondisi
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                    onTap: (index) {
                      setState(() {
                        _tabController.index = index;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(35.0),
              child: TabBarView(
                controller: _tabController,
                children: [
                  buildMyClassContent(),
                  buildMySessionContent(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMyClassContent() {
    return ListView.builder(
      itemCount: myClasses.length,
      itemBuilder: (context, index) {
        MyClass currentClass = myClasses[index];
        return Padding(
          padding: EdgeInsets.all(20.0),
          child: Container(
            height: 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Color(0xffF8F1F1), // Tertiary Color
            ),
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    child: Image.asset(
                      height: 350,
                      width: 350,
                      fit: BoxFit.cover,
                      "Handoff/ilustrator/profile.png",
                    ),
                  ),
                  SizedBox(width: 55),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          currentClass.title,
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 24,
                          ),
                        ),
                        SizedBox(height: 12),
                        Text(
                          currentClass.duration,
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w300,
                            fontSize: 24,
                          ),
                        ),
                        Text(
                          'Mentor : ${currentClass.mentor}',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w300,
                            fontSize: 24,
                          ),
                        ),
                        SizedBox(height: 175),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: SizedBox(
                            width: 327,
                            height: 60,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const PremiumClassDetailPage()),
                                );
                              },
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                  Color(0xffE78938),
                                ),
                              ),
                              child: Text(
                                "Lihat Kelas",
                                style: GoogleFonts.poppins(
                                  fontSize: 24,

                                  color: Color(0xffFFFFFF), // White Color
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildMySessionContent() {
    // Konten untuk My Session, sesuaikan sesuai kebutuhan
    return ListView.builder(
      itemCount: mySession.length,
      itemBuilder: (context, index) {
        MySession currentSession = mySession[index];
        return Padding(
          padding: EdgeInsets.all(20.0),
          child: Container(
            height: 485,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Color(0xffF8F1F1), // Tertiary Color
            ),
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        child: Image.asset(
                          height: 350,
                          width: 350,
                          fit: BoxFit.cover,
                          "Handoff/ilustrator/profile.png",
                        ),
                      ),
                      SizedBox(width: 55),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              currentSession.title,
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                            ),
                            SizedBox(height: 12),
                            Text(
                              currentSession.time,
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w300,
                                fontSize: 24,
                              ),
                            ),
                            Text(
                              'Mentor : ${currentSession.mentor}',
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w300,
                                fontSize: 24,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Link Zoom :',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 24,
                            ),
                          ),
                          SizedBox(width: 15),
                          Text(
                            'htttps/inilinkmentorigyangakankamuakses',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.normal,
                              fontSize: 24,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 12),
                      IconButton(
                        onPressed: () {
                          // Menyalin teks ke clipboard
                          Clipboard.setData(const ClipboardData(
                              text: 'htttps/inilinkmentorigyangakankamuakses'));

                          // Tampilkan snackbar atau pesan bahwa teks telah disalin
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              duration: const Duration(seconds: 2),
                              backgroundColor: Color.fromARGB(255, 0, 0, 0),
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
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
