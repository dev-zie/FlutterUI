import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uiwidgets/UI/pickers/data/entity/user_draft.dart';

class ProfilePreviewPage extends StatefulWidget {
  const ProfilePreviewPage({super.key});

  @override
  State<ProfilePreviewPage> createState() => _ProfilePreviewPageState();
}

class _ProfilePreviewPageState extends State<ProfilePreviewPage> {
  final UserDraft draft = UserDraft();

  int calculatedAge(DateTime birthDate) {
    final today = DateTime.now();
    int age = today.year - birthDate.year;

    if (today.month < birthDate.month) {
      age--;
    }
    return age;
  }

  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage() async {
    final XFile? picked = await _picker.pickImage(source: ImageSource.gallery);

    if (picked != null) {
      setState(() {
        draft.imagePath = picked.path;
      });
    }
  }

  Future<void> pickBirthDate() async {
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (selectedDate != null) {
      setState(() {
        draft.birthDate = selectedDate;
      });
    }
  }

  final List<String> fonts = ['Roboto', 'Lobster', 'Montserrat'];

  void pickBackgroundColor() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Pick Background Color'),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: draft.backgroundColor ?? Colors.white,
              onColorChanged: (color) {
                setState(() {
                  draft.backgroundColor = color;
                });
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Done'),
            ),
          ],
        );
      },
    );
  }

  Color getTextColorFromPicker(Color bgColor) {
    final double luminance = bgColor.computeLuminance();
    if (luminance < 0.4) {
      return Colors.white;
    } else {
      return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: draft.backgroundColor ?? Colors.white,
      appBar: AppBar(
        backgroundColor: draft.backgroundColor ?? Colors.white,
        title: Text(
          'Profile',
          style: draft.fontFamily != null
              ? GoogleFonts.getFont(
                  draft.fontFamily!,
                  fontSize: 24,
                  color: getTextColorFromPicker(
                    draft.backgroundColor ?? Colors.white,
                  ),
                )
              : TextStyle(
                  fontSize: 24,
                  color: getTextColorFromPicker(
                    draft.backgroundColor ?? Colors.white,
                  ),
                ),
        ),
        actions: [
          IconButton(
            onPressed: pickBackgroundColor,
            icon: Icon(
              Icons.format_paint_rounded,
              color: getTextColorFromPicker(
                draft.backgroundColor ?? Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: draft.imagePath != null
                  ? FileImage(File(draft.imagePath!))
                  : null,
              child: draft.imagePath == null
                  ? const Icon(Icons.person, size: 60)
                  : null,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: pickImage,
              child: Text(
                'Select Profile Photo',
                style: draft.fontFamily != null
                    ? GoogleFonts.getFont(draft.fontFamily!, fontSize: 24)
                    : const TextStyle(fontSize: 24),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'User',
              style: draft.fontFamily != null
                  ? GoogleFonts.getFont(
                      draft.fontFamily!,
                      fontSize: 24,
                      color: getTextColorFromPicker(
                        draft.backgroundColor ?? Colors.white,
                      ),
                    )
                  : TextStyle(
                      fontSize: 24,
                      color: getTextColorFromPicker(
                        draft.backgroundColor ?? Colors.white,
                      ),
                    ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  draft.birthDate != null
                      ? '${calculatedAge(draft.birthDate!)} years old'
                      : 'Age not selected',
                  style: draft.fontFamily != null
                      ? GoogleFonts.getFont(
                          draft.fontFamily!,
                          fontSize: 24,
                          color: getTextColorFromPicker(
                            draft.backgroundColor ?? Colors.white,
                          ),
                        )
                      : TextStyle(
                          fontSize: 24,
                          color: getTextColorFromPicker(
                            draft.backgroundColor ?? Colors.white,
                          ),
                        ),
                ),
                const SizedBox(width: 10),
                IconButton(onPressed: pickBirthDate, icon: Icon(Icons.cake)),
              ],
            ),

            const SizedBox(height: 20),
            DropdownButton<String>(
              hint: Text(
                'Select Font',
                style: draft.fontFamily != null
                    ? GoogleFonts.getFont(
                        draft.fontFamily!,
                        fontSize: 24,
                        color: getTextColorFromPicker(
                          draft.backgroundColor ?? Colors.white,
                        ),
                      )
                    : TextStyle(
                        fontSize: 24,
                        color: getTextColorFromPicker(
                          draft.backgroundColor ?? Colors.white,
                        ),
                      ),
              ),
              value: draft.fontFamily,
              items: fonts.map((font) {
                return DropdownMenuItem(
                  value: font,
                  child: Text(
                    font,
                    style: draft.fontFamily != null
                        ? GoogleFonts.getFont(
                            draft.fontFamily!,
                            fontSize: 24,
                            color: getTextColorFromPicker(
                              draft.backgroundColor ?? Colors.white,
                            ),
                          )
                        : TextStyle(
                            fontSize: 24,
                            color: getTextColorFromPicker(
                              draft.backgroundColor ?? Colors.white,
                            ),
                          ),
                  ),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  draft.fontFamily = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
