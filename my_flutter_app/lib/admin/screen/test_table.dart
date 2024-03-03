import 'package:flutter/material.dart';
import 'package:my_flutter_app/style/colorStyle.dart';
import 'package:my_flutter_app/style/fontStyle.dart';
import 'package:my_flutter_app/widget/button_widget.dart';

class MytableScreen_test extends StatefulWidget {
  @override
  _MytableScreen_testState createState() => _MytableScreen_testState();
}

class _MytableScreen_testState extends State<MytableScreen_test> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('DataTable Demo'),
        ),
        body: ListView(
          children: [_createDataTable()],
        ),
      ),
    );
  }

  DataTable _createDataTable() {
    return DataTable(columns: _createColumns(), rows: _createRows());
  }

  List<DataColumn> _createColumns() {
    return [
      DataColumn(
        label: Text(
          'Name',
          style: FontFamily()
              .titleText
              .copyWith(fontSize: 12, color: ColorStyle().primaryColors),
        ),
      ),
      DataColumn(
        label: Text(
          'Tingkat Pendidikan',
          style: FontFamily()
              .titleText
              .copyWith(fontSize: 12, color: ColorStyle().primaryColors),
        ),
      ),
      DataColumn(
        label: Text(
          'Bidang & Minat',
          style: FontFamily()
              .titleText
              .copyWith(fontSize: 12, color: ColorStyle().primaryColors),
        ),
      ),
      DataColumn(
        label: Text(
          'Nama Kelas',
          style: FontFamily()
              .titleText
              .copyWith(fontSize: 12, color: ColorStyle().primaryColors),
        ),
      ),
      DataColumn(
        label: Text(
          'Nama Mentor',
          style: FontFamily()
              .titleText
              .copyWith(fontSize: 12, color: ColorStyle().primaryColors),
        ),
      ),
      DataColumn(
        label: Text(
          'Kode Transaksi',
          style: FontFamily()
              .titleText
              .copyWith(fontSize: 12, color: ColorStyle().primaryColors),
        ),
      ),
      DataColumn(
        label: Text(
          'Tanggal Transaksi',
          style: FontFamily()
              .titleText
              .copyWith(fontSize: 12, color: ColorStyle().primaryColors),
        ),
      ),
      DataColumn(
        label: Text(
          'Status',
          style: FontFamily()
              .titleText
              .copyWith(fontSize: 12, color: ColorStyle().primaryColors),
        ),
      )
    ];
  }

  List<DataRow> _createRows() {
    return [
      DataRow(cells: [
        const DataCell(Text('thiyara')),
        const DataCell(Text('SMA')),
        const DataCell(Text('Bahasa')),
        const DataCell(Text('Bahasa Inggris')),
        const DataCell(Text('Steven Jobs')),
        const DataCell(Text('123456')),
        const DataCell(Text('4 Januari 2024')),
        DataCell(Row(
          children: [
            SmallElevatedButtonWidget(text: "Berhasil"),
            SmallOutlineButtonWidget(text: "Gagal")
          ],
        ))
      ]),
      DataRow(cells: [
        const DataCell(Text('thiyara')),
        const DataCell(Text('SMA')),
        const DataCell(Text('Bahasa')),
        const DataCell(Text('Bahasa Inggris')),
        const DataCell(Text('Steven Jobs')),
        const DataCell(Text('123456')),
        const DataCell(Text('4 Januari 2024')),
        DataCell(Row(
          children: [
            SmallElevatedButtonWidget(text: "Berhasil"),
            SmallOutlineButtonWidget(text: "Gagal")
          ],
        ))
      ]),
      DataRow(cells: [
        const DataCell(Text('thiyara')),
        const DataCell(Text('SMA')),
        const DataCell(Text('Bahasa')),
        const DataCell(Text('Bahasa Inggris')),
        const DataCell(Text('Steven Jobs')),
        const DataCell(Text('123456')),
        const DataCell(Text('4 Januari 2024')),
        DataCell(Row(
          children: [
            SmallElevatedButtonWidget(text: "Berhasil"),
            SmallOutlineButtonWidget(text: "Gagal")
          ],
        ))
      ]),
      DataRow(cells: [
        const DataCell(Text('thiyara')),
        const DataCell(Text('SMA')),
        const DataCell(Text('Bahasa')),
        const DataCell(Text('Bahasa Inggris')),
        const DataCell(Text('Steven Jobs')),
        const DataCell(Text('123456')),
        const DataCell(Text('4 Januari 2024')),
        DataCell(Row(
          children: [
            SmallElevatedButtonWidget(text: "Berhasil"),
            SmallOutlineButtonWidget(text: "Gagal")
          ],
        ))
      ]),
      DataRow(cells: [
        const DataCell(Text('thiyara')),
        const DataCell(Text('SMA')),
        const DataCell(Text('Bahasa')),
        const DataCell(Text('Bahasa Inggris')),
        const DataCell(Text('Steven Jobs')),
        const DataCell(Text('123456')),
        const DataCell(Text('4 Januari 2024')),
        DataCell(Row(
          children: [
            SmallElevatedButtonWidget(text: "Berhasil"),
            SmallOutlineButtonWidget(text: "Gagal")
          ],
        ))
      ]),
      DataRow(cells: [
        const DataCell(Text('thiyara')),
        const DataCell(Text('SMA')),
        const DataCell(Text('Bahasa')),
        const DataCell(Text('Bahasa Inggris')),
        const DataCell(Text('Steven Jobs')),
        const DataCell(Text('123456')),
        const DataCell(Text('4 Januari 2024')),
        DataCell(Row(
          children: [
            SmallElevatedButtonWidget(text: "Berhasil"),
            SmallOutlineButtonWidget(text: "Gagal")
          ],
        ))
      ])
    ];
  }
}
