import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

/// صفحة الإعدادات (Settings Page - Lecture 10 & 11)
/// تحتوي على تبديل الوضع الليلي (Dark Mode) وتغيير اللغة (عربي / إنجليزي)
class SettingsPage extends StatefulWidget {
  final ValueChanged<bool> onThemeChanged;

  const SettingsPage({
    super.key,
    required this.onThemeChanged,
  });

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    // معرفة ما إذا كان التطبيق في الوضع المظلم حالياً من الثيم مباشرة
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text('settings_title'.tr()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // 1. زر تبديل الوضع الليلي (Dark Mode Switch)
            SwitchListTile(
              title: Text(
                'dark_mode'.tr(),
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              secondary: Icon(
                isDark ? Icons.dark_mode_rounded : Icons.light_mode_rounded,
                color: isDark ? Colors.amber : Colors.blue,
              ),
              value: isDark,
              onChanged: (bool value) {
                // تغيير الثيم عبر دالة الـ Callback
                widget.onThemeChanged(value);
              },
            ),
            const Divider(),

            // 2. زر تبديل اللغة (Language Button EN / ع)
            ListTile(
              title: Text(
                'language'.tr(),
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              subtitle: Text(
                context.locale.languageCode == 'ar'
                    ? 'arabic'.tr()
                    : 'english'.tr(),
              ),
              leading: const Icon(
                Icons.language_rounded,
                color: Colors.blue,
              ),
              trailing: ElevatedButton(
                onPressed: () {
                  // التبديل بين اللغتين العربية والإنجليزية
                  if (context.locale.languageCode == 'ar') {
                    context.setLocale(const Locale('en'));
                  } else {
                    context.setLocale(const Locale('ar'));
                  }
                },
                child: Text(
                  context.locale.languageCode == 'ar' ? 'EN' : 'ع',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
