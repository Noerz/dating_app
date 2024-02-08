import 'package:dating_app/app/Widget/button_sign.dart';
import 'package:dating_app/app/Widget/color_constant.dart';
import 'package:dating_app/app/modules/auth/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sign_in_button/sign_in_button.dart';

class AuthView extends StatelessWidget {
  final AuthController _googleSignInController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () {
          final currentUser = _googleSignInController.currentUser.value;
          if (currentUser != null) {
            // Pengguna sudah login, langsung arahkan ke halaman home
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Get.offAllNamed("/home");
            });
          }
          return Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 150),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/hearticon.png",
                    width: 108.64,
                    height: 100,
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Sign up to continue",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  CustomButton(
                    onPressed: () {},
                    text: "Continue with email",
                    textColor: CustomColors.white,
                    buttonColor: CustomColors.red,
                  ),
                  SizedBox(height: 10),
                  CustomButton(
                    onPressed: () {},
                    text: "Use phone number",
                    textColor: CustomColors.red,
                    buttonColor: CustomColors.white,
                  ),
                  SizedBox(height: 30),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: CustomColors.black,
                          thickness: 2,
                          indent: 10,
                          endIndent: 10,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          "or sign up with",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          color: CustomColors.black,
                          thickness: 2,
                          indent: 10,
                          endIndent: 10,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          await _googleSignInController.signInWithGoogle();
                        },
                        child: ClipOval(
                          child: Image.asset(
                            "assets/google.jpg",
                            height: 32,
                            width: 32,
                          ),
                        ),
                      ),
                      SizedBox(width: 15),
                      ElevatedButton(
                        onPressed: () async {
                          await _googleSignInController.signInWithFacebook();
                          Get.offAllNamed('/home');
                        },
                        child: ClipOval(
                          child: Image.asset(
                            "assets/facebook.png",
                            height: 32,
                            width: 32,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Terms Of Use",
                        style: TextStyle(color: CustomColors.red),
                      ),
                      Text(
                        "Privacy Policy",
                        style: TextStyle(color: CustomColors.red),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}