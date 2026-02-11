class CartItem {
  final String productName;
  final String imagePath;
  final double basePrice;
  final List<String> additions;
  final Map<String, double> additionPrices;
  final int quantity;

  CartItem({
    required this.productName,
    required this.imagePath,
    required this.basePrice,
    required this.additions,
    required this.additionPrices,
    this.quantity = 1,
  });

  double get unitPrice {
    double additionsTotal = 0;
    for (var addition in additions) {
      additionsTotal += additionPrices[addition] ?? 0;
    }
    return basePrice + additionsTotal;
  }

  double get totalPrice => unitPrice * quantity;

  CartItem copyWith({
    String? productName,
    String? imagePath,
    double? basePrice,
    List<String>? additions,
    Map<String, double>? additionPrices,
    int? quantity,
  }) {
    return CartItem(
      productName: productName ?? this.productName,
      imagePath: imagePath ?? this.imagePath,
      basePrice: basePrice ?? this.basePrice,
      additions: additions ?? this.additions,
      additionPrices: additionPrices ?? this.additionPrices,
      quantity: quantity ?? this.quantity,
    );
  }
}
