import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'login_page.dart';

/// شاشة الـ Onboarding (3 صفحات بحزمة introduction_screen - Lecture 19)
class OnboardingPage extends StatelessWidget {
  final ValueChanged<bool> onThemeChanged;

  const OnboardingPage({
    super.key,
    required this.onThemeChanged,
  });

  /// دالة الانتقال لصفحة تسجيل الدخول
  void _goToLogin(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage(
          onThemeChanged: onThemeChanged,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IntroductionScreen(
          // الصفحات الثلاث
          pages: [
            PageViewModel(
              title: 'onboarding_title_1'.tr(),
              body: 'onboarding_desc_1'.tr(),
              image: const Icon(Icons.search_rounded, size: 100, color: Colors.blue),
            ),
            PageViewModel(
              title: 'onboarding_title_2'.tr(),
              body: 'onboarding_desc_2'.tr(),
              image: const Icon(Icons.shopping_cart_rounded, size: 100, color: Colors.blue),
            ),
            PageViewModel(
              title: 'onboarding_title_3'.tr(),
              body: 'onboarding_desc_3'.tr(),
              image: const Icon(Icons.local_shipping_rounded, size: 100, color: Colors.blue),
            ),
          ],
          onDone: () => _goToLogin(context),
          onSkip: () => _goToLogin(context),
          showSkipButton: true,
          skip: Text('skip'.tr()),
          next: Text('next'.tr()),
          done: Text(
            'done'.tr(),
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          dotsDecorator: const DotsDecorator(
            size: Size.square(10.0),
            activeSize: Size(20.0, 10.0),
            activeColor: Colors.blue,
            color: Colors.grey,
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
            ),
          ),
        ),
      ),
    );
  }
}
