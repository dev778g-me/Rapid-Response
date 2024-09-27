import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:material_text_fields/material_text_fields.dart';
import 'package:material_text_fields/theme/material_text_field_theme.dart';
import 'package:rapidresponse/appscreen/pages/numbercontact.dart';

class Sospage extends StatelessWidget {
  const Sospage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SOS Services'),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              MaterialTextField(
                keyboardType: TextInputType.name,
                hint: 'Search',
                textInputAction: TextInputAction.next,
                prefixIcon: const Icon(Iconsax.search_normal),

                //suffixIcon: const Image.asset('assets/images/ic_lock.png'),

                style: const TextStyle(fontSize: 16, color: Colors.black),

                theme: FilledOrOutlinedTextTheme(
                  radius: 16,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  errorStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w700),
                  fillColor: Colors.deepPurple.shade50,
                  suffixIconColor: Colors.green,
                  prefixIconColor: Colors.red,
                ), //you can use theme param to differ this text field from app level theming
              ),
              const SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: ClipRRect(
                        child: Container(
                          height: 280,
                          width: 260,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(20)),
                          child: const Row(
                            children: [
                              Expanded(
                                  child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      'Ambulance Service',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'Local Ambulance Number',
                                      style: TextStyle(
                                          color: Colors.white54,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Spacer(),
                                    CircleAvatar(
                                      backgroundColor: Colors.red,
                                      child: Icon(Iconsax.book),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    )
                                  ],
                                ),
                              )),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                      height: 280,
                      width: 260,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(20)),
                      child: const Row(
                        children: [
                          Expanded(
                              child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  'Firestation',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Local Firestation Number',
                                  style: TextStyle(
                                      color: Colors.white54,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                                Spacer(),
                                CircleAvatar(
                                  backgroundColor: Colors.red,
                                  child: Icon(Iconsax.health),
                                ),
                                SizedBox(
                                  height: 15,
                                )
                              ],
                            ),
                          )),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Numbercontact()));
                      },
                      child: Container(
                        height: 280,
                        width: 260,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(20)),
                        child: const Row(
                          children: [
                            Expanded(
                                child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    'Local Volunteer',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Local Volunteer Number',
                                    style: TextStyle(
                                        color: Colors.white54,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Spacer(),
                                  CircleAvatar(
                                    backgroundColor: Colors.red,
                                    child: Icon(Iconsax.bookmark_2),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  )
                                ],
                              ),
                            )),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                      height: 280,
                      width: 260,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(20)),
                      child: const Row(
                        children: [
                          Expanded(
                              child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  'First Aid Emergency',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'First aid',
                                  style: TextStyle(
                                      color: Colors.white54,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                                Spacer(),
                                CircleAvatar(
                                  backgroundColor: Colors.red,
                                  child: Icon(Iconsax.hospital),
                                ),
                                SizedBox(
                                  height: 15,
                                )
                              ],
                            ),
                          )),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      )),
    );
  }
}
