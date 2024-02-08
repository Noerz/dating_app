import 'package:dating_app/app/modules/onboarding/onboarding_model.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
 final List<OnboardingItem> items = [
    OnboardingItem(
      image: 'assets/onboarding1.jpeg',
      tittle: 'Algorithm',
      description:
          'Users going through a vetting process to ensure you never match with bots.',
    ),
    OnboardingItem(
      image: 'assets/onboarding2.jpeg',
      tittle: 'Matches',
      description:
          'We match you with people that have a large array of similar interests.',
    ),
    OnboardingItem(
      image: 'assets/onboarding3.jpeg',
      tittle: 'Premium',
      description:
          'Sign up today and enjoy the first month of premium benefits on us.',
    ),
  ];

  var currentIndex = 0.obs;

  void setIndex(int index) {
    currentIndex.value = index;
  }
}
