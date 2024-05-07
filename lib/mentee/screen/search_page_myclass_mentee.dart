import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_app/mentee/model/my_class_model.dart';
import 'package:my_flutter_app/mentee/screen/premium_class/detail_class_mentor_all_screen.dart';
import 'package:my_flutter_app/mentee/screen/sidebar/my_class/detail_my_class_mentee_screen.dart';
import 'package:my_flutter_app/mentee/service/my_class_service.dart';
import 'package:my_flutter_app/widget/menucategory.dart';

class SearchPageMenteeWeb extends StatefulWidget {
  @override
  _SearchPageMenteeWebState createState() => _SearchPageMenteeWebState();
}

class _SearchPageMenteeWebState extends State<SearchPageMenteeWeb> {
  final TextEditingController _searchController = TextEditingController();
  final Dio _dio = Dio();
  bool isSearching = false;

  List<ClassMyClass> _classes = [];
  List<ClassMyClass> _filteredClasses = [];

  Future<void> _fetchClasses() async {
    try {
      final List<TransactionMyClass> transactions =
          await BookingService().fetchUserTransactions();

      // Buat list class dari transaksi yang diperoleh
      List<ClassMyClass> classes = transactions
          .map((transaction) => transaction.transactionClass!)
          .toList();

      setState(() {
        _classes = classes;
        _filteredClasses = _classes;
      });
    } catch (e) {
      print(e); // Tangani kesalahan sesuai kebutuhan aplikasi Anda
    }
  }

  void _filterClasses(String query) {
    setState(() {
      isSearching = query.isNotEmpty;
      _filteredClasses = _classes
          .where((cls) =>
              cls.name!.toLowerCase().contains(query.toLowerCase()) ||
              cls.description!.toLowerCase().contains(query.toLowerCase()) ||
              cls.mentor!.name!.toLowerCase().contains(query.toLowerCase()) ||
              cls.durationInDays.toString().contains(query.toLowerCase()))
          .toList();
    });
  }

  /////
  Future<List<TransactionMyClass>>? _userData;
  int getClassStatusPriority(TransactionMyClass transaction) {
    // Gunakan logika yang sama untuk menentukan status
    DateTime now = DateTime.now();
    DateTime startDate =
        DateTime.parse(transaction.transactionClass?.startDate ?? '');
    DateTime endDate =
        DateTime.parse(transaction.transactionClass?.endDate ?? '');
    bool isClassActive = now.isAfter(startDate) && now.isBefore(endDate);
    bool isClassScheduled =
        now.isBefore(startDate) && transaction.paymentStatus == "Approved";
    bool isClassFinished = now.isAfter(endDate);

    if (isClassActive) {
      return 1;
    } else if (isClassScheduled) {
      return 2;
    } else if (transaction.paymentStatus == "Pending") {
      return 3;
    } else if (isClassFinished) {
      return 4;
    } else if (transaction.paymentStatus == "Expired") {
      return 5;
    }

    return 6; // Untuk status lain atau tidak diketahui
  }

  @override
  void initState() {
    super.initState();
    _fetchClasses();
    ////
    _userData = BookingService().fetchUserTransactions();
  }

