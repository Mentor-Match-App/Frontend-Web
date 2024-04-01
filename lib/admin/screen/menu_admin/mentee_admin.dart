import 'package:flutter/material.dart';
import 'package:my_flutter_app/admin/model/mentee_model.dart';
import 'package:my_flutter_app/admin/screen/menu_admin/detail_mentee_admin.dart';
import 'package:my_flutter_app/admin/service/mentee_service.dart';
import 'package:my_flutter_app/widget/menucategory.dart';

class MenteeScreen extends StatefulWidget {
  @override
  State<MenteeScreen> createState() => _MenteeScreenState();
}

class _MenteeScreenState extends State<MenteeScreen> {
  late Future<List<Mentee>> _menteeFuture;

  @override
  void initState() {
    super.initState();
    _menteeFuture = MenteeService().fetchMentees();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Mentee>>(
      future: _menteeFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error.toString()}'));
        } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          // Check for non-empty data
          List<Mentee> mentees = snapshot.data!;
          return SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: mentees.map((mentees) {
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
                            child: Text(mentees.name ?? ''),
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
                                          DetailMenteeAdmin(menteeDetail: mentees),
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
                  child: Center(child: Text('Tidak ada data mentee')),
                )),
          );
        }
      },
    );
  }
}
