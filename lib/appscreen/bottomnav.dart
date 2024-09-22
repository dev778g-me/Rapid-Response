import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/route_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rapidresponse/appscreen/pages/homepage.dart';
import 'package:rapidresponse/appscreen/pages/profilepage.dart';

class Bottomnav extends StatefulWidget {
  const Bottomnav({super.key});

  @override
  State<Bottomnav> createState() => _MyWidgetState();
}

sigout() async {
  await FirebaseAuth.instance.signOut();
  Get.snackbar('Success', 'Logged Out Successfully',
      backgroundColor: Colors.deepPurple.withOpacity(0.1),
      colorText: Colors.deepPurple,
      snackPosition: SnackPosition.TOP);
}

int currentindex = 0;
List pages = [Homepage(), Profilepage()];

class _MyWidgetState extends State<Bottomnav> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
          height: 70,
          //  labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          selectedIndex: currentindex,
          onDestinationSelected: (value) {
            HapticFeedback.lightImpact();
            setState(() {
              currentindex = value;
            });
          },
          destinations: const [
            NavigationDestination(
              icon: Icon(Iconsax.home),
              label: 'Home',
              selectedIcon: Icon(Iconsax.home_15),
            ),
            NavigationDestination(
              icon: Icon(Iconsax.personalcard),
              label: 'Profile',
              selectedIcon: Icon(Iconsax.personalcard5),
            )
          ]),
      body: pages[currentindex],
    );
  }
}
