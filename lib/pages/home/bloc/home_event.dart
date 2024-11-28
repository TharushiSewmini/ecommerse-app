part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class FetchAllProductsEvent extends HomeEvent {}



class AddToCartEvent extends HomeEvent {
  final Product product;
  AddToCartEvent(this.product);
}

class ViewCartItemsEvent extends HomeEvent {}
