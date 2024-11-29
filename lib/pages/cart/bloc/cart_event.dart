part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

class CartInitialEvent extends CartEvent {}

// increase quantity
class IncreaseQuantityButtonClickedEvent extends CartEvent {
  final int productId;
  IncreaseQuantityButtonClickedEvent(this.productId);
}

// decrease quantity
class DecreaseQuantityButtonClickedEvent extends CartEvent {
  final int productId;
  DecreaseQuantityButtonClickedEvent(this.productId);
}

// add or update cart
class AddOrUpdateCartEvent extends CartEvent {
  final Product product;
  final int quantity;
  AddOrUpdateCartEvent(this.product, this.quantity);
}

// remove whole cart
class RemoveCartEvent extends CartEvent {
  final int productId;
  RemoveCartEvent(this.productId);
}
