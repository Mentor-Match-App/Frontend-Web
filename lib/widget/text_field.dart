import 'package:flutter/material.dart';
import 'package:my_flutter_app/widget/menucategory.dart';

class TextFieldWidget extends StatefulWidget {
  final bool? readOnly;
  final void Function()? ontap;
  final Widget? suffixIcon;
  final String? Function(String?)? validator; // Tambahkan validator
  final String? hintText;
  final GlobalKey<FormState>? formKey;
  final TextEditingController? controller;
  final bool? enabled; // tambahkan properti enabled
  final String? errorText;

  const TextFieldWidget({
    Key? key,
    this.hintText,
    this.formKey,
    this.controller,
    this.enabled = true,
    this.suffixIcon,
    this.errorText,
    this.validator,
    this.ontap,
    this.readOnly,
    Function(String p1)? onChanged, // inisialisasi properti enabled
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
          autovalidateMode:
              AutovalidateMode.onUserInteraction, // Set autovalidateMode
          validator: widget.validator,
          readOnly: widget.readOnly ?? false,
          controller: widget.controller,
          enabled: widget.enabled, // gunakan properti enabled
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
                vertical: 8.0, horizontal: 12.0), // Add padding
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
          onTap: widget.ontap,
          maxLines: null, // Allow multiple lines
          textAlignVertical: TextAlignVertical.center,
        ),
      ),
    );
  }
}