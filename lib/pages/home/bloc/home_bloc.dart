import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/pages/home/model/product_model.dart';
import 'package:ecommerce_app/service/productService.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ProductService productService = ProductService();
  List<Product> cartItems = [];
  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<HomeInitialEvent>(homeInitialEvent);
    on<AddToCartEvent>(addToCartEvent);
    on<ViewCartItemsEvent>(viewCartItemsEvent);
  }



  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    try {
      // fetch products
      final List<Product> products = await productService.fetchProducts();
      emit(HomeLoadingSuccessRate(products));
    } catch (e) {
      emit(HomeErrorState(e.toString()));
    }
  }

  FutureOr<void> addToCartEvent(AddToCartEvent event, Emitter<HomeState> emit) {
    cartItems.add(event.product);
    emit(HomeCartUpdateState(cartItems));
  }

  FutureOr<void> viewCartItemsEvent(
      ViewCartItemsEvent event, Emitter<HomeState> emit) {
    emit(HomeCartUpdateState(cartItems));
  }
}
