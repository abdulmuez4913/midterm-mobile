import 'dart:async';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'onboarding_page.dart';

/// شاشة البداية (Splash Screen - Lecture 19)
/// تعرض اللوجو واسم التطبيق لمدة 3 ثوانٍ ثم تنتقل للـ Onboarding
class SplashPage extends StatefulWidget {
  final ValueChanged<bool> onThemeChanged;

  const SplashPage({
    super.key,
    required this.onThemeChanged,
  });

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    // الانتظار لمدة 3 ثوانٍ ثم الانتقال لشاشة الـ Onboarding
    Timer(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => OnboardingPage(
              onThemeChanged: widget.onThemeChanged,
            ),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[600],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // أيقونة اللوجو
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Icon(
                Icons.shopping_bag_rounded,
                size: 60,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 20),

            // اسم التطبيق
            Text(
              'app_name'.tr(),
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),

            // نص فرعي بسيط
            Text(
              'splash_tagline'.tr(),
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white70,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
