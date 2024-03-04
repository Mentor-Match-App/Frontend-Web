import 'package:flutter/material.dart';
import 'package:my_flutter_app/admin/screen/menu_admin/pembayaran_admin_screen.dart';
import 'package:my_flutter_app/widget/menucategory.dart';

class PengajuanPembayaraAdminScreenState extends StatefulWidget {
  PengajuanPembayaraAdminScreenState({Key? key}) : super(key: key);

  @override
  State<PengajuanPembayaraAdminScreenState> createState() =>
      _PengajuanPembayaraAdminScreenStateState();
}

class _PengajuanPembayaraAdminScreenStateState
    extends State<PengajuanPembayaraAdminScreenState> {
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
              child: Text("150 Pengajuan"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 180,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PembayaranAdminScreen(),
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
                  child: Text("Lihat Pembayaran"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
