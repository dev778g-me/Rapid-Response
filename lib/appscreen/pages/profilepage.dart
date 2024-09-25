import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class Profilepage extends StatefulWidget {
  const Profilepage({super.key});

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  final user = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
                child: IconButton(
                    onPressed: () {}, icon: const Icon(Icons.person))),
          )
        ],
      ),
      body: Column(
        children: [
          UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://imgs.search.brave.com/iJ9140zE-mRuqxVHJ8gwXF-3r5s5PgryDGqrK8CmP8w/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly93YWxs/cGFwZXJjYXZlLmNv/bS93cC93cDExMzA1/MjMwLmpwZw'),
              ),
              decoration: BoxDecoration(color: Colors.deepPurple),
              accountName: Text('data'),
              accountEmail: Text(user.currentUser!.email.toString())),
          ListTile(
            leading: Icon(Iconsax.location),
            title: Text('Location'),
          ),
          ListTile(
            leading: Icon(Iconsax.setting),
            title: Text('Settings'),
          ),
          ListTile(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Log Out '),
                  content: Text('Are you sure you want to Log Out?'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      child: Text(
                        'No',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        FirebaseAuth.instance.signOut();
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Yes',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                ),
              );
            },
            leading: Icon(Iconsax.logout),
            title: Text('Log Out'),
          )
        ],
      ),
    );
  }
}
