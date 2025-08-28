import 'package:flutter/material.dart';
import '../../models/cart.dart';

class CartTab extends StatefulWidget {
  const CartTab({super.key});

  @override
  State<CartTab> createState() => _CartTabState();
}

class _CartTabState extends State<CartTab> {
  @override
  void initState() {
    super.initState();
    Cart.instance.addListener(_refresh);
  }

  @override
  void dispose() {
    Cart.instance.removeListener(_refresh);
    super.dispose();
  }

  void _refresh() {
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final items = Cart.instance.items;

    if (items.isEmpty) {
      return const Center(child: Text('Your cart is empty'));
    }

    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            itemCount: items.length,
            separatorBuilder: (_, __) => const Divider(height: 1),
            itemBuilder: (_, i) {
              final p = items[i];
              return ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(p.imageAsset,
                      width: 48, height: 48, fit: BoxFit.cover),
                ),
                title: Text(p.name),
                subtitle: Text('\$${p.price.toStringAsFixed(2)}'),
                trailing: IconButton(
                  icon: const Icon(Icons.remove_circle_outline),
                  onPressed: () => Cart.instance.remove(p),
                ),
              );
            },
          ),
        ),
        SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                      'Total: \$${Cart.instance.total.toStringAsFixed(2)}',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(fontWeight: FontWeight.w700)),
                ),
                FilledButton.icon(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Checkout not implemented')));
                  },
                  icon: const Icon(Icons.payment_outlined),
                  label: const Text('Checkout'),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
