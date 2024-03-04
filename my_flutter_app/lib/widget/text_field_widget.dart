import 'package:flutter/material.dart';
import 'package:my_flutter_app/widget/menucategory.dart';

class TextFieldWidget extends StatefulWidget {
  final String? hintText;
  final GlobalKey<FormState>? formKey;
  final TextEditingController? controller;

  const TextFieldWidget({
    Key? key,
    this.hintText,
    this.formKey,
    this.controller,
  }) : super(key: key);

  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: SizedBox(
        height: 40,
        child: TextFormField(
          textAlign: TextAlign.start,
          controller: widget.controller,
          decoration: InputDecoration(
            filled: true,
            fillColor: ColorStyle().tertiaryColors,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide.none,
            ),
            hintText: widget.hintText,
            hintStyle: TextStyle(
              fontFamily: FontFamily().regularText.fontFamily,
              color: ColorStyle().disableColors,
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a skill';
            }
            return null;
          },
        ),
      ),
    );
  }
}
