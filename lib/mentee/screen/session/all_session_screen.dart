import 'package:flutter/material.dart';
import 'package:my_flutter_app/mentee/model/session_model.dart';
import 'package:my_flutter_app/mentee/screen/session/detail_mentor_session_screen.dart';
import 'package:my_flutter_app/mentee/service/session_mentor_service.dart';
import 'package:my_flutter_app/widget/card_mentor.dart';
import 'package:my_flutter_app/widget/menucategory.dart';

class AllSessionScreen extends StatefulWidget {
  AllSessionScreen({Key? key}) : super(key: key);

  @override
  State<AllSessionScreen> createState() => _AllSessionScreenState();
}

class _AllSessionScreenState extends State<AllSessionScreen> {
  late Future<Session> futureSessionData;

  @override
  void initState() {
    super.initState();
    futureSessionData = SessionServices().getSessionData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Session>(
      future: futureSessionData,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          final mentors = snapshot.data!.mentors ?? [];

          // Set untuk menyimpan ID mentor yang sudah ditampilkan
          Set<String> displayedMentorIds = Set();

          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                mainAxisExtent: 350,
                maxCrossAxisExtent: 250),
            itemCount: mentors.length,
            itemBuilder: (context, index) {
              final mentor = mentors[index];
              final mentorId = mentor.id ?? "";

              // Periksa apakah ID mentor sudah ditampilkan sebelumnya
              if (displayedMentorIds.contains(mentorId)) {
                // Jika sudah ditampilkan, maka jangan tampilkan lagi
                return SizedBox.shrink();
              } else {
                // Jika belum ditampilkan, tambahkan ID mentor ke Set
                displayedMentorIds.add(mentorId);

                // Mengambil semua sesi aktif dari mentor
                final activeSessions = mentor.session
                        ?.where((session) => session.isActive == true)
                        .toList() ??
                    [];

                // Mendapatkan pengalaman kerja terkini mentor
                final currentExperience = mentor.experiences?.firstWhere(
                  (experience) => experience.isCurrentJob ?? false,
                  orElse: () => Experience(),
                );

                // Mendapatkan status ketersediaan sesi
                final isSessionFull = activeSessions.isNotEmpty &&
                    activeSessions.any((session) =>
                        session.participant?.length == session.maxParticipants);

                // Mendapatkan jumlah peserta sesi
                final numberOfParticipants = activeSessions.isNotEmpty
                    ? activeSessions.first.participant?.length ?? 0
                    : 0;

                // Mendapatkan warna tombol sesuai dengan status ketersediaan sesi
                final Color buttonColor = isSessionFull
                    ? ColorStyle().disableColors
                    : ColorStyle().primaryColors;

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CardItemMentor(
                    title: isSessionFull ? "Full Booked" : "Available",
                    color: buttonColor,
                    onPressesd: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailMentorSessionScreen(
                            session: mentor.session,
                            availableSlots: mentor.session!.isEmpty
                                ? 0
                                : mentor.session!.first.maxParticipants! -
                                    (mentor.session!.first.participant
                                            ?.length ??
                                        0),
                            detailmentor: mentor,
                            totalParticipants: numberOfParticipants,
                            mentorReviews: mentor.mentorReviews ?? [],
                          ),
                        ),
                      );
                    },
                    imagePath: mentor.photoUrl ??
                        'assets/Handoff/ilustrator/profile.png',
                    name: mentor.name ?? 'No Name',
                    job: currentExperience?.jobTitle ?? '',
                    company:
                        currentExperience?.company ?? 'Placeholder Company',
                  ),
                );
              }
            },
            shrinkWrap: true,
            physics: ScrollPhysics(),
          );
        } else {
          return Center(child: Text("No data available"));
        }
      },
    );
  }
}
