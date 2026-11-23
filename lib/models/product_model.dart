import 'package:flutter/material.dart';

/// نموذج بيانات المنتج البسيط (Product Model)
class Product {
  final int id;
  final String nameEn;
  final String nameAr;
  final double price;
  final String descriptionEn;
  final String descriptionAr;
  final IconData icon;
  final Color color;

  const Product({
    required this.id,
    required this.nameEn,
    required this.nameAr,
    required this.price,
    required this.descriptionEn,
    required this.descriptionAr,
    required this.icon,
    required this.color,
  });

  /// دالة لإرجاع اسم المنتج حسب لغة التطبيق
  String getName(BuildContext context) {
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';
    return isArabic ? nameAr : nameEn;
  }

  /// دالة لإرجاع وصف المنتج حسب لغة التطبيق
  String getDescription(BuildContext context) {
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';
    return isArabic ? descriptionAr : descriptionEn;
  }

  /// قائمة المنتجات الثابتة للعرض
  static const List<Product> sampleProducts = [
    Product(
      id: 1,
      nameEn: "Smart Watch",
      nameAr: "ساعة ذكية",
      price: 120.0,
      descriptionEn: "Modern smartwatch with fitness tracking and notifications.",
      descriptionAr: "ساعة ذكية عصرية مع خاصية تتبع اللياقة وعرض الإشعارات.",
      icon: Icons.watch_rounded,
      color: Colors.blue,
    ),
    Product(
      id: 2,
      nameEn: "Wireless Headphones",
      nameAr: "سماعات لاسلكية",
      price: 85.0,
      descriptionEn: "High quality wireless sound with long battery life.",
      descriptionAr: "صوت لاسلكي نقي عالي الجودة مع بطارية تدوم طويلاً.",
      icon: Icons.headphones_rounded,
      color: Colors.deepPurple,
    ),
    Product(
      id: 3,
      nameEn: "Laptop",
      nameAr: "حاسوب محمول",
      price: 950.0,
      descriptionEn: "Fast laptop suitable for programming, study and work.",
      descriptionAr: "حاسوب سريع ومثالي للبرمجة والدراسة والأعمال اليومية.",
      icon: Icons.laptop_chromebook_rounded,
      color: Colors.teal,
    ),
    Product(
      id: 4,
      nameEn: "Shoes",
      nameAr: "حذاء رياضي",
      price: 65.0,
      descriptionEn: "Comfortable running shoes made of lightweight material.",
      descriptionAr: "حذاء رياضي مريح جداً للجري والمشي مصنوع من خامات خفيفة.",
      icon: Icons.snowshoeing_rounded,
      color: Colors.orange,
    ),
    Product(
      id: 5,
      nameEn: "Backpack",
      nameAr: "حقيبة ظهر",
      price: 45.0,
      descriptionEn: "Spacious waterproof backpack for laptop and university books.",
      descriptionAr: "حقيبة ظهر واسعة ومقاومة للماء للكمبيوتر المحمول والكتب الجامعية.",
      icon: Icons.backpack_rounded,
      color: Colors.green,
    ),
    Product(
      id: 6,
      nameEn: "Sunglasses",
      nameAr: "نظارة شمسية",
      price: 35.0,
      descriptionEn: "Stylish UV protection sunglasses with modern frame.",
      descriptionAr: "نظارة شمسية أنيقة توفر حماية من الأشعة فوق البنفسجية.",
      icon: Icons.wb_sunny_rounded,
      color: Colors.indigo,
    ),
  ];
}
