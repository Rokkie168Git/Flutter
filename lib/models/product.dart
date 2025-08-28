class Product {
  final String id;
  final String name;
  final String imageAsset; // you can point to assets/Icon/ or assets/img/
  final double price;

  const Product({
    required this.id,
    required this.name,
    required this.imageAsset,
    required this.price,
  });
}
