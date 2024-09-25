// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';

// import 'package:rapidresponse/authscreen/wrapper.dart';

// class Spalshscreen extends StatefulWidget {
//   const Spalshscreen({super.key});

//   @override
//   State<Spalshscreen> createState() => _SpalshscreenState();
// }

// class _SpalshscreenState extends State<Spalshscreen> {
//   @override
//   @override
//   void initState() {
//     super.initState();
//     Timer(Duration(seconds: 2), () {
//       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
//         return Wrapper();
//       }));
//     });
//   }

//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         color: Colors.white,
//         child: Center(
//           child: LottieBuilder.asset(
//             'assets/animation/s2.json',
//             height: double.infinity,
//           ),
//         ),
//       ),
//     );
//   }
// }
