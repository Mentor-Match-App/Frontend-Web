import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SkillForm extends StatefulWidget {
  @override
  _SkillFormState createState() => _SkillFormState();
}

class _SkillFormState extends State<SkillForm> {
  TextEditingController _skillController = TextEditingController();
  List<String> skills = [];
  String newSkill = '';

  @override
  Widget build(BuildContext context) {
    return _buildSkillForm("Skill", "Add your skill");
  }

  Widget _buildSkillForm(String title, String subtitle) {
    Color filledColor = Color.fromRGBO(249, 240, 241, 1.0);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.normal,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  child: TextField(
                    onChanged: (value) {
                      newSkill = value;
                    },
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          if (newSkill.isNotEmpty) {
                            setState(() {
                              skills.add(newSkill);
                              newSkill = '';
                              _skillController.clear();
                            });
                          }
                        },
                      ),
                      hintText: subtitle,
                      fillColor: filledColor,
                      filled: true,
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 20.0,
                        horizontal: 12.0,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    controller: _skillController,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          _buildSkillChips(),
        ],
      ),
    );
  }

  Widget _buildSkillChips() {
    return Wrap(
      spacing: 16.0,
      runSpacing: 8.0,
      children: skills.map((skill) => _buildSkillChip(skill)).toList(),
    );
  }

  Widget _buildSkillChip(String skill) {
    Color chipColor = Colors.orange;
    Color deleteButtonColor = Colors.white;

    return Chip(
      labelPadding: EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 6.0,
      ),
      label: Text(
        skill,
        style: GoogleFonts.poppins(
          color: Colors.white,
          fontSize: 17.0,
        ),
      ),
      backgroundColor: chipColor,
      deleteIconColor: deleteButtonColor,
      onDeleted: () {
        setState(() {
          skills.remove(skill);
        });
      },
    );
  }
}
