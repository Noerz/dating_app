import 'dart:ui';

import 'package:dating_app/app/Widget/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/like_controller.dart';

class LikeView extends GetView<LikeController> {
  final LikeController controller = Get.put(LikeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Daftar Partner Yang Disukai',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
        ),
      ),
      body: Obx(
        () {
          if (controller.user.isEmpty) {
            return Center(
              child: Text(
                'Anda Belum Menyukai Partner',
                style: TextStyle(fontSize: 20),
              ),
            );
          } else {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: controller.user.length,
              itemBuilder: (context, index) {
                final user = controller.user[index];
                return Card(
                  child: Container(
                    width: 250,
                    height: 400,
                    decoration: BoxDecoration(
                      color: CustomColors.white,
                      borderRadius: BorderRadius.circular(36),
                    ),
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: ClipRRect(
                            child: Image.network(
                              user.imgUrl,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: ClipRRect(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(
                                  sigmaX: 3,
                                  sigmaY:
                                      3), // Atur nilai sigmaX dan sigmaY sesuai keinginan Anda
                              child: Container(
                                height: 40,
                                color: CustomColors.orange.withOpacity(0.4),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 20,
                          child: Text(
                            "${user.name}, ${user.age.toString()} ",
                            style: TextStyle(
                              fontSize: 14,
                              color: CustomColors.white,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 5,
                          child: Text(
                            user.gender.toLowerCase(),
                            style: TextStyle(color: CustomColors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.getLike(),
        child: Icon(Icons.refresh),
      ),
    );
  }
}
