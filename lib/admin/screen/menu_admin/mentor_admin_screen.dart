import 'package:flutter/material.dart';
import 'package:my_flutter_app/admin/model/mentor_model.dart';
import 'package:my_flutter_app/admin/screen/menu_admin/detail_mentor_admin.dart';
import 'package:my_flutter_app/admin/service/mentor_service.dart';
import 'package:my_flutter_app/widget/menucategory.dart';

class MentorScreen extends StatefulWidget {
  const MentorScreen({super.key});

  @override
  State<MentorScreen> createState() => _MentorScreenState();
}

class _MentorScreenState extends State<MentorScreen> {
  late Future<List<Mentor>> _mentorFuture;

  @override
  void initState() {
    super.initState();
    _mentorFuture = MentorService().fetchMentors();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Mentor>>(
      future: _mentorFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error.toString()}'));
        } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          // Check for non-empty data
          List<Mentor> mentors = snapshot.data!;
          return SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: mentors.map((mentors) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: ColorStyle().tertiaryColors,
                      ),
                      width: 800,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(mentors.name ?? ''),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: 160,
                              height: 40,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailMentorAdmin(
                                          mentorDetail: mentors),
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white, backgroundColor: ColorStyle().primaryColors,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: Text("Lihat Detail"),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }).toList(),
          ));
        } else {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: ColorStyle().tertiaryColors,
                ),
                width: 800,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(child: Text('Tidak ada data mentor')),
                )),
          );
        }
      },
    );
  }
}
