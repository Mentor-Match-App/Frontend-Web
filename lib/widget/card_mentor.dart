import 'package:flutter/material.dart';
import 'package:my_flutter_app/widget/button.dart';
import 'package:my_flutter_app/widget/menucategory.dart';

class CardItemMentor extends StatefulWidget {
  final String title;
  final VoidCallback onPressesd;
  final String imagePath;
  final String name;
  final String job;
  final String company;
  final Color color;
  CardItemMentor({
    Key? key,
    this.title = 'available',
    required this.onPressesd,
    required this.imagePath,
    required this.name,
    required this.job,
    required this.company,
    this.color = Colors.blue,
  }) : super(key: key);

  @override
  State<CardItemMentor> createState() => _CardItemMentorState();
}

class _CardItemMentorState extends State<CardItemMentor> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: SizedBox(
        height: 350,
        width: 250,
        child: Container(
          decoration: BoxDecoration(
            color: ColorStyle().tertiaryColors,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 16,
                    left: 26,
                    right: 26,
                    bottom: 16,
                  ),
                  child: Image.network(
                    widget.imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      widget.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: ColorStyle().secondaryColors,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(Icons.work, size: 18),
                        SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            widget.job,
                            style: TextStyle(fontSize: 12),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.home_work_outlined, size: 18),
                        SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            widget.company,
                            style: TextStyle(fontSize: 12),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Tombol hanya ditampilkan sekali di bagian bawah
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                child: SmallElevatedButtonWidget(
                  onPressed: widget.onPressesd,
                  text: 'Available',
                ),
              ),
              SizedBox(height: 8)
            ],
          ),
        ),
      ),
    );
  }
}