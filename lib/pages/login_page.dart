import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
import 'home_page.dart';
import 'signup_page.dart';

/// شاشة تسجيل الدخول (Login Page - Lecture 8 & 9)
class LoginPage extends StatelessWidget {
  final ValueChanged<bool> onThemeChanged;

  const LoginPage({
    super.key,
    required this.onThemeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // أيقونة شاشة الدخول
                  const Icon(
                    Icons.account_circle_rounded,
                    size: 80,
                    color: Colors.blue,
                  ),
                  const SizedBox(height: 20),

                  // عنوان الصفحة
                  Text(
                    'login_title'.tr(),
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),

                  Text(
                    'login_subtitle'.tr(),
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 32),

                  // حقل البريد الإلكتروني
                  CustomTextField(
                    label: 'email'.tr(),
                    hint: 'example@email.com',
                    prefixIcon: Icons.email_outlined,
                  ),
                  const SizedBox(height: 16),

                  // حقل كلمة المرور
                  CustomTextField(
                    label: 'password'.tr(),
                    hint: '••••••••',
                    prefixIcon: Icons.lock_outline_rounded,
                    isPassword: true,
                  ),
                  const SizedBox(height: 24),

                  // زر تسجيل الدخول (ينتقل إلى الصفحة الرئيسية)
                  CustomButton(
                    text: 'login_btn'.tr(),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(
                            onThemeChanged: onThemeChanged,
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 16),

                  // رابط الانتقال لإنشاء حساب جديد
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('no_account'.tr()),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignupPage(
                                onThemeChanged: onThemeChanged,
                              ),
                            ),
                          );
                        },
                        child: Text('signup_btn'.tr()),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
