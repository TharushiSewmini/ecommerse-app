part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeInitialEvent extends HomeEvent {
  String homeState;
  HomeInitialEvent(this.homeState);
}

class FetchAllProductsEvent extends HomeEvent {}



