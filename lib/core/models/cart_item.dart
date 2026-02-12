class CartItem {
  final String productName;
  final String imagePath;
  final double basePrice;
  final List<String> additions;
  final Map<String, double> additionPrices;
  final int quantity;
  final String size;
  final String cuttingMethod;
  final String packaging;
  final String head;
  final String notes;

  CartItem({
    required this.productName,
    required this.imagePath,
    required this.basePrice,
    required this.additions,
    required this.additionPrices,
    this.quantity = 1,
    this.size = '',
    this.cuttingMethod = '',
    this.packaging = '',
    this.head = '',
    this.notes = '',
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
    String? size,
    String? cuttingMethod,
    String? packaging,
    String? head,
    String? notes,
  }) {
    return CartItem(
      productName: productName ?? this.productName,
      imagePath: imagePath ?? this.imagePath,
      basePrice: basePrice ?? this.basePrice,
      additions: additions ?? this.additions,
      additionPrices: additionPrices ?? this.additionPrices,
      quantity: quantity ?? this.quantity,
      size: size ?? this.size,
      cuttingMethod: cuttingMethod ?? this.cuttingMethod,
      packaging: packaging ?? this.packaging,
      head: head ?? this.head,
      notes: notes ?? this.notes,
    );
  }
}
