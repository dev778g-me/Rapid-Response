import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart'; // For Clipboard functionality

class Numbercontact extends StatefulWidget {
  const Numbercontact({super.key});

  @override
  State<Numbercontact> createState() => _NumbercontactState();
}

class _NumbercontactState extends State<Numbercontact> {
  final _db1 = FirebaseDatabase.instance.ref(); // Firebase database reference

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
      ),
      body: StreamBuilder(
        stream: _db1.child('Volunteer').onValue, // Use the correct stream
        builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
          if (snapshot.hasData) {
            Map<dynamic, dynamic>? volunteers =
                snapshot.data?.snapshot.value as Map<dynamic, dynamic>?;

            if (volunteers == null) {
              return const Center(child: Text('No Volunteers available'));
            }

            // Convert the Map into a list to display in a ListView
            List volunteerList = volunteers.entries.toList();

            return ListView.builder(
              itemCount: volunteerList.length,
              itemBuilder: (context, index) {
                var volunteer = volunteerList[index].value;
                String contactNumber = volunteer['phonenumber'] ?? 'No Contact';

                return ListTile(
                  title: Row(
                    children: [
                      Text(volunteer['name'] ?? 'No Name'),
                      SizedBox(
                        width: 20,
                      ),
                      Text('(${volunteer['profession']})' ?? 'No Name'),
                    ],
                  ),
                  subtitle: Text(contactNumber),
                  trailing: IconButton(
                    icon: const Icon(
                      Iconsax.copy,
                      size: 20,
                    ),
                    onPressed: () {
                      Clipboard.setData(ClipboardData(text: contactNumber));
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Phone number copied: $contactNumber'),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error loading data'));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
