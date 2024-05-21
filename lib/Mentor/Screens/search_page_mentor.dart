import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_app/mentee/screen/premium_class/detail_class_mentor_all_screen.dart';
import 'package:my_flutter_app/mentor/Screens/my_class_mentor/detail_my_class_mentor_screen.dart';
import 'package:my_flutter_app/mentor/Screens/my_class_mentor/edit_class_rejected.dart';
import 'package:my_flutter_app/mentor/service/myClassCreate_Mentor_service.dart';
import 'package:my_flutter_app/preferences/%20preferences_helper.dart';
import 'package:my_flutter_app/style/baseURl.dart';
import 'package:my_flutter_app/widget/menucategory.dart';

import '../model/my_class_mentor_model.dart';

class SearchPageMentorweb extends StatefulWidget {
  @override
  _SearchPageMentorwebState createState() => _SearchPageMentorwebState();
}

class _SearchPageMentorwebState extends State<SearchPageMentorweb> {
  final TextEditingController _searchController = TextEditingController();
  final Dio _dio = Dio();
  bool isSearching = false;

  List<AllClass> _classes = [];
  List<AllClass> _filteredClasses = [];

  ////////////////////////
  late Future<MyClassMentorMondel> classData;
  int _getPriority(AllClass userClass) {
    DateTime now = DateTime.now();
    DateTime startDate = DateTime.parse(
        userClass.startDate.toString()); // Asumsi startDate tidak null
    DateTime endDate = DateTime.parse(
        userClass.endDate.toString()); // Asumsi endDate tidak null

    int getAvailableSlotCount(AllClass userClass) {
      int approvedCount = userClass.transactions
              ?.where((t) => t.paymentStatus == "Approved")
              .length ??
          0;
      int pendingCount = userClass.transactions
              ?.where((t) => t.paymentStatus == "Pending")
              .length ??
          0;
      int totalApprovedAndPendingCount = approvedCount + pendingCount;
      return totalApprovedAndPendingCount;
    }

    int totalApprovedAndPendingCount = getAvailableSlotCount(userClass);

    bool isVerified = userClass.isVerified!;
    bool isActive = userClass.isActive!;
    bool isAvailable = userClass.isAvailable!;
    int maxParticipants = userClass.maxParticipants!;
    Color buttonColor = ColorStyle().primaryColors;
    String buttonText = "Available";
    bool isRejected = userClass.rejectReason != null;

    // Tentukan warna tombol dan teks berdasarkan kondisi status kelas

    if (isAvailable && totalApprovedAndPendingCount < maxParticipants) {
      buttonColor = ColorStyle().secondaryColors;
      buttonText = "Available";
    } else if (!isAvailable && !isVerified && !isActive && isRejected) {
      // Kondisi untuk "Rejected"
      buttonColor = ColorStyle().errorColors; // Warna untuk status "Rejected"
      buttonText = "Rejected";
      //kondisi pending
    } else if (!isAvailable &&
        !isVerified &&
        !isActive &&
        now.isBefore(startDate)) {
      buttonColor = ColorStyle().pendingColors;
      buttonText = "Pending";
    } else if (totalApprovedAndPendingCount >= maxParticipants && !isActive) {
      buttonColor = ColorStyle().fullbookedColors;
      buttonText = "Full";
      // ketika startDate = now , dan now <+ endDate
    } else if (isActive) {
      buttonColor = ColorStyle().succesColors;
      buttonText = "Active";
    } else if (totalApprovedAndPendingCount > 0 && now.isAfter(endDate)) {
      buttonColor = ColorStyle().disableColors;
      buttonText = "Completed";
    } else if (totalApprovedAndPendingCount == 0 && now.isAfter(startDate)) {
      buttonColor = ColorStyle().blackColors;
      buttonText = "Expired";
    } else {
      // Penanganan default jika ada, untuk kasus yang tidak tertangani oleh kondisi di atas
      buttonColor = ColorStyle().primaryColors; // Asumsi warna default
      buttonText = "Unavailable"; // Teks default
    }
    // Kembalikan prioritas yang dihitung
    return _calculatePriority(buttonText);
  }

  int _calculatePriority(String buttonText) {
    // Lakukan perhitungan prioritas berdasarkan teks tombol
    switch (buttonText) {
      case "Rejected":
        return 1;
      case "Pending":
        return 2;
      case "Full":
        return 3;
      case "Active":
        return 4;
      case "Completed":
        return 5;
      case "Expired":
        return 6;
      case "Unavailable":
        return 7;
      default:
        return 8;
    }
  }

