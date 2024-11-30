import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/model/product_model.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final List<Product> _cartItems = [];
  CartBloc() : super(CartInitial()) {
    on<CartEvent>((event, emit) {});
    on<IncreaseQuantityButtonClickedEvent>(
        cartIncreaseQuantityButtonClickedEvent);
    on<DecreaseQuantityButtonClickedEvent>(
        cartDecreaseQuantityButtonClickedEvent);
    on<AddOrUpdateCartEvent>(addOrUpdateCart);
    on<RemoveCartEvent>(removeCart);
  }

// calculating total
  double calculateTotal() {
    double total = 0;
    for (var item in _cartItems) {
      total += (item.price * (item.quantity ?? 0));
    }
    return total;
  }

// each item quantity increasing
  FutureOr<void> cartIncreaseQuantityButtonClickedEvent(
      IncreaseQuantityButtonClickedEvent event, Emitter<CartState> emit) {
    final existItemIndex =
        _cartItems.indexWhere((item) => item.id == event.productId);

    if (existItemIndex != -1) {
      _cartItems[existItemIndex].quantity =
          (_cartItems[existItemIndex].quantity ?? 0) + 1;
    }
    emit(CartUpdatedState(cartItems: _cartItems, total: calculateTotal()));
  }

// each item quantity decreasing
  FutureOr<void> cartDecreaseQuantityButtonClickedEvent(
      DecreaseQuantityButtonClickedEvent event, Emitter<CartState> emit) {
    final existItemIndex =
        _cartItems.indexWhere((item) => item.id == event.productId);

    if (existItemIndex != -1) {
      if ((_cartItems[existItemIndex].quantity ?? 0) > 1) {
        _cartItems[existItemIndex].quantity =
            (_cartItems[existItemIndex].quantity ?? 0) - 1;
      } else {
        _cartItems.removeAt(existItemIndex);
      }
      emit(CartUpdatedState(cartItems: _cartItems, total: calculateTotal()));
    }
  }

// updating whole cart
  FutureOr<void> addOrUpdateCart(
      AddOrUpdateCartEvent event, Emitter<CartState> emit) {
    final existItemIndex =
        _cartItems.indexWhere((item) => item.id == event.product.id);

    if (existItemIndex != -1) {
      _cartItems[existItemIndex].quantity =
          (_cartItems[existItemIndex].quantity ?? 0) + 1;
    } else {
      _cartItems.add(event.product..quantity = 1);
    }
    emit(CartUpdatedState(cartItems: _cartItems, total: calculateTotal()));
  }

// removing whole cart
  FutureOr<void> removeCart(RemoveCartEvent event, Emitter<CartState> emit) {
    final existItemIndex =
        _cartItems.indexWhere((item) => item.id == event.productId);

    if (existItemIndex != -1) {
      _cartItems.removeAt(existItemIndex);
    }
    emit(CartUpdatedState(cartItems: _cartItems, total: calculateTotal()));
  }
}
