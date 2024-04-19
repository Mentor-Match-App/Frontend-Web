import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_flutter_app/mentee/model/mentor_model.dart';
import 'package:my_flutter_app/mentee/model/session_model.dart';
import 'package:my_flutter_app/mentee/screen/PremiumClass/premiumclass_page.dart';
import 'package:my_flutter_app/mentee/service/mentor_service.dart';
import 'package:my_flutter_app/mentee/service/session_mentor_service.dart';
import 'package:my_flutter_app/widget/card_mentor.dart';
import 'package:my_flutter_app/widget/menucategory.dart';

class DashboardMentee extends StatefulWidget {
  const DashboardMentee({super.key});

  @override
  State<DashboardMentee> createState() => _DashboardMenteeState();
}

class _DashboardMenteeState extends State<DashboardMentee> {
  late Future<List<dynamic>> _futureData;
  final SessionServices _sessionServices = SessionServices();
  final MentorService _mentorService = MentorService();

  @override
  void initState() {
    super.initState();

    _futureData = Future.wait([
      _sessionServices.getSessionData(),
      _mentorService.fetchFilteredMentors(),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
        future: _futureData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error.toString()}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('Tidak ada data'));
          } else {
            // mentor session yang di tampilkan hanya yang isActive == true
            var mentorSessionData = snapshot.data![0] as Session;
            var mentorClassData = snapshot.data![1] as MentorClassModel;

            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Mentor Premium Class",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          color: Color(0xff0A1737),
                          fontSize: 16,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PremiumClassPage(),
                            ),
                          );
                        },
                        child: Text(
                          "See All",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            color: ColorStyle().disableColors,
                            fontSize: 14,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                          ////yang ditampilkan hanya 6 aja
                          mentorClassData.mentors!.length > 6
                              ? 6
                              : mentorClassData.mentors!.length, (index) {
                        final mentor = mentorClassData.mentors![index];
                        ExperienceClassAll? currentJob =
                            mentor.experiences?.firstWhere(
                          (exp) => exp.isCurrentJob ?? false,
                          orElse: () => ExperienceClassAll(),
                        );
                        // Fungsi untuk mendapatkan slot yang tersedia
                        int getAvailableSlotCount(ClassAll kelas) {
                          int approvedCount = kelas.transactions
                                  ?.where((t) => t.paymentStatus == "Approved")
                                  .length ??
                              0;

                          int pendingCount = kelas.transactions
                                  ?.where((t) => t.paymentStatus == "Pending")
                                  .length ??
                              0;

                          int totalApprovedAndPendingCount =
                              approvedCount + pendingCount;

                          // Jumlah slot yang tersedia adalah maksimum partisipan dikurangi dengan total transaksi yang telah disetujui dan sedang diproses
                          int availableSlots = (kelas.maxParticipants ?? 0) -
                              totalApprovedAndPendingCount;
                          // Pastikan slot yang tersedia tidak negatif
                          return availableSlots > 0 ? availableSlots : 0;
                        }

// Fungsi untuk menentukan apakah semua kelas dalam daftar mentor dianggap penuh
                        bool allClassesFull =
                            mentor.mentorClass!.every((classMentor) {
                          int availableSlotCount =
                              getAvailableSlotCount(classMentor);
                          return availableSlotCount <= 0;
                        });

                        String company =
                            currentJob?.company ?? 'Placeholder Company';
                        String jobTitle =
                            currentJob?.jobTitle ?? 'Placeholder Job';

                        return CardItemMentor(
                          onPressesd: () {},
                          imagePath: mentor.photoUrl.toString(),
                          name: mentor.name ?? 'No Name',
                          job: jobTitle,
                          company: company,
                        );
                      }),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Mentor Session",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          color: Color(0xff0A1737),
                          fontSize: 16,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "See All",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            color: ColorStyle().disableColors,
                            fontSize: 14,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                          mentorSessionData.mentors!
                                      .where((mentor) => mentor.session!.any(
                                          (session) =>
                                              session.isActive == true))
                                      .length >
                                  6
                              ? 6
                              : mentorSessionData.mentors!
                                  .where((mentor) => mentor.session!.any(
                                      (session) => session.isActive == true))
                                  .length, (index) {
                        final mentor = mentorSessionData.mentors!
                            .where((mentor) => mentor.session!
                                .any((session) => session.isActive == true))
                            .toList()[index];

                        final currentExperience =
                            mentor.experiences!.firstWhere(
                          (experience) => experience.isCurrentJob ?? false,
                          orElse: () =>
                              Experience(), // Menyediakan default Experience jika tidak ditemukan
                        );

                        //buat session active ketika isActive = true
                        final activeSessions = mentor.session!
                            .where((s) => s.isActive == true)
                            .toList();
                        //// buat session full apabila jumlah participant sudah mencapai maxParticipants
                        final isSessionFull = activeSessions.isNotEmpty &&
                            activeSessions.any((session) =>
                                session.participant!.length >=
                                session.maxParticipants!);

                        ///numberOfParticipants = jumlah participant yang sudah join
                        final numberOfParticipants = activeSessions.isNotEmpty
                            ? activeSessions.first.participant!.length
                            : 0;
                        ////// button color is full //////
                        final Color buttonColor = isSessionFull
                            ? ColorStyle().disableColors
                            : ColorStyle().primaryColors;
                        ////// slot///////
                        SessionData sessionElement = mentor.session!.first;
                        int maxParticipants =
                            sessionElement.maxParticipants ?? 0;
                        int currentParticipants =
                            sessionElement.participant?.length ?? 0;
                        int availableSlots =
                            maxParticipants - currentParticipants;
                        return Container(
                          margin: const EdgeInsets.only(right: 8.0),
                          height: 350,
                          width: 250,
                          child: CardItemMentor(
                            title: isSessionFull ? "Full Booked" : "Available",
                            color: buttonColor,
                            onPressesd: () {},
                            imagePath: mentor.photoUrl ??
                                'assets/Handoff/ilustrator/profile.png',
                            name: mentor.name ?? 'No Name',
                            job: currentExperience.jobTitle ?? '',
                            company: currentExperience.company ??
                                'Placeholder Company',
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            );
          }
        });
  }
}