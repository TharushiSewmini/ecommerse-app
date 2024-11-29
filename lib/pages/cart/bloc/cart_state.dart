part of 'cart_bloc.dart';

@immutable
sealed class CartState {}

class CartInitial extends CartState {
  final List<Product> cartItems = [];
  final int totalQuantity = 0;
}

class CartActionState extends CartState {}

class IncreaseQuantityState extends CartActionState {}

class DecreaseQuantityState extends CartActionState {}

class NavigateToCheckOutPageState extends CartActionState {}

class AddOrUpdateCartState extends CartActionState {}

class RemoveWholeCartState extends CartActionState {}

class CartUpdatedState extends CartState {
  final List<Product> cartItems;
  final double total;
  CartUpdatedState({required this.cartItems , required this.total});
}
