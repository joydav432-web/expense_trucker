import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../app/providr/theme_moodProvider.dart';
import 'package:provider/provider.dart';

import '../app/shered/change_theme.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});
  static const String name = 'setting';

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final ImagePicker picker = ImagePicker();
  String? imagePath;

  @override
  void initState() {
    super.initState();
    loadImage();
  }

  Future<void> loadImage() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      imagePath = prefs.getString("profile_image");
    });
  }

  Future<void> saveImagePath(String path) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("profile_image", path);
  }

  Future<void> pickImage() async {
    try {
      final XFile? image = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 80,
      );

      if (image != null) {
        setState(() {
          imagePath = image.path;
        });
        await saveImagePath(image.path);
      }
    } catch (e) {
      debugPrint("Error picking image: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Failed to pick image")),
      );
    }
  }

  void showImageOptions() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.image),
                title: const Text("View Photo"),
                onTap: () {
                  Navigator.pop(context);
                  if (imagePath != null) {
                    openImage();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("No photo to view")),
                    );
                  }
                },
              ),
              ListTile(
                leading: const Icon(Icons.add_a_photo),
                title: const Text("Add Photo"),
                onTap: () {
                  Navigator.pop(context);
                  pickImage();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void openImage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(backgroundColor: Colors.transparent, iconTheme: const IconThemeData(color: Colors.white)),
          body: Center(
            child: InteractiveViewer(
              child: Image.file(File(imagePath!)),
            ),
          ),
        ),
      ),
    );
  }

  final ThemeModeProvider themeModeProvider = ThemeModeProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Settings"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 30),
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 70,
                    backgroundColor: Colors.grey.shade300,
                    backgroundImage: imagePath != null
                        ? FileImage(File(imagePath!))
                        : const AssetImage("assets/images/profile.png") as ImageProvider,
                  ),
                  GestureDetector(
                    onTap: showImageOptions,
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Theme.of(context).primaryColor,
                      child: const Icon(Icons.edit, color: Colors.white, size: 20),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              const Text(
                "Profile",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
              ),

              const SizedBox(height: 30,),


        Consumer<ThemeModeProvider>(
        builder: (context, themeProvider, child) {
        bool isDark = themeProvider.themeMode == ThemeMode.dark;

        return Container(
        height: 80,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: isDark ? Colors.grey[900] : Colors.grey[200],
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Text(
              'Theme',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isDark ? Colors.white : Colors.black,
              ),
            ),
            const SizedBox(width: 15),
            ChangeTheme(isDark: isDark),
          ],
        ),
      );
    },
    ),


            ]
        ),
      ),
    )
    );
  }
}

