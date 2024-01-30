import 'package:flutter/material.dart';
import 'package:my_flutter_app/widget/community_widget.dart';

class ComunityScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: 4,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio:
              0.8, // Sesuaikan dengan aspek rasio yang Anda inginkan
        ),
        itemBuilder: (BuildContext context, int index) {
          return CardCommunity(
            title: "KotlinKoders Community",
            imagePath: 'assets/Handoff/CommunityLogo/Kotlin.png',
          );
        },
      ),
    );
  }
}
