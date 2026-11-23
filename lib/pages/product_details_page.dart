import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../models/product_model.dart';
import '../widgets/custom_button.dart';

/// صفحة تفاصيل المنتج (Product Details Page - Bonus +3 Marks!)
class ProductDetailsPage extends StatelessWidget {
  final Product product;

  const ProductDetailsPage({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('product_details'.tr()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10),

            // صورة أو أيقونة المنتج
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: product.color.withOpacity(0.15),
                shape: BoxShape.circle,
              ),
              child: Icon(
                product.icon,
                size: 60,
                color: product.color,
              ),
            ),
            const SizedBox(height: 24),

            // اسم المنتج
            Text(
              product.getName(context),
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),

            // سعر المنتج
            Text(
              "\$${product.price.toStringAsFixed(0)}",
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 12),

            // عنوان الوصف
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                'description'.tr(),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 8),

            // نص الوصف
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                product.getDescription(context),
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                  height: 1.5,
                ),
              ),
            ),

            const Spacer(),

            // زر إضافة إلى السلة
            CustomButton(
              text: 'add_to_cart'.tr(),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('added_to_cart'.tr()),
                    duration: const Duration(seconds: 2),
                  ),
                );
              },
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
