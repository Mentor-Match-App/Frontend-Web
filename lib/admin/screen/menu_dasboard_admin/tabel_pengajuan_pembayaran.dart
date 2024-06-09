import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_flutter_app/admin/model/unverified_transaction.dart';
import 'package:my_flutter_app/admin/service/unverified_transaction_service.dart';
import 'package:my_flutter_app/style/fontStyle.dart';
import 'package:my_flutter_app/widget/button.dart';
import 'package:my_flutter_app/widget/menucategory.dart';

class TabelVerifikasiPembayaran extends StatefulWidget {
  @override
  _TabelVerifikasiPembayaranState createState() =>
      _TabelVerifikasiPembayaranState();
}

class _TabelVerifikasiPembayaranState extends State<TabelVerifikasiPembayaran> {
  final UnverifiedTransactionService _unverifiedTransactionService =
      UnverifiedTransactionService();
  List<Transaction> _transactions = [];
  List<Transaction> _filteredTransactions = [];
  TextEditingController _searchController = TextEditingController();
  TextEditingController rejectReasonController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchTransactions();
    _searchController.addListener(_searchQuery);
  }

  void _searchQuery() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      _filteredTransactions = _transactions.where((transaction) {
        return transaction.user!.name!.toLowerCase().contains(query) ||
                transaction.transactionClass!.name!
                    .toLowerCase()
                    .contains(query) ||
                transaction.transactionClass!.educationLevel!
                    .toLowerCase()
                    .contains(query) ||
                transaction.transactionClass!.mentor!.name!
                    .toLowerCase()
                    .contains(query)

            /// sudah akhiri
            ;
      }).toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  // Fetch transactions from the service
  void _fetchTransactions() async {
    try {
      List<Transaction> transactions =
          await _unverifiedTransactionService.fetchUnverifiedTransactions();
      setState(() {
        _transactions = transactions;
        _filteredTransactions = transactions; // Initialize filtered list
      });
    } catch (e) {
      // Handle or log error
      print("Error fetching transactions: $e");
    }
  }

  void _showRejectDialog(String transactionId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: ConstrainedBox(
            constraints: BoxConstraints(minWidth: 160, minHeight: 500),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.centerRight,
                            child: IconButton(
                              icon: Icon(Icons.close),
                              onPressed: () => Navigator.of(context).pop(),
                            ),
                          ),
                          Text(
                            "Penolakan Transaksi",
                            style: FontFamily().titleText.copyWith(
                                  color: ColorStyle().secondaryColors,
                                  fontSize: 24,
                                ),
                          ),
                          Text(
                            "Silahkan isi alasan penolakan transaksi di bawah ini agar pengguna dapat mengetahui alasan transaksi ditolak.",
                            style: FontFamily().regularText.copyWith(
                                  color: ColorStyle().disableColors,
                                  fontSize: 12,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.only(left: 40.0, right: 40),
                    child: Container(
                      height: 200,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextField(
                          controller: rejectReasonController,
                          maxLines: 5, // Set number of lines to make it "large"
                          decoration: InputDecoration(
                            hintText:
                                "Isi alasan penolakan transaksi disini...",
                            hintStyle: FontFamily().regularText.copyWith(
                                  color: ColorStyle().disableColors,
                                  fontSize: 12,
                                ),
                            border: InputBorder.none, // Remove default border
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerRight,
                    child: RegularElevatedButtonWidget(
                      text: "Kirim",
                      onPressed: () async {
                        Navigator.of(context).pop(); // Close the dialog
                        await _unverifiedTransactionService.rejectTransaction(
                          transactionId,
                          rejectReasonController.text,
                        );
                        _fetchTransactions(); // Refresh transactions list
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
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
                  _showRejectDialog(transactionId);
                }
                _fetchTransactions(); // Refresh the transactions list
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Data Pembayaran Premium Class',
            style: FontFamily()
                .boldText
                .copyWith(fontSize: 20)
                .copyWith(color: ColorStyle().primaryColors),
          ),
        ),
        body: _transactions.isEmpty
            ? Center(
                child: Text('Tidak ada data transaksi yang tersedia.'),
              )
            : ListView(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Search',
                              style:
                                  FontFamily().boldText.copyWith(fontSize: 16),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            SizedBox(
                              //lebarnya mengkiuti lebarnya layar
                              width: MediaQuery.of(context).size.width * 0.9,
                              height: 60,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextField(
                                  controller: _searchController,
                                  decoration: InputDecoration(
                                    labelText:
                                        'Search by name, class, level, mentor....',
                                    prefixIcon: const Icon(Icons.search),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      _createDataTable(),
                    ],
                  )
                ],
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
    return _filteredTransactions.map((transaction) {
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
              onPressed: () {
                // Show the reject dialog
                _showRejectDialog(
                    transaction.id.toString()); // Pass the transaction ID
              },
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
}
