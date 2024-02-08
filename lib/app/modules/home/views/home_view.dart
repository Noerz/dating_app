import 'package:dating_app/app/Widget/color_constant.dart';
import 'package:dating_app/app/modules/auth/controllers/auth_controller.dart';
import 'package:dating_app/app/modules/like/controllers/like_controller.dart';
import 'package:dating_app/app/modules/like/views/like_view.dart';
import 'package:dating_app/app/modules/partner/views/partner_view.dart';
import 'package:dating_app/app/modules/profile/views/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

class HomeView extends StatelessWidget {
  final AuthController _googleSignInController = Get.put(AuthController());
  final LikeController _likeController = Get.put(LikeController());
  final List<Widget> _pages = [
    PartnerView(),
    LikeView(),
    ProfileView(),
    // Add other widgets for additional pages here
  ];
  final List<IconData> _listIcon = [
    Icons.home,
    Icons.favorite,
    Icons.person,
  ];
  final RxInt _currentIndex = 0.obs;

  void _onTabTapped(int index) {
    _currentIndex.value = index;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        final currentUser = _googleSignInController.currentUser.value;
        return Scaffold(
          body: _pages[_currentIndex.value],
          bottomNavigationBar: AnimatedBottomNavigationBar(
            icons: _listIcon,
            activeIndex: _currentIndex.value,
            notchSmoothness: NotchSmoothness.softEdge,
            onTap: _onTabTapped,
            activeColor: CustomColors.red,
            inactiveColor: CustomColors.border,
          ),
        );
      },
    );
  }
}