  Widget createStatusButton(String title, Color color) {
    return Align(
      alignment: Alignment.centerRight,
      child: SmallElevatedButtonTag(
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
  void initState() {
    super.initState();
    _fetchClasses();

    ///
    super.initState();
    // Initialize the future without passing userId
    classData = ListClassMentor().fetchClassData();

    /// mebuat sort sesuai dengan prioritas status
    classData.then((value) {
      value.user?.userClass?.sort((a, b) {
        return _getPriority(a).compareTo(_getPriority(b));
      });
    });
  }

  Future<void> _fetchClasses() async {
    try {
      final userId = UserPreferences.getUserId();
      final response = await _dio.get('$baseUrl/users/$userId/my-class');
      if (response.statusCode == 200) {
        final model = MyClassMentorMondel.fromMap(response.data);
        if (model.user != null && model.user!.userClass != null) {
          setState(() {
            _classes = model.user!.userClass!;
            _filteredClasses = _classes;
          });
        } else {
          throw Exception("Class data not found");
        }
      } else {
        throw Exception("Failed to load classes");
      }
    } catch (e) {
      print(e); // Handle error accordingly
    }
  }

  void _filterClasses(String query) {
    setState(() {
      isSearching = query.isNotEmpty;
      _filteredClasses = _classes
          .where((cls) =>
              cls.name!.toLowerCase().contains(query.toLowerCase()) ||
              cls.description!.toLowerCase().contains(query.toLowerCase()) ||
              cls.name!.toLowerCase().contains(query.toLowerCase()) ||
              cls.transactions!.any((transaction) => transaction.user!.name!
                  .toLowerCase()
                  .contains(query.toLowerCase())))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search',
          style: FontFamily().regularText.copyWith(
                color: ColorStyle().primaryColors,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            const SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: _filteredClasses.length,
                itemBuilder: (context, index) {
                  var approvedTransactions = _filteredClasses[index]
                          .transactions
                          ?.where((transaction) =>
                              transaction.paymentStatus == "Approved")
                          .toList() ??
                      [];

                  if (approvedTransactions.isEmpty) {
                    return Container(); // Return an empty container if no transactions match
                  }
                  int statusButton = _getPriority(_filteredClasses[index]);
                  String menteeNames = approvedTransactions
                      .map((transaction) => transaction.user!.name as String)
                      .join(', ');
                  final cls = _filteredClasses[index];
                  return Padding(
                      padding: const EdgeInsets.only(
                          bottom: 8.0, left: 8.0, right: 8.0),
                      child: isSearching
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Hasil pencarian",
                                  style: FontFamily().regularText,
                                ),
                                const SizedBox(height: 12),
                                Container(
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 12),
                                        if (statusButton == 1)
                                          createStatusButton("Rejected",
                                              ColorStyle().errorColors),
                                        if (statusButton == 2)
                                          createStatusButton("Pending",
                                              ColorStyle().pendingColors),
                                        if (statusButton == 3)
                                          createStatusButton("Full",
                                              ColorStyle().fullbookedColors),
                                        if (statusButton == 4)
                                          createStatusButton("Active",
                                              ColorStyle().succesColors),
                                        if (statusButton == 5)
                                          createStatusButton("Completed",
                                              ColorStyle().disableColors),
                                        if (statusButton == 6)
                                          createStatusButton("Expired",
                                              ColorStyle().blackColors),
                                        if (statusButton == 7)
                                          createStatusButton("Unavailable",
                                              ColorStyle().primaryColors),
                                        if (statusButton == 8)
                                          createStatusButton("Available",
                                              ColorStyle().secondaryColors),
                                        SizedBox(height: 12),
                                        Text(
                                            //nama kelas
                                            cls.name ?? '',
                                            style:
                                                FontFamily().titleText.copyWith(
                                                      color: ColorStyle()
                                                          .secondaryColors,
                                                    )),
                                        SizedBox(height: 12),
                                        Text(
                                          'Jumlah mentee terdaftar : ${approvedTransactions.length}',
                                          style: FontFamily().regularText,
                                        ),

                                        const SizedBox(height: 12),
                                        Text(
                                          //durationIndays
                                          'Durasi kelas : ${cls.durationInDays} hari',
                                          style: FontFamily().regularText,
                                        ),
                                        // buat align text button di kanan menuju DetailMyclass namun aoabila statusnya rejected maka ke editrejectedClaas
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: TextButton(
                                            onPressed: () {
                                              if (statusButton == 1) {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        EditRejectedClass(
                                                      classData: cls,
                                                    ),
                                                  ),
                                                );
                                              } else {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        DetailMyClassMentorScreen(
                                                      feedbacks:
                                                          cls.feedbacks ?? [],
                                                      addressMentoring:
                                                          cls.address ??
                                                              'Meeting Zoom',
                                                      locationMentoring:
                                                          cls.location ?? '',
                                                      approvedTransactionsCount:
                                                          approvedTransactions
                                                              .length,
                                                      transactions:
                                                          cls.transactions ??
                                                              [],
                                                      evaluation:
                                                          cls.evaluations ?? [],
                                                      learningMaterial:
                                                          cls.learningMaterial ??
                                                              [],
                                                      userClass: cls,
                                                      aksesLinkZoom:
                                                          cls.zoomLink ?? '',
                                                      deskripsiKelas: cls
                                                          .description
                                                          .toString(),
                                                      classid:
                                                          cls.id.toString(),
                                                      durationInDays:
                                                          cls.durationInDays ??
                                                              0,
                                                      endDate: DateTime.parse(
                                                          cls.endDate ?? ''),
                                                      startDate: DateTime.parse(
                                                          cls.startDate ?? ''),
                                                      term: cls.terms ?? [],
                                                      maxParticipants:
                                                          cls.maxParticipants ??
                                                              0,
                                                      schedule:
                                                          cls.schedule ?? '',
                                                      targetLearning:
                                                          cls.targetLearning ??
                                                              [],
                                                      linkZoom:
                                                          cls.zoomLink ?? '',
                                                      namaKelas: cls.name ?? '',
                                                    ),
                                                  ),
                                                );
                                              }
                                            },
                                            child: Text(
                                              'Lihat Kelas',
                                              style: FontFamily()
                                                  .buttonText
                                                  .copyWith(
                                                    color: ColorStyle()
                                                        .secondaryColors,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            )
                          : Container());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
