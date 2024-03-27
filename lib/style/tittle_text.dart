import 'package:flutter/material.dart';
import 'package:my_flutter_app/widget/menucategory.dart';

class TittleTextField extends StatelessWidget {
  final String? title;
  final Color? color;
  final TextAlign? textAlign;
  const TittleTextField({Key? key, this.title, this.color, this.textAlign})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0, bottom: 8.0, right: 8.0),
      child: Text(
        title!,
        style: FontFamily().titleText.copyWith(
              fontSize: 18,
              color: color,
            ),
        textAlign: textAlign,
      ),
    );
  }
}
