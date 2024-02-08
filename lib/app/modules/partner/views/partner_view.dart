import 'dart:ui';

import 'package:card_swiper/card_swiper.dart';
import 'package:dating_app/app/Widget/color_constant.dart';
import 'package:dating_app/app/modules/partner/controllers/partner_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class PartnerView extends GetView<PartnerController> {
  var textValueController = TextEditingController();
  PartnerController controller = Get.put(PartnerController());
  SwiperController swiperController = SwiperController();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky,
        overlays: [SystemUiOverlay.bottom]);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: controller.obx(
        (data) => Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(44.0),
              child: Text(
                "Discover",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 30),
                child: Swiper(
                  controller: swiperController,
                  itemHeight: 450,
                  itemWidth: 500,
                  duration: 600,
                  layout: SwiperLayout.STACK,
                  fade: 2,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.only(left: 50, top: 50),
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
                                borderRadius: BorderRadius.circular(36),
                                child: Image.network(
                                  data[index].imgUrl,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(36),
                                  bottomRight: Radius.circular(36),
                                ),
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                      sigmaX: 3,
                                      sigmaY:
                                          3), // Atur nilai sigmaX dan sigmaY sesuai keinginan Anda
                                  child: Container(
                                    height: 83,
                                    color: CustomColors.orange.withOpacity(0.4),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 40,
                              left: 15,
                              child: Text(
                                "${data[index].name}, ${data[index].age.toString()} ",
                                style: TextStyle(
                                  fontSize: 25,
                                  color: CustomColors.white,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 20,
                              left: 15,
                              child: Text(
                                data[index].gender.toLowerCase(),
                                style: TextStyle(color: CustomColors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: data!.length,
                  onIndexChanged: (int index) {
                    controller.refreshData();
                  },
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: IconButton(
                    style: ButtonStyle(
                      iconSize: MaterialStateProperty.all<double>(64.0),
                      iconColor: MaterialStateProperty.all(CustomColors.red),
                    ),
                    onPressed: () {
                      swiperController.next();
                    },
                    icon: Icon(Icons.cancel_outlined),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      swiperController.previous();
                      controller.likePartner();
                      controller.refreshData();
                    },
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage("assets/LikeButton.jpeg"),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: IconButton(
                    style: ButtonStyle(
                      iconSize: MaterialStateProperty.all<double>(64.0),
                      iconColor: MaterialStateProperty.all(CustomColors.purple),
                    ),
                    onPressed: () {},
                    icon: Icon(Icons.star),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  showSnackBar(BuildContext context) {
    SnackBar snackBar = SnackBar(
      content: Text('Yay! A SnackBar!'),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
