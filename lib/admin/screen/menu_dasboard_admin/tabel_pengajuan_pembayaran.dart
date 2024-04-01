import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_flutter_app/admin/model/unverified_transaction.dart';
import 'package:my_flutter_app/admin/service/unverified_transaction_service.dart';
import 'package:my_flutter_app/widget/button_widget.dart';

class TabelVerifikasiPembayaran extends StatefulWidget {
  @override
  _TabelVerifikasiPembayaranState createState() =>
      _TabelVerifikasiPembayaranState();
}

class _TabelVerifikasiPembayaranState extends State<TabelVerifikasiPembayaran> {
  final UnverifiedTransactionService _unverifiedTransactionService =
      UnverifiedTransactionService();
  List<Transaction> _transactions = [];

  @override
  void initState() {
    super.initState();
    _fetchTransactions();
  }

  // Fetch transactions from the service
  void _fetchTransactions() async {
    try {
      List<Transaction> transactions =
          await _unverifiedTransactionService.fetchUnverifiedTransactions();
      setState(() {
        _transactions = transactions;
      });
    } catch (e) {
      // Handle or log error
      print("Error fetching transactions: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Data Pembayaran Premium Class'),
        ),
        body: _transactions.isEmpty
            ? Center(
                child: Center(
                    child: Text('Tidak ada data transaksi yang tersedia.')),
              )
            : ListView(
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
        label: Container(
          width: 100, // Maximum width
          child: Text(
            'Name',
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 10),
          ),
        ),
      ),
      DataColumn(
        label: Container(
          width: 100, // Maximum width
          child: Text(
            'Tingkat Pendidikan',
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 10),
          ),
        ),
      ),
      DataColumn(
        label: Container(
          width: 100, // Maximum width
          child: Text(
            'Bidang & Minat',
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 10),
          ),
        ),
      ),
      DataColumn(
        label: Container(
          width: 100, // Maximum width
          child: Text(
            'Nama Kelas',
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 10),
          ),
        ),
      ),
      DataColumn(
        label: Container(
          width: 100, // Maximum width
          child: Text(
            'Nama Mentor',
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 10),
          ),
        ),
      ),
      DataColumn(
        label: Container(
          width: 100, // Maximum width
          child: Text(
            'Kode Transaksi',
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 10),
          ),
        ),
      ),
      DataColumn(
        label: Container(
          width: 100, // Maximum width
          child: Text(
            'Tanggal Transaksi',
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 10),
          ),
        ),
      ),
      DataColumn(
        label: Container(
          width: 100, // Maximum width
          child: Text(
            'Status',
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 10),
          ),
        ),
      ),
    ];
  }

  // Dynamically create rows based on the fetched transactions
  List<DataRow> _createRows() {
    return _transactions.map((transaction) {
      return DataRow(cells: [
        DataCell(Text(
          transaction.user?.name ?? '',
          style: TextStyle(fontSize: 10), // Set font size to 10
        )),
        DataCell(Text(
          transaction.transactionClass?.educationLevel ?? '',
          style: TextStyle(fontSize: 10), // Set font size to 10
        )),
        DataCell(Text(
          transaction.transactionClass?.category ?? '',
          style: TextStyle(fontSize: 10), // Set font size to 10
        )),
        DataCell(Text(
          transaction.transactionClass?.name ?? '',
          style: TextStyle(fontSize: 10), // Set font size to 10
        )),
        DataCell(Text(
          transaction.transactionClass?.mentor?.name ?? '',
          style: TextStyle(fontSize: 10), // Set font size to 10
        )),
        DataCell(Text(
          transaction.uniqueCode.toString(),
          style: TextStyle(fontSize: 10), // Set font size to 10
        )),
        DataCell(Text(
          DateFormat('dd MMMM yyyy')
              .format(DateTime.parse(transaction.createdAt ?? '')),
          style: TextStyle(fontSize: 10), // Set font size to 10
        )),
        DataCell(Row(
          children: [
            SmallOutlineButtonWidget(
              text: "Tolak",
              onPressed: () => _showConfirmationDialog(
                  transaction.id.toString(), false), // false for rejection
            ),
            SmallElevatedButtonWidget(
              text: "Verifikasi",
              onPressed: () => _showConfirmationDialog(
                  transaction.id.toString(), true), // true for verification
            ),
          ],
        )),
      ]);
    }).toList();
  }

  void _showConfirmationDialog(String transactionId, bool isVerify) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(isVerify ? 'Verifikasi Transaksi' : 'Tolak Transaksi'),
          content: Text(isVerify
              ? 'Apakah Anda yakin ingin memverifikasi transaksi ini?'
              : 'Apakah Anda yakin ingin menolak transaksi ini?'),
          actions: <Widget>[
            TextButton(
              child: Text('Batal'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
            TextButton(
              child: Text(isVerify ? 'Verifikasi' : 'Tolak'),
              onPressed: () async {
                Navigator.of(context).pop(); // Close the dialog
                if (isVerify) {
                  await _unverifiedTransactionService
                      .verifyTransaction(transactionId);
                } else {
                  await _unverifiedTransactionService
                      .rejectTransaction(transactionId);
                }
                _fetchTransactions(); // Refresh the transactions list
              },
            ),
          ],
        );
      },
    );
  }
}
