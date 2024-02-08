import 'package:card_swiper/card_swiper.dart';
import 'package:dating_app/app/Widget/button_sign.dart';
import 'package:dating_app/app/Widget/color_constant.dart';
import 'package:dating_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/onboarding_controller.dart';

class OnboardingView extends StatelessWidget {
  OnboardingController controller = Get.put(OnboardingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Swiper(
              itemCount: controller.items.length,
              itemBuilder: (context, index) {
                final item = controller.items[index];
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AspectRatio(
                      aspectRatio: 235 /
                          360, // Update the aspect ratio based on the image dimensions
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(item.image),
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      item.tittle,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: CustomColors.red,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      item.description,
                      style: TextStyle(
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                );
              },
              viewportFraction: 0.8,
              scale: 0.9,
              pagination: SwiperPagination(),
              control: null,
              onIndexChanged: (index) {
                Get.find<OnboardingController>().setIndex(index);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                CustomButton(
                  onPressed: () {
                    Get.toNamed('/auth');
                  },
                  text: "Create An Account",
                  textColor: CustomColors.white,
                  buttonColor: CustomColors.red,
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?"),
                    TextButton(
                      onPressed: () {
                        Get.toNamed('/auth');
                      },
                      child: Text("Sign In"),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
