import 'package:example_menu/domain/models/cart_item.dart';
import 'package:example_menu/infrastructure/datasource/foods.dart';
import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  final List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => _cartItems;

  int get cartCount {
    int count = 0;
    for (var item in _cartItems) {
      count += item.quantity;
    }
    return count;
  }

  CartItem getCartItemById(int id) {
    // Busca el índice del producto en el carrito
    final index = _cartItems.indexWhere((item) => item.id == id);
    // Si el producto está en el carrito, lo devuelve
    if (index >= 0) {
      return _cartItems[index];
    } else {
      // Si el producto no está en el carrito, lanza una excepción
      throw Exception('Product not found in the cart');
    }
  }
  
  void addToCart(int id, {int quantity = 1}) {
    // Busca el índice del producto en el carrito
    final index = _cartItems.indexWhere((item) => item.id == id);
    // Si el producto ya está en el carrito, actualiza la cantidad
    if (index >= 0) {
      _cartItems[index] = _cartItems[index].copyWith(
        quantity: _cartItems[index].quantity + quantity,
      );
    } else {
      // Si el producto no está en el carrito, lo agrega
      _cartItems.add(CartItem(id: id, quantity: quantity));
    }
    notifyListeners();
  }

  void removeFromCart(int id) {
    // Busca el índice del producto en el carrito
    final index = _cartItems.indexWhere((item) => item.id == id);
    // Si el producto está en el carrito, lo elimina
    if (index >= 0) {
      _cartItems.removeAt(index);
      notifyListeners();
    }
  }

  void decreaseQuantitybyId(int id,{int quantity = 1}) {
    // Busca el índice del producto en el carrito
    final index = _cartItems.indexWhere((item) => item.id == id);
    // Si el producto está en el carrito y su cantidad es mayor a 1, disminuye la cantidad
    if (index >= 0 && _cartItems[index].quantity > 1) {
      _cartItems[index] = _cartItems[index].copyWith(
        quantity: _cartItems[index].quantity - quantity,
      );
      notifyListeners();
    } else if (index >= 0 && _cartItems[index].quantity == 1) {
      removeFromCart(id);
    }
  }

  // New method to calculate subtotal for each cart item
  double getCartItemSubtotal(CartItem item) {
    final index = Foods.foods.indexWhere((food) => food.id == item.id);
    // Si el producto esta en la lista de alimentos
    if (index >= 0) {
      return Foods.foods[index].price * item.quantity;
    } else {
      // Si el producto no está en la lista de alimentos, lanza una excepción
      throw Exception('Product not found in the food list');
    }
  }

  // Hace la sumatoria de los subtotales de cada producto
  double getCartTotal() {
    return _cartItems.fold(0.0, (total, item) => total + getCartItemSubtotal(item));
  }

}
