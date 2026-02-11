import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/cart_item.dart';

class CartCubit extends Cubit<List<CartItem>> {
  CartCubit() : super([]);

  void addToCart(CartItem item) {
    final newState = List<CartItem>.from(state);
    
    // Check if item with same product and additions already exists
    final existingIndex = newState.indexWhere((cartItem) =>
        cartItem.productName == item.productName &&
        _areAdditionsEqual(cartItem.additions, item.additions));

    if (existingIndex != -1) {
      // Update quantity if item exists
      newState[existingIndex] = newState[existingIndex].copyWith(
        quantity: newState[existingIndex].quantity + 1,
      );
    } else {
      // Add new item
      newState.add(item);
    }

    emit(newState);
  }

  void removeFromCart(int index) {
    final newState = List<CartItem>.from(state);
    if (index >= 0 && index < newState.length) {
      newState.removeAt(index);
      emit(newState);
    }
  }

  void updateQuantity(int index, int newQuantity) {
    if (newQuantity <= 0) {
      removeFromCart(index);
      return;
    }

    final newState = List<CartItem>.from(state);
    if (index >= 0 && index < newState.length) {
      newState[index] = newState[index].copyWith(quantity: newQuantity);
      emit(newState);
    }
  }

  void incrementQuantity(int index) {
    final newState = List<CartItem>.from(state);
    if (index >= 0 && index < newState.length) {
      newState[index] = newState[index].copyWith(
        quantity: newState[index].quantity + 1,
      );
      emit(newState);
    }
  }

  void decrementQuantity(int index) {
    final newState = List<CartItem>.from(state);
    if (index >= 0 && index < newState.length) {
      final currentQuantity = newState[index].quantity;
      if (currentQuantity > 1) {
        newState[index] = newState[index].copyWith(
          quantity: currentQuantity - 1,
        );
        emit(newState);
      } else {
        removeFromCart(index);
      }
    }
  }

  double get totalAmount {
    return state.fold(0, (sum, item) => sum + item.totalPrice);
  }

  void clearCart() {
    emit([]);
  }

  bool _areAdditionsEqual(List<String> list1, List<String> list2) {
    if (list1.length != list2.length) return false;
    final sorted1 = List<String>.from(list1)..sort();
    final sorted2 = List<String>.from(list2)..sort();
    for (int i = 0; i < sorted1.length; i++) {
      if (sorted1[i] != sorted2[i]) return false;
    }
    return true;
  }
}
