// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:my_flutter_app/widget/profileavatar.dart';

// class CustomInfoContainer extends StatelessWidget {
//   final String title;
//   final String? subtitle;
//   final Widget? actionWidget;

//   const CustomInfoContainer({
//     required this.title,
//     this.subtitle,
//     this.actionWidget,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.all(20.0),
//       decoration: BoxDecoration(
//         color: Color(0xFFF8F1F1),
//         borderRadius: BorderRadius.circular(1.0),
//       ),
//       margin: const EdgeInsets.only(bottom: 20.0),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Right Section with Title, Subtitle, and ActionWidget
//           SizedBox(width: 10.0),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   title,
//                   style: GoogleFonts.poppins(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.orange,
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 if (subtitle != null && subtitle!.isNotEmpty)
//                   SingleChildScrollView(
//                     child: Container(
//                       width: double.infinity,
//                       child: Text(
//                         subtitle!,
//                         style: GoogleFonts.poppins(
//                           fontSize: 24,
//                           fontWeight: FontWeight.normal,
//                         ),
//                       ),
//                     ),
//                   ),
//                 if (actionWidget != null) SizedBox(height: 20),
//                 if (actionWidget != null) actionWidget!,
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class PersonalProfilePage extends StatefulWidget {
//   PersonalProfilePage({Key? key}) : super(key: key);

//   @override
//   State<PersonalProfilePage> createState() => _PersonalProfilePageState();
// }

// class _PersonalProfilePageState extends State<PersonalProfilePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(80.0),
//         child: NavbarWidgetMentee(),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             // Larger Green Section
//             Container(
//               height: 500,
//               width: double.maxFinite,
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [
//                     Color(0xFFf8f0f0), // #F8F0F0
//                     Colors.white,
//                   ],
//                   stops: [0.5, 0.5],
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                 ),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(50.0),
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     ProfileAvatar(
//                       imageUrl: 'assets/Handoff/ilustrator/profile.png',
//                       radius: 80,
//                     ),
//                     SizedBox(width: 20),
//                     Expanded(
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(
//                                 "Charline June",
//                                 style: GoogleFonts.poppins(
//                                   fontWeight: FontWeight.w400,
//                                   fontSize: 24,
//                                   color: Colors.black,
//                                 ),
//                               ),
//                               Row(
//                                 children: [
//                                   Icon(
//                                     Icons.edit, // Pencil icon
//                                     size: 24,
//                                     color: Colors.black,
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                           SizedBox(height: 35),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: [
//                               Row(
//                                 children: [
//                                   Icon(
//                                     Icons.work_outline_outlined,
//                                     size: 16,
//                                     color: const Color(0xffE78938),
//                                   ),
//                                   SizedBox(width: 5),
//                                   Text(
//                                     "UI/UX Designer",
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.w300,
//                                       fontSize: 24,
//                                       color: Color(0xff313030),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               SizedBox(width: 20),
//                               Expanded(
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.end,
//                                   children: [
//                                     Icon(
//                                       Icons.location_on_outlined,
//                                       size: 16,
//                                       color: const Color(0xffE78938),
//                                     ),
//                                     SizedBox(width: 5),
//                                     Text(
//                                       "Jakarta Selatan",
//                                       style: TextStyle(
//                                         fontWeight: FontWeight.w300,
//                                         fontSize: 24,
//                                         color: Color(0xff313030),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                           SizedBox(height: 5),
//                           Row(
//                             children: [
//                               Icon(
//                                 Icons.home_work_outlined,
//                                 size: 16,
//                                 color: const Color(0xffE78938),
//                               ),
//                               SizedBox(width: 4),
//                               Text(
//                                 "SMA SATU NUSA SATU BANGSA",
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.w300,
//                                   fontSize: 24,
//                                   color: Color(0xff313030),
//                                 ),
//                               ),
//                               SizedBox(width: 20),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),

//             // Custom Info Container
//             Padding(
//               padding: const EdgeInsets.all(35.0),
//               child: Column(
//                 children: [
//                   CustomInfoContainer(
//                     title: "About",
//                     subtitle:
//                         "Experienced in business strategy, startup development, and leadership. Specialized expertise in building mobile applications.Experienced in business strategy, startup development, and leadership. Specialized expertise in building mobile applications.",
//                     actionWidget: Padding(
//                       padding: const EdgeInsets.only(
//                         top: 10.0,
//                         bottom: 10.0,
//                         right: 1150,
//                       ),
//                       child: TextButton(
//                         style: TextButton.styleFrom(
//                           backgroundColor: Color(0xffE78938), // Primary color
//                           padding: EdgeInsets.symmetric(
//                             vertical: 20.0,
//                             horizontal: 45.0,
//                           ),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(0.0),
//                           ),
//                         ),
//                         onPressed: () {},
//                         child: Row(
//                           children: [
//                             Image.asset(
//                               'Handoff/icon/social-icons/linkedin.png',
//                               width: 35.0,
//                               height: 35.0,
//                               color: Colors.white,
//                             ),
//                             SizedBox(width: 8.0),
//                             Text(
//                               "Linkedin",
//                               style: TextStyle(
//                                 fontWeight: FontWeight.w300,
//                                 fontSize: 18,
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   CustomInfoContainer(
//                     title: "Skill",
//                     actionWidget: Row(
//                       children: [
//                         OutlinedButton(
//                           style: OutlinedButton.styleFrom(
//                             foregroundColor: Color(0xffE78938),
//                             padding: EdgeInsets.symmetric(
//                               vertical: 20.0,
//                               horizontal: 16.0,
//                             ),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(0.0),
//                             ),
//                           ),
//                           onPressed: () {},
//                           child: Text(
//                             "Java Script",
//                             style: TextStyle(
//                               fontWeight: FontWeight.w300,
//                               fontSize: 24,
//                               color: Color(0xff0A1737), // Text color
//                             ),
//                           ),
//                         ),
//                         SizedBox(width: 8),
//                         Padding(
//                           padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
//                           child: OutlinedButton(
//                             style: OutlinedButton.styleFrom(
//                               foregroundColor: Color(0xffE78938),
//                               padding: EdgeInsets.symmetric(
//                                 vertical: 20.0,
//                                 horizontal: 16.0,
//                               ),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(0.0),
//                               ),
//                             ),
//                             onPressed: () {},
//                             child: Text(
//                               "Flutter/Dart",
//                               style: TextStyle(
//                                 fontWeight: FontWeight.w300,
//                                 fontSize: 24,
//                                 color: Color(0xff0A1737), // Text color
//                               ),
//                             ),
//                           ),
//                         ),
//                         SizedBox(width: 8),
//                         Padding(
//                           padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
//                           child: OutlinedButton(
//                             style: OutlinedButton.styleFrom(
//                               foregroundColor: Color(0xffE78938),
//                               padding: EdgeInsets.symmetric(
//                                 vertical: 20.0,
//                                 horizontal: 16.0,
//                               ),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(0.0),
//                               ),
//                             ),
//                             onPressed: () {},
//                             child: Text(
//                               "HTML/CSS",
//                               style: TextStyle(
//                                 fontWeight: FontWeight.w300,
//                                 fontSize: 24,
//                                 color: Color(0xff0A1737), // Text color
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             // Additional Info Containers can be added here

//             // Add any additional widgets or sections as needed
//           ],
//         ),
//       ),
//     );
//   }
// }
