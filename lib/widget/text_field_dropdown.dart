import 'package:flutter/material.dart';
import 'package:my_flutter_app/widget/menucategory.dart';
import 'package:my_flutter_app/style/fontStyle.dart';

class MyDropdownWidget extends StatefulWidget {
  final String hintText;
  final List<String> items;
  final Color? textColor;
  final ValueChanged<String>? onChanged;
  final String? initialValue;

  const MyDropdownWidget({
    Key? key,
    this.hintText = 'Select an item',
    required this.items,
    this.textColor,
    this.initialValue,
    this.onChanged,
  }) : super(key: key);

  @override
  _MyDropdownWidgetState createState() => _MyDropdownWidgetState();
}

class _MyDropdownWidgetState extends State<MyDropdownWidget> {
  String? selectedValue;
    @override
  void initState() {
    super.initState();
    // Inisialisasi selectedValue dengan initialValue jika disediakan
    selectedValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: DropdownButtonFormField<String>(
        value: selectedValue,
        decoration: InputDecoration(
          filled: true,
          fillColor: ColorStyle().tertiaryColors,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide.none,
          ),
          hintText: selectedValue ?? widget.hintText,
          hintStyle: FontFamily().regularText.copyWith(
                color: ColorStyle().disableColors,
              ),
        ),
        onChanged: (String? newValue) {
          setState(() {
            selectedValue = newValue;
          });

          if (widget.onChanged != null) {
            widget.onChanged!(newValue ?? "");
          }
        },
        items: ['Select an item', ...widget.items]
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: FontFamily().regularText.copyWith(
                    color: widget.textColor ?? Colors.black,
                  ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class MyDropdownWidgetSession extends StatelessWidget {
  final List<String> items;
  final String? selectedValue;
  final Function(String?) onChanged;

  MyDropdownWidgetSession(
      {Key? key,
      required this.items,
      this.selectedValue,
      required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: DropdownButtonFormField<String>(
          value: selectedValue,
          decoration: InputDecoration(
            filled: true,
            fillColor: ColorStyle().tertiaryColors,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide.none,
            ),
            hintText: selectedValue ?? 'select category session',
            hintStyle: FontFamily().regularText.copyWith(
                  color: ColorStyle().disableColors,
                ),
          ),
          onChanged: onChanged,
          items: items.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList()),
    );
  }
}
