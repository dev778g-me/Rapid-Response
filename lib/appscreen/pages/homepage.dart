import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:get/route_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:material_text_fields/material_text_fields.dart';
import 'package:material_text_fields/theme/material_text_field_theme.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  sigout() async {
    await FirebaseAuth.instance.signOut();
    Get.snackbar('Success', 'Logged Out Successfully',
        backgroundColor: Colors.deepPurple.withOpacity(0.1),
        colorText: Colors.deepPurple,
        snackPosition: SnackPosition.TOP);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.red,
            focusColor: Colors.red,
            hoverColor: Colors.red,
            onPressed: () {
              sigout();
            },
            child: Icon(Icons.emergency)),
        appBar: AppBar(
          title: const Text('Rapid Response'),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                  child: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.person))),
            )
          ],
        ),
        body: Center(
          child: Text('data'),
        ));
  }
}
