import 'package:flutter/material.dart';
import 'package:my_flutter_app/mentee/screen/premium_class/detail_class_mentor_all_screen.dart';
import 'package:my_flutter_app/widget/menucategory.dart';

class SuccesCreateClassScreen extends StatefulWidget {
  SuccesCreateClassScreen({Key? key}) : super(key: key);

  @override
  State<SuccesCreateClassScreen> createState() =>
      _SuccesCreateClassScreenState();
}

class _SuccesCreateClassScreenState extends State<SuccesCreateClassScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/Handoff/ilustrator/verification.png'),
                Text(
                  'Pengajuan Kelas telah Dikirim ',
                  style: FontFamily().boldText.copyWith(
                        fontSize: 16,
                        color: ColorStyle().succesColors,
                      ),
                ),
                Text(
                  textAlign: TextAlign.center,
                  "Tunggu sebentar, kelas sedang dalam proses pengajuan. Kami akan memberi tahu Anda begitu kelas tersedia. Terima kasih atas kesabaran Anda.",
                  style: FontFamily().regularText,
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 400,
                  child: ElevatedButtonWidget(
                    title: 'Lihat status pengajuan',
                    onPressed: () {
                      // Navigator.pushAndRemoveUntil(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => MyClassMentorListScreen()),
                      //     (route) => false);
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
