import 'package:dating_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';

import '../controllers/spalsh_controller.dart';

class SpalshView extends GetView<SpalshController> {
  const SpalshView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 4), () {
      // Navigasi ke halaman berikutnya
      Get.offAllNamed('/onboarding');
    });

    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage("assets/hearticon.png"),
              width: 150,
              height: 150,
            ),
            SizedBox(
              height: 50,
            ),
            SpinKitWave(
              color: Colors.orange,
              size: 50,
            )
          ],
        ),
      ),
    );
  }
}
