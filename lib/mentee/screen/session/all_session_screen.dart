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
          final mentors = snapshot.data!.mentors!
              .where((mentor) => mentor.session!
                  .any((sessionElement) => sessionElement.isActive == true))
              .toList();

          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                mainAxisExtent: 350,
                maxCrossAxisExtent: 250),
            itemCount: mentors.length,
            itemBuilder: (context, index) {
              final mentor = mentors[index];

              final currentExperience = mentor.experiences!.firstWhere(
                (experience) => experience.isCurrentJob ?? false,
                orElse: () => Experience(),
              );

              final activeSessions =
                  mentor.session!.where((s) => s.isActive == true).toList();

              final isSessionFull = activeSessions.isNotEmpty &&
                  activeSessions.any((session) =>
                      session.participant!.length >= session.maxParticipants!);

              final numberOfParticipants = activeSessions.isNotEmpty
                  ? activeSessions.first.participant!.length
                  : 0;

              final Color buttonColor = isSessionFull
                  ? ColorStyle().disableColors
                  : ColorStyle().primaryColors;

              SessionElement sessionElement = mentor.session!.first;
              int maxParticipants = sessionElement.maxParticipants ?? 0;
              int currentParticipants = sessionElement.participant?.length ?? 0;
              int availableSlots = maxParticipants - currentParticipants;
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: CardItemMentor(
                  // apabila session penuh maka tiitlenya " session full" , tetapi apabila tidak full maka " available"
                  title: isSessionFull ? "Full Booked" : "Available",
                  color: buttonColor,
                  onPressesd: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailMentorSessionScreen(
                          availableSlots: availableSlots,
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
                  job: currentExperience.jobTitle ?? '',
                  company: currentExperience.company ?? 'Placeholder Company',
                ),
              );
            },

            shrinkWrap: true,
            physics:
                ScrollPhysics(), // Allows scrolling within a SingleChildScrollView
          );
        } else {
          return Center(child: Text("No data available"));
        }
      },
    );
  }
}
