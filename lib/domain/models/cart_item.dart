class CartItem {
  final int id;
  final int quantity;

  CartItem({
    required this.id,
    required this.quantity,
  });

  // Copywith para cuando se modifica la cantidad
  // de un producto en el carrito
  CartItem copyWith({int? quantity}) {
    return CartItem(
      id: id,
      quantity: quantity ?? this.quantity,
    );
  }
}
