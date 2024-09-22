import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';
import 'package:material_text_fields/material_text_fields.dart';
import 'package:rapidresponse/authscreen/loginscreen.dart';
import 'package:rapidresponse/authscreen/wrapper.dart';

class Signupscren extends StatefulWidget {
  const Signupscren({super.key});

  @override
  State<Signupscren> createState() => _SignupscrenState();
}

class _SignupscrenState extends State<Signupscren> {
  bool showing = false;
  final namecontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  bool isloading = false;
  signup() async {
    setState(() {
      isloading = true;
    });
    try {
      final User = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailcontroller.text, password: passwordcontroller.text);
      DatabaseReference userref = FirebaseDatabase.instance
          .ref()
          .child('Users')
          .child(FirebaseAuth.instance.currentUser!.uid);
      Map userdatamap = {
        'name': namecontroller.text,
        'email': emailcontroller.text,
        'id': FirebaseAuth.instance.currentUser!.uid,
        'blockstatus': 'no'
      };
      userref.set(userdatamap).then((_) {
        Get.snackbar('Success', 'Created Account Successfully',
            backgroundColor: Colors.deepPurple.withOpacity(0.1),
            colorText: Colors.deepPurple,
            snackPosition: SnackPosition.TOP);
      });
      Get.offAll(Wrapper());
    } on FirebaseAuthException catch (e) {
      setState(() {
        isloading = false;
      });

      return Get.snackbar('Error', e.toString(),
          backgroundColor: Colors.red.withOpacity(0.1),
          colorText: Colors.red,
          snackPosition: SnackPosition.BOTTOM);
    }
    setState(() {
      isloading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // const Icon(
              //   Iconsax.cloud,
              //   size: 100,
              // ),
              SizedBox(
                height: 50,
              ),
              const Text(
                'Welcome User',
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'Please enter your details to Create Account',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
              LottieBuilder.asset('assets/animation/signin.json'),
              const SizedBox(
                height: 0,
              ),
              MaterialTextField(
                controller: namecontroller,
                keyboardType: TextInputType.name,
                hint: 'Name',
                textInputAction: TextInputAction.next,
                prefixIcon: const Icon(Iconsax.personalcard),

                // controller: _emailTextController,
                // validator: FormValidation.emailTextField,
              ),
              const SizedBox(
                height: 20,
              ),

              MaterialTextField(
                controller: emailcontroller,

                keyboardType: TextInputType.emailAddress,
                hint: 'Email',
                textInputAction: TextInputAction.next,
                prefixIcon: const Icon(Icons.email_outlined),

                // controller: _emailTextController,
                // validator: FormValidation.emailTextField,
              ),
              const SizedBox(
                height: 20,
              ),
              MaterialTextField(
                obscureText: showing ? false : true,
                controller: passwordcontroller,
                keyboardType: TextInputType.emailAddress,
                hint: 'Password',
                textInputAction: TextInputAction.next,
                prefixIcon: const Icon(Icons.password_rounded),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      showing = !showing;
                    });
                  },
                  icon: Icon(
                    showing
                        ? Icons.remove_red_eye_outlined
                        : Icons.remove_red_eye,
                  ),
                ),
              ),

              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  if (emailcontroller.text.isNotEmpty &&
                      passwordcontroller.text.isNotEmpty &&
                      namecontroller.text.isNotEmpty) {
                    signup();
                  } else {
                    Get.snackbar(
                        'Error', 'Please Fill Out All The Required Fields',
                        backgroundColor: Colors.red.withOpacity(0.1),
                        colorText: Colors.red,
                        snackPosition: SnackPosition.TOP);
                  }
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 0),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(50)),
                  alignment: Alignment.center,
                  child: isloading
                      ? CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : Text(
                          'Create Account',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                ),
              ),

              MaterialButton(
                onPressed: () {
                  Get.offAll(() => Loginscreen());
                },
                child: Text(
                  'Or Login',
                  style: TextStyle(color: Colors.blue),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
