part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

abstract class HomeActionState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadingSuccessRate extends HomeState {
  final List<Product> products;
  HomeLoadingSuccessRate(this.products);
}

class HomeErrorState extends HomeState {
  final String message;
  HomeErrorState(this.message);
}

class AddToCartActionState extends HomeActionState {}

class HomeCartUpdateState extends HomeState {
  final List<Product> cartItems;
  HomeCartUpdateState(this.cartItems);
}
