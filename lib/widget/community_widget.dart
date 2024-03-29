import 'package:flutter/material.dart';
import 'package:my_flutter_app/widget/button_widget.dart';
import 'package:my_flutter_app/widget/menucategory.dart';

class CardCommunity extends StatefulWidget {
  final String title;
  final String imagePath;
  final Function()? onPressed;

  CardCommunity({
    Key? key,
    required this.imagePath,
    required this.title,
    this.onPressed,
  }) : super(key: key);

  @override
  State<CardCommunity> createState() => _CardCommunityState();
}

class _CardCommunityState extends State<CardCommunity> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 208,
        width: 220,
        decoration: BoxDecoration(
          color: ColorStyle().tertiaryColors,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(
                widget.imagePath,
                height: 100,
                width: 111,
                fit: BoxFit.fill,
              ),
              SizedBox(height: 12),
              Text(
                widget.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: ColorStyle().secondaryColors,
                  fontSize: 12,
                  fontFamily: FontFamily().titleText.fontFamily,
                ),
              ),
              SizedBox(height: 12),
              if (widget.title == 'Create Community')
                SmallElevatedButtonWidget(
                  text: 'Buat Komunitas Baru',
                  onPressed: widget.onPressed,
                ),
              if (widget.title != 'Create Community')
                SmallElevatedButtonWidget(
                  text: 'Bergabung',
                  onPressed: widget.onPressed,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
