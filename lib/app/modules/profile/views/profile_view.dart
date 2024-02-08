import 'package:dating_app/app/Widget/button_sign.dart';
import 'package:dating_app/app/modules/auth/controllers/auth_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  final AuthController _googleSignInController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        final currentUser = _googleSignInController.currentUser.value;
        if (currentUser != null) {
          return Scaffold(
            appBar: AppBar(
              title: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Profile Details",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                ),
              ),
            ),
            body: Column(
              children: [
                SizedBox(height: 91),
                Container(
                  width: 101,
                  height: 106,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(36),
                    image: DecorationImage(
                      image: NetworkImage("${currentUser?.photoURL}"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(height: 37),
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Text(
                        "Name:",
                        style: TextStyle(fontSize: 24),
                      ),
                      Text(
                        "${currentUser?.displayName}",
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Email:",
                        style: TextStyle(fontSize: 24),
                      ),
                      Text(
                        "${currentUser?.email}",
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        height: 150,
                      ),
                      CustomButton(
                        onPressed: () async {
                          _googleSignInController.signOut();
                          await Get.offAllNamed('/auth');
                        },
                        text: "Keluar",
                        textColor: Color(0xffFFFFFF),
                        buttonColor: Color(0xffE94057),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
