import 'package:flutter/material.dart';
import 'package:my_flutter_app/widget/menucategory.dart';

class ElevatedButtonWidget extends StatelessWidget {
  final Function()? onPressed;
  final String? title;
  final Color? color;
  const ElevatedButtonWidget({Key? key, this.onPressed, this.title, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 396,
      height: 48,
      child: ElevatedButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            backgroundColor:
                MaterialStateProperty.all<Color>(ColorStyle().primaryColors)),

        onPressed: onPressed,
        // },
        child: Text(
          title!,
          style: FontFamily().buttonText.copyWith(
                fontSize: 16,
              ),
        ),
      ),
    );
  }
}

class SmallElevatedButtonWidget extends StatefulWidget {
  final String text;
  final void Function()? onPressed;
  SmallElevatedButtonWidget({
    Key? key,
    required this.text,
    this.onPressed,
  }) : super(key: key);

  @override
  State<SmallElevatedButtonWidget> createState() =>
      _SmallElevatedButtonWidgetState();
}

class _SmallElevatedButtonWidgetState extends State<SmallElevatedButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorStyle().primaryColors,
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
        ),
        child: Text(
          widget.text,
          style: TextStyle(fontSize: 12, color: ColorStyle().whiteColors),
        ),
      ),
    );
  }
}

class SmallOutlineButtonWidget extends StatefulWidget {
  final String text;
  final void Function()? onPressed;
  SmallOutlineButtonWidget({
    Key? key,
    required this.text,
    this.onPressed,
  }) : super(key: key);

  @override
  State<SmallOutlineButtonWidget> createState() =>
      _SmallOutlineButtonWidgetState();
}

class _SmallOutlineButtonWidgetState extends State<SmallOutlineButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: widget.onPressed,
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: ColorStyle().primaryColors),
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
      child: Text(
        widget.text,
        style: TextStyle(fontSize: 15, color: ColorStyle().primaryColors),
      ),
    );
  }
}

class RegularElevatedButtonWidget extends StatefulWidget {
  final void Function()? onPressed;
  final String text;

  RegularElevatedButtonWidget({Key? key, required this.text, this.onPressed})
      : super(key: key);

  @override
  State<RegularElevatedButtonWidget> createState() =>
      _RegularElevatedButtonWidgetState();
}

class _RegularElevatedButtonWidgetState
    extends State<RegularElevatedButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ElevatedButton.styleFrom(
          primary: ColorStyle().primaryColors,
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          minimumSize: Size(425, 65), // Atur lebar dan tinggi tombol di sini
        ),
        child: Text(
          widget.text,
          style: TextStyle(fontSize: 15, color: ColorStyle().whiteColors),
        ),
      ),
    );
  }
}

class RegularOutlineButtonWidget extends StatefulWidget {
  final void Function()? onPressed;
  final String text;

  RegularOutlineButtonWidget({Key? key, required this.text, this.onPressed})
      : super(key: key);

  @override
  State<RegularOutlineButtonWidget> createState() =>
      _RegularOutlineButtonWidgetState();
}

class _RegularOutlineButtonWidgetState
    extends State<RegularOutlineButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: OutlinedButton(
        onPressed: widget.onPressed,
        style: OutlinedButton.styleFrom(
          side: BorderSide(
              color: ColorStyle()
                  .primaryColors), // Atur warna garis pinggir tombol di sini
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          minimumSize: Size(400, 65), // Atur lebar dan tinggi tombol di sini
        ),
        child: Text(
          widget.text,
          style: TextStyle(
              fontSize: 15,
              color:
                  ColorStyle().primaryColors), // Atur warna teks tombol di sini
        ),
      ),
    );
  }
}
