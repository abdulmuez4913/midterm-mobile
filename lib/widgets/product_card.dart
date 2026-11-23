import 'package:flutter/material.dart';
import '../models/product_model.dart';

/// ويدجت بطاقة المنتج البسيطة (Custom Product Card - Lecture 12)
class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onTap;

  const ProductCard({
    super.key,
    required this.product,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // مساحة أيقونة المنتج
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  color: product.color.withOpacity(0.15),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  product.icon,
                  size: 36,
                  color: product.color,
                ),
              ),
              const SizedBox(height: 12),

              // اسم المنتج
              Text(
                product.getName(context),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6),

              // سعر المنتج
              Text(
                "\$${product.price.toStringAsFixed(0)}",
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
