import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:material_text_fields/material_text_fields.dart';
import 'package:material_text_fields/utils/form_validation.dart';
import 'package:rapidresponse/authscreen/signupscren.dart';
import 'package:rapidresponse/authscreen/wrapper.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  bool showing = false;
  bool isloading = false;
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  signin() async {
    setState(() {
      isloading = true;
    });
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailcontroller.text, password: passwordcontroller.text);
      Get.snackbar('Success', 'Logged in Successfully',
          backgroundColor: Colors.deepPurple.withOpacity(0.1),
          colorText: Colors.deepPurple,
          snackPosition: SnackPosition.TOP);
      Get.offAll(const Wrapper());
    } on FirebaseAuthException catch (e) {
      setState(() {
        isloading = false;
      });
      return Get.snackbar('Error', e.toString(),
          backgroundColor: Colors.red.withOpacity(0.1),
          colorText: Colors.red,
          snackPosition: SnackPosition.TOP,
          snackStyle: SnackStyle.FLOATING,
          shouldIconPulse: false);
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
              const SizedBox(
                height: 50,
              ),
              const Text(
                'Welcome Back',
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'Please enter your details to sign in',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
              LottieBuilder.asset('assets/animation/signin.json'),
              const SizedBox(
                height: 40,
              ),

              MaterialTextField(
                controller: emailcontroller,
                style: const TextStyle(),
                keyboardType: TextInputType.emailAddress,
                hint: 'Email',
                textInputAction: TextInputAction.next,
                prefixIcon: const Icon(Icons.email_outlined),

                // controller: _emailTextController,
                validator: FormValidation.emailTextField,
              ),

              const SizedBox(
                height: 20,
              ),
              MaterialTextField(
                obscureText: showing ? false : true,
                controller: passwordcontroller,
                style: const TextStyle(),
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
                    icon: showing
                        ? const Icon(Icons.remove_red_eye_outlined)
                        : const Icon(Icons.remove_red_eye)),

                // controller: _emailTextController,
                // validator: FormValidation.emailTextField,
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  if (emailcontroller.text.isNotEmpty &&
                      passwordcontroller.text.isNotEmpty) {
                    signin();
                  } else {
                    Get.snackbar(
                        'Error', 'Please Fill Out All The Required Fields',
                        backgroundColor: Colors.red.withOpacity(0.1),
                        colorText: Colors.red,
                        snackPosition: SnackPosition.TOP);
                  }
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(50)),
                  alignment: Alignment.center,
                  child: isloading
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : const Text(
                          'Log In',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Dont Have Account ?',
                    style: TextStyle(),
                  ),
                  MaterialButton(
                    onPressed: () {
                      Get.offAll(() => const Signupscren());
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) {
                      //   return const Signupscreen();
                      // }));
                    },
                    child: const Text(
                      'Create Account',
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
