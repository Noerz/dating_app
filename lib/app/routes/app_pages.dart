import 'package:get/get.dart';

import '../modules/auth/bindings/auth_binding.dart';
import '../modules/auth/views/auth_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/like/bindings/like_binding.dart';
import '../modules/like/views/like_view.dart';
import '../modules/onboarding/bindings/onboarding_binding.dart';
import '../modules/onboarding/views/onboarding_view.dart';
import '../modules/partner/bindings/partner_binding.dart';
import '../modules/partner/views/partner_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/spalsh/bindings/spalsh_binding.dart';
import '../modules/spalsh/views/spalsh_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPALSH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.AUTH,
      page: () => AuthView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.PARTNER,
      page: () => PartnerView(),
      binding: PartnerBinding(),
    ),
    GetPage(
      name: _Paths.LIKE,
      page: () => LikeView(),
      binding: LikeBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.SPALSH,
      page: () => SpalshView(),
      binding: SpalshBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARDING,
      page: () =>  OnboardingView(),
      binding: OnboardingBinding(),
    ),
  ];
}
