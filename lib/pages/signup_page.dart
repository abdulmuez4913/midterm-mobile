import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
import 'home_page.dart';

/// شاشة إنشاء حساب جديد (Sign Up Page - Lecture 8 & 9)
class SignupPage extends StatelessWidget {
  final ValueChanged<bool> onThemeChanged;

  const SignupPage({
    super.key,
    required this.onThemeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.person_add_rounded,
                    size: 70,
                    color: Colors.blue,
                  ),
                  const SizedBox(height: 16),

                  Text(
                    'signup_title'.tr(),
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),

                  Text(
                    'signup_subtitle'.tr(),
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // حقل الاسم الكامل
                  CustomTextField(
                    label: 'full_name'.tr(),
                    hint: 'Your name',
                    prefixIcon: Icons.person_outline_rounded,
                  ),
                  const SizedBox(height: 16),

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

                  // زر إنشاء الحساب (ينتقل للصفحة الرئيسية)
                  CustomButton(
                    text: 'signup_btn'.tr(),
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(
                            onThemeChanged: onThemeChanged,
                          ),
                        ),
                        (route) => false,
                      );
                    },
                  ),
                  const SizedBox(height: 16),

                  // رابط العودة لتسجيل الدخول
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('have_account'.tr()),
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text('login_btn'.tr()),
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
