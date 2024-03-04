// import 'package:flutter/material.dart';
// import 'package:my_flutter_app/style/colorStyle.dart';
// import 'package:my_flutter_app/widget/card_active_widget_admin.dart';

// class HomeScreenAdmin2 extends StatefulWidget {
//   HomeScreenAdmin2({Key? key}) : super(key: key);

//   @override
//   State<HomeScreenAdmin2> createState() => _HomeScreenAdmin2State();
// }

// class _HomeScreenAdmin2State extends State<HomeScreenAdmin2> {
//   Widget?
//       selectedWidget; // Variabel untuk menampung widget yang akan ditampilkan
// bool isKelasActive =
//       false; // Variabel untuk mengontrol status "Pengajuan Kelas"
//   bool isMentorActive =
//       false; // Variabel untuk mengontrol status "Pengajuan Mentor"
//   void _handleMenuSelected(String menu) {
//     setState(() {
//       if (menu == 'Pengajuan Kelas') {
//         selectedWidget = KelasContent(); // Menampilkan KelasContent
//       } else if (menu == 'Pengajuan Mentor') {
//         selectedWidget = MentorContent(); // Menampilkan MentorContent
//       } else {
//         selectedWidget =
//             null; // Menampilkan konten kosong jika tidak ada menu yang dipilih
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         // ... Bagian header lainnya ...

//         Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             CardActiveAdminWidget(
//               onTap: () {
//                 _handleMenuSelected('Pengajuan Kelas');
//               },
//               image:
//                   AssetImage('assets/Handoff/icon/adminIcon/Premium Class.png'),
//               text: 'Pengajuan Kelas',
//               isActive: isKelasActive, // Berikan nilai isActive yang sesuai
//             ),
//             CardActiveAdminWidget(
//               isActive: isMentorActive,
//               onTap: () {
//                 _handleMenuSelected('Pengajuan Mentor');
//               },
//               image: AssetImage('assets/Handoff/icon/adminIcon/Mentor.png'),
//               text: 'Pengajuan Mentor',
//             ),
//           ],
//         ),

//         // ... Bagian konten lainnya ...

//         // Menampilkan widget yang dipilih berdasarkan opsi
//         if (selectedWidget != null) selectedWidget!,
//       ],
//     );
//   }
// }

// class KelasContent extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Container(
//         width: 700,
//         height: 60,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//           color: ColorStyle().tertiaryColors,
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             const Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text("Kelas Content"),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: SizedBox(
//                 width: 160,
//                 height: 40,
//                 child: ElevatedButton(
//                   onPressed: () {},
//                   style: ElevatedButton.styleFrom(
//                     primary: ColorStyle().primaryColors,
//                     onPrimary: Colors.white,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                   child: Text("Lihat Detail"),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// class MentorContent extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Container(
//         width: 700,
//         height: 60,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//           color: ColorStyle().tertiaryColors,
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             const Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text("Mentor Content"),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: SizedBox(
//                 width: 160,
//                 height: 40,
//                 child: ElevatedButton(
//                   onPressed: () {},
//                   style: ElevatedButton.styleFrom(
//                     primary: ColorStyle().primaryColors,
//                     onPrimary: Colors.white,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                   child: Text("Lihat Detail"),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
