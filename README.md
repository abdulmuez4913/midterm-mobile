# 📱 ShopEase - Your First Complete App
### Midterm Project | Mobile Application Development with Flutter (Fall 2026)
**المشرف:** م. منذر إبراهيم محمد (Eng. Monther Ibrahim Muhammad, M.Sc.)  
**إعداد الطالب:** عبدالمعز عصام شلوف (Abdelmoez Essam Shalouf) - الجامعة الليبية الدولية (LIMU)

---

## 🎯 متطلبات المشروع المكتملة (30 درجة + 3 درجات بونص)

| # | المتطلب (Requirement) | الحالة | الملف البرمجي |
|---|---|:---:|---|
| 1 | **Splash Screen** (عرض الشعار 2-3 ثوانٍ ثم الانتقال تلقائياً) | ✅ مكتمل | [`lib/pages/splash_page.dart`](file:///c:/flutter_azoooo/lib/pages/splash_page.dart) |
| 2 | **Onboarding (3 Pages)** (باستخدام حزمة `introduction_screen` وأزرار Skip, Next, Done) | ✅ مكتمل | [`lib/pages/onboarding_page.dart`](file:///c:/flutter_azoooo/lib/pages/onboarding_page.dart) |
| 3 | **Login & Sign Up Pages** (باستخدام Custom TextField و Custom Button للتنقل) | ✅ مكتمل | [`lib/pages/login_page.dart`](file:///c:/flutter_azoooo/lib/pages/login_page.dart) & [`lib/pages/signup_page.dart`](file:///c:/flutter_azoooo/lib/pages/signup_page.dart) |
| 4 | **Home Page** (واجهة نظيفة وبسيطة تعرض شبكة المنتجات وتصنيفاتها وشريط البحث) | ✅ مكتمل | [`lib/pages/home_page.dart`](file:///c:/flutter_azoooo/lib/pages/home_page.dart) |
| 5 | **Settings Page** (زر تبديل الوضع الليلي والنهاري وتغيير اللغة عربي / إنجليزي بشكل فوري وحقيقي) | ✅ مكتمل | [`lib/pages/settings_page.dart`](file:///c:/flutter_azoooo/lib/pages/settings_page.dart) |
| 6 | **Navigation** (تنقل سليم بين جميع الشاشات باستخدام `Navigator.push / pop` وعمل زر الرجوع) | ✅ مكتمل | جميع الصفحات |
| ⭐ | **Bonus (+3 Marks)**: **Product Details Page** (فتح تفاصيل المنتج وسعره ووصفه عند النقر عليه) | ✅ مكتمل | [`lib/pages/product_details_page.dart`](file:///c:/flutter_azoooo/lib/pages/product_details_page.dart) |

---

## 🏗️ هيكلية المشروع (Folder Structure)

تم تنظيم الكود بدقة حسب تعليمات ورقة المشروع:
```text
lib/
├── models/
│   └── product_model.dart          # نموذج بيانات المنتج (Product Class)
├── pages/
│   ├── splash_page.dart            # شاشة البداية (2.8 ثانية ثم الانتقال)
│   ├── onboarding_page.dart        # 3 صفحات تهيئة بحزمة introduction_screen
│   ├── login_page.dart             # شاشة تسجيل الدخول
│   ├── signup_page.dart            # شاشة إنشاء حساب جديد
│   ├── home_page.dart              # الشاشة الرئيسية وشبكة المنتجات
│   ├── product_details_page.dart   # صفحة تفاصيل المنتج (البونص +3)
│   └── settings_page.dart          # صفحة الإعدادات (Dark mode & عربي/إنجليزي)
├── widgets/
│   ├── custom_text_field.dart      # ويدجت حقل الإدخال القابل لإعادة الاستخدام
│   ├── custom_button.dart          # ويدجت الزر القابل لإعادة الاستخدام
│   └── product_card.dart           # ويدجت بطاقة المنتج
└── main.dart                       # نقطة البداية وإدارة الثيم واللغة
assets/
└── translations/
    ├── ar.json                     # النصوص باللغة العربية
    └── en.json                     # النصوص باللغة الإنجليزية
```

---

## 💡 دليل مناقشة الكود مع المهندس (Understanding - 15 Marks)

أسئلة متوقعة وكيف تجيب عليها بكل ثقة:

1. **س: كيف قمت بإدارة حالة الوضع الليلي بدون استخدام Provider؟**
   - **الجواب:** قمنا بتعريف متغير `bool _isDarkMode = false;` داخل `_MyAppState` في ملف `main.dart` كـ `StatefulWidget`، ونقوم بتمرير دالة Callback اسمها `onThemeChanged` إلى صفحة الإعدادات. عند الضغط على الـ Switch، تستدعي الدالة `setState()` في جذر التطبيق لتغيير `ThemeMode` فورا!

2. **س: كيف تم تطبيق اللغتين العربية والإنجليزية؟**
   - **الجواب:** استخدمنا حزمة `easy_localization` (المشروحة في Lecture 11). قمنا بوضع ملفات الترجمة `en.json` و `ar.json` داخل مجلد `assets/translations/`. وعند الضغط على زر اللغة في الإعدادات، نستدعي `context.setLocale(Locale('ar'))` أو `context.setLocale(Locale('en'))` ويقوم التطبيق بتحديث كافة النصوص والاتجاهات (RTL / LTR) تلقائياً.

3. **س: أين تقع الويدجتس المخصصة (Custom Widgets) التي أعدت استخدامها؟**
   - **الجواب:** في مجلد `lib/widgets/`:
     - `CustomTextField`: استخدمناه في صفحة الـ Login لاسم المستخدم وكلمة المرور، وفي صفحة الـ Sign Up لـ 5 حقول مختلفة.
     - `CustomButton`: استخدمناه كزر أساسي في Login و Sign Up و Product Details.
     - `ProductCard`: ويدجت نعرض به كل منتج داخل `GridView.builder`.

4. **س: كيف تم تنفيذ صفحة البونص (+3 درجات)؟**
   - **الجواب:** أنشأنا صفحة `ProductDetailsPage` تستقبل كائن `Product` في الـ Constructor الخاص بها، وعند النقر على أي بطاقة منتج في `HomePage`، نستخدم `Navigator.push` لنمرر المنتج المختار ونعرض اسمه، سعره، وصورته مع زر "إضافة إلى السلة" وزر رجوع شغال 100%.

---

## 🚀 تشغيل التطبيق (How to Run)

```bash
# تشغيل على المتصفح (Edge أو Chrome)
flutter run -d edge
# أو
flutter run -d chrome

# تشغيل كتطبيق ويندوز
flutter run -d windows
```
