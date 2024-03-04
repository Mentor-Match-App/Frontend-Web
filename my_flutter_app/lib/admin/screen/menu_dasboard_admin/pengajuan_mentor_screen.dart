import 'package:flutter/material.dart';
import 'package:my_flutter_app/admin/screen/menu_dasboard_admin/verifikasi_mentor_screen.dart';
import 'package:my_flutter_app/widget/menucategory.dart';

class PengajuanMentorAdminScreen extends StatefulWidget {
  PengajuanMentorAdminScreen({Key? key}) : super(key: key);

  @override
  State<PengajuanMentorAdminScreen> createState() =>
      _PengajuanMentorAdminScreenState();
}

class _PengajuanMentorAdminScreenState
    extends State<PengajuanMentorAdminScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 700,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ColorStyle().tertiaryColors,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Penajuan Mentor Content"),
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
                        builder: (context) => VerifikasiMentorScreen(),
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
            )
          ],
        ),
      ),
    );
  }
}