  Widget createStatusButton(String title, Color color) {
    return Align(
      alignment: Alignment.centerRight,
      child: SmallElevatedButton(
        color: color,
        onPressed: () {}, // Define the action
        height: 28,
        width: 124,
        title: title,
        style: FontFamily().buttonText,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Class'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  border: Border.all(color: ColorStyle().tertiaryColors),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextField(
                    obscureText: false,
                    controller: _searchController,
                    onChanged: _filterClasses,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search by mentee name or class name',
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: FutureBuilder<List<TransactionMyClass>>(
                future: _userData,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(
                        child:
                            Container() // Menampilkan pesan jika tidak ada data yang tersedia
                        );
                  } else {
                    List<TransactionMyClass> transactions = snapshot
                        .data!; // Mendapatkan data transaksi dari snapshot
                    transactions.sort((a, b) => getClassStatusPriority(a)
                        .compareTo(getClassStatusPriority(b)));
                    return ListView.builder(
                      itemCount: transactions.length,
                      itemBuilder: (context, index) {
                        int statusButton =
                            getClassStatusPriority(transactions[index]);
                        final clasdata = transactions[index].transactionClass;
                        return Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: isSearching
                                ? Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: ColorStyle().tertiaryColors,
                                        width: 2,
                                      ),
                                      color: Colors.transparent,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Column(
                                        children: [
                                          if (statusButton == 1)
                                            createStatusButton("Active",
                                                ColorStyle().succesColors)
                                          else if (statusButton == 2)
                                            createStatusButton("Scheduled",
                                                ColorStyle().secondaryColors)
                                          else if (statusButton == 3)
                                            createStatusButton("Pending",
                                                ColorStyle().pendingColors)
                                          else if (statusButton == 4)
                                            createStatusButton("Finished",
                                                ColorStyle().disableColors)
                                          else if (statusButton == 5)
                                            createStatusButton("Expired",
                                                ColorStyle().errorColors),
                                          SizedBox(height: 10),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              ClipOval(
                                                child: Image.network(
                                                  clasdata!.mentor!.photoUrl ??
                                                      '',
                                                  fit: BoxFit.cover,
                                                  width: 98,
                                                  height: 98,
                                                ),
                                              ),
                                              const SizedBox(width: 10),
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      clasdata.name ?? '',
                                                      style: FontFamily()
                                                          .boldText
                                                          .copyWith(
                                                              fontSize: 14,
                                                              color: ColorStyle()
                                                                  .primaryColors),
                                                    ),
                                                    const SizedBox(height: 12),
                                                    Text(
                                                        'Mentor : ${clasdata.mentor!.name}',
                                                        style: FontFamily()
                                                            .regularText),
                                                    Text(
                                                        'Durasi : ${clasdata.durationInDays} Hari',
                                                        style: FontFamily()
                                                            .regularText),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 8),
                                          Align(
                                            alignment: Alignment.centerRight,
                                            child: TextButton(
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        DetailMyClassMenteeScreen(
                                                      learningMaterial: clasdata
                                                              .learningMaterial ??
                                                          [],
                                                      endDate: DateTime.parse(
                                                          clasdata.endDate ??
                                                              ''),
                                                      startDate: DateTime.parse(
                                                          clasdata.startDate ??
                                                              ''),
                                                      targetLearning: clasdata
                                                              .targetLearning ??
                                                          [],
                                                      maxParticipants: clasdata
                                                              .maxParticipants ??
                                                          0,
                                                      schedule:
                                                          clasdata.schedule ??
                                                              '',
                                                      mentorId:
                                                          clasdata.mentorId ??
                                                              '',
                                                      mentorPhoto: clasdata
                                                              .mentor!
                                                              .photoUrl ??
                                                          '',
                                                      descriptionKelas: clasdata
                                                          .description
                                                          .toString(),
                                                      terms:
                                                          clasdata.terms ?? [],
                                                      evaluasi: clasdata
                                                              .evaluations ??
                                                          [],
                                                      linkEvaluasi:
                                                          clasdata.zoomLink ??
                                                              '',
                                                      mentorName: clasdata
                                                              .mentor!.name ??
                                                          '',
                                                      linkZoom:
                                                          clasdata.zoomLink ??
                                                              '',
                                                      namaKelas:
                                                          clasdata.name ?? '',
                                                      periode: clasdata
                                                              .durationInDays ??
                                                          0,
                                                      classData: clasdata,
                                                    ),
                                                  ),
                                                );
                                              },
                                              child: Text(
                                                'Lihat Kelas',
                                                style: FontFamily()
                                                    .boldText
                                                    .copyWith(
                                                        color: ColorStyle()
                                                            .secondaryColors,
                                                        fontSize: 16),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                : Container());
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
