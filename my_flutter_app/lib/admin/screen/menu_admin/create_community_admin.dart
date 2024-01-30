import 'package:flutter/material.dart';
import 'package:my_flutter_app/style/colorStyle.dart';
import 'package:my_flutter_app/style/fontStyle.dart';
import 'package:my_flutter_app/style/tittle_text.dart';
import 'package:my_flutter_app/widget/button_widget.dart';
import 'package:my_flutter_app/widget/text_field_widget.dart';

class CreateNewCommunityScreen extends StatefulWidget {
  CreateNewCommunityScreen({Key? key}) : super(key: key);

  @override
  State<CreateNewCommunityScreen> createState() =>
      _CreateNewCommunityScreenState();
}

class _CreateNewCommunityScreenState extends State<CreateNewCommunityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Create New Community',
          style: FontFamily().titleText.copyWith(
                color: ColorStyle().primaryColors,
                fontSize: 24,
              ),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TittleTextField(
                  title: 'New Community Name',
                  color: ColorStyle().secondaryColors,
                  textAlign: TextAlign.start,
                ),
                TextFieldWidget(
                  hintText: "Link Community",
                ),
                TittleTextField(
                  title: 'input link Community',
                  color: ColorStyle().secondaryColors,
                  textAlign: TextAlign.start,
                ),
                TextFieldWidget(
                  hintText: "Community Name",
                ),
                TittleTextField(
                  title: 'Community Image',
                  color: ColorStyle().secondaryColors,
                  textAlign: TextAlign.start,
                ),
                TextFieldWidget(
                  hintText: "Upluod",
                ),
                const SizedBox(height: 40),
                Align(
                  alignment: Alignment.centerRight,
                  child: RegularElevatedButtonWidget(
                    text: "Create",
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
