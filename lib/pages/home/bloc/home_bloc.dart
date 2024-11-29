import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/model/product_model.dart';
import 'package:ecommerce_app/service/productService.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ProductService productService = ProductService();

  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {});
    on<HomeInitialEvent>(homeInitialEvent);
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    try {
      // fetch products
      final List<Product> products =
          await productService.fetchSepearetCategoriesProducts(event.homeState);
      emit(HomeLoadingSuccessRate(products));
    } catch (e) {
      emit(HomeErrorState(e.toString()));
    }
  }
}
