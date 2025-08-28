import 'package:flutter/material.dart';
import '../models/cart.dart';
import 'tabs/home_tab.dart';
import 'tabs/cart_tab.dart';
import 'tabs/profile_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _index = 0;

  @override
  void initState() {
    super.initState();
    Cart.instance.addListener(_onCartChange);
  }

  @override
  void dispose() {
    Cart.instance.removeListener(_onCartChange);
    super.dispose();
  }

  void _onCartChange() {
    if (mounted) setState(() {}); // rebuild to update badge
  }

  @override
  Widget build(BuildContext context) {
    final titles = ['Home', 'Cart', 'Profile'];

    return Scaffold(
      appBar: AppBar(
        title: Text(titles[_index]),
        centerTitle: true,
      ),
      body: IndexedStack(
        index: _index,
        children: const [
          HomeTab(),
          CartTab(),
          ProfileTab(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (i) => setState(() => _index = i),
        destinations: [
          const NavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home),
              label: 'Home'),
          NavigationDestination(
            icon: Stack(
              clipBehavior: Clip.none,
              children: [
                const Icon(Icons.shopping_cart_outlined),
                if (Cart.instance.items.isNotEmpty)
                  Positioned(
                    right: -6,
                    top: -2,
                    child: Container(
                      padding: const EdgeInsets.all(3),
                      decoration: const BoxDecoration(
                          color: Colors.red, shape: BoxShape.circle),
                      child: Text('${Cart.instance.items.length}',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 10)),
                    ),
                  )
              ],
            ),
            selectedIcon: const Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          const NavigationDestination(
              icon: Icon(Icons.person_outline),
              selectedIcon: Icon(Icons.person),
              label: 'Profile'),
        ],
      ),
    );
  }
}
