import 'package:flutter/foundation.dart';
import 'product.dart';

class Cart extends ChangeNotifier {
  static final Cart instance = Cart._();
  Cart._();

  final List<Product> _items = [];
  List<Product> get items => List.unmodifiable(_items);

  double get total => _items.fold(0.0, (p, e) => p + e.price);

  void add(Product p) {
    _items.add(p);
    notifyListeners();
  }

  void remove(Product p) {
    _items.remove(p);
    notifyListeners();
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }
}
