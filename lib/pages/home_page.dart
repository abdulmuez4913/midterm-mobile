import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../models/product_model.dart';
import '../widgets/product_card.dart';
import 'product_details_page.dart';
import 'settings_page.dart';

/// الصفحة الرئيسية (Home Page - Lecture 12)
/// تعرض شبكة بسيطة ونظيفة للمنتجات وزر الإعدادات في الأعلى
class HomePage extends StatelessWidget {
  final ValueChanged<bool> onThemeChanged;

  const HomePage({
    super.key,
    required this.onThemeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('home_title'.tr()),
        actions: [
          // زر الانتقال إلى شاشة الإعدادات
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SettingsPage(
                    onThemeChanged: onThemeChanged,
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          itemCount: Product.sampleProducts.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.9,
          ),
          itemBuilder: (context, index) {
            final product = Product.sampleProducts[index];
            return ProductCard(
              product: product,
              onTap: () {
                // الانتقال لصفحة تفاصيل المنتج (Bonus +3 marks)
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailsPage(
                      product: product,
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
