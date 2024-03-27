import 'package:flutter/material.dart';
import 'package:my_flutter_app/admin/model/unverified_mentor_model.dart';
import 'package:my_flutter_app/admin/screen/menu_dasboard_admin/verifikasi_mentor_screen.dart';
import 'package:my_flutter_app/admin/service/unverified_mentor_service.dart';
import 'package:my_flutter_app/widget/menucategory.dart';

class PengajuanMentorAdminScreen extends StatefulWidget {
  PengajuanMentorAdminScreen({Key? key}) : super(key: key);

  @override
  State<PengajuanMentorAdminScreen> createState() =>
      _PengajuanMentorAdminScreenState();
}

class _PengajuanMentorAdminScreenState
    extends State<PengajuanMentorAdminScreen> {
  late Future<List<Mentor>> _unverifiedMentorsFuture;

  @override
  void initState() {
    super.initState();
    _unverifiedMentorsFuture =
        UnverifiedMentorService().fetchUnverifiedMentors();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Mentor>>(
      future: _unverifiedMentorsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error.toString()}'));
        } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          List<Mentor> mentors = snapshot.data!;
          return SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: mentors.map((unverifiedMentor) {
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
                            child: Text(unverifiedMentor.name ?? ''),
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
                                      builder: (context) =>
                                          VerifikasiMentorScreen(
                                        mentorDetail: unverifiedMentor,
                                      ),
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: ColorStyle().primaryColors,
                                  onPrimary: Colors.white,
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
                  child: Center(child: Text('Tidak ada pengajuan mentor')),
                )),
          );
        }
      },
    );
  }
}
