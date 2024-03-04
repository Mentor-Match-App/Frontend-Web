import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PembayaranAdminScreen extends StatefulWidget {
  PembayaranAdminScreen({Key? key}) : super(key: key);

  @override
  State<PembayaranAdminScreen> createState() => _PembayaranAdminScreenState();
}

class _PembayaranAdminScreenState extends State<PembayaranAdminScreen> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [Text("ini pembayaran")],
      ),
    );
  }
}
