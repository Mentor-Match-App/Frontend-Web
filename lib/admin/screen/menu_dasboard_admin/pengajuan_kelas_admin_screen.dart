import 'package:flutter/material.dart';
import 'package:my_flutter_app/admin/model/unverified_class_model.dart';
import 'package:my_flutter_app/admin/screen/menu_dasboard_admin/detail_pengajuan_verifikasi_kelas.dart';
import 'package:my_flutter_app/admin/service/unverified_class_service.dart';
import 'package:my_flutter_app/widget/menucategory.dart';

class PengajuanKelasAdminScreen extends StatefulWidget {
  @override
  _PengajuanKelasAdminScreenState createState() =>
      _PengajuanKelasAdminScreenState();
}

class _PengajuanKelasAdminScreenState extends State<PengajuanKelasAdminScreen> {
  late Future<List<Class>> _unverifiedClassesFuture;

  @override
  void initState() {
    super.initState();
    _unverifiedClassesFuture =
        UnverifiedClassService().fetchUnverifiedClasses();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Class>>(
      future: _unverifiedClassesFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error.toString()}'));
        } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          // Check for non-empty data
          List<Class> classes = snapshot.data!;
          return SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: classes.map((unverifiedClass) {
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
                            child: Text(unverifiedClass.name ?? ''),
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
                                          DetailPengajuanKelasScreen(
                                              classDetail: unverifiedClass),
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
                  child: Center(child: Text('Tidak ada pengajuan kelas')),
                )),
          );
        }
      },
    );
  }
}
