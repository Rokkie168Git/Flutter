import 'package:flutter/material.dart';
import '../../models/product.dart';
import '../../widgets/product_card.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  List<Product> _products() => const [
        Product(
            id: 'p1',
            name: 'iPhone 15 Pro',
            imageAsset: 'assets/img/15pm.jpg',
            price: 1199),
        Product(
            id: 'p2',
            name: 'Galaxy S24 Ultra',
            imageAsset: 'assets/img/s24u.jpg',
            price: 1099),
        Product(
            id: 'p3',
            name: 'Google Pixel 9',
            imageAsset: 'assets/img/p9.jpg',
            price: 899),
        Product(
            id: 'p4',
            name: 'OnePlus 13',
            imageAsset: 'assets/img/1+13.jpg',
            price: 649),
        Product(
            id: 'p5',
            name: 'Xiaomi 14',
            imageAsset: 'assets/img/x14.jpg',
            price: 799),
        Product(
            id: 'p6',
            name: 'Nothing Phone (2a)',
            imageAsset: 'assets/img/n3.jpg',
            price: 499),
      ];

  @override
  Widget build(BuildContext context) {
    final items = _products();

    return Padding(
      padding: const EdgeInsets.all(12),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.64, // was ~0.72/.78; lower = taller
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemCount: items.length,
        itemBuilder: (_, i) => ProductCard(product: items[i]),
      ),
    );
  }
}
