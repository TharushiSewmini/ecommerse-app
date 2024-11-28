import 'package:ecommerce_app/components/homeBody.dart';
import 'package:ecommerce_app/pages/home/bloc/home_bloc.dart';
import 'package:ecommerce_app/pages/home/model/product_model.dart';
import 'package:ecommerce_app/pages/home/ui/components/categoryRow.dart';
import 'package:ecommerce_app/utils/AppStyles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedItem = 0;

  // getting seleceted value from category row
  void handleSelectingIndex(int index) {
    setState(() {
      selectedItem = index;
    });
  }

  // returning widget based on selected index
  Widget returningWidget(List<Product> products) {
    switch (selectedItem) {
      case 0:
        return HomeBody(
          products: products,
        );
      case 1:
        return Text("Category 2");
      case 2:
        return Text("Category 3");
      case 3:
        return Text("Category 4");
      default:
        return Text("Null widget");
    }
  }

  final HomeBloc homeBloc = HomeBloc();

  @override
  void initState() {
    super.initState();
    homeBloc.add(HomeInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is AddToCartActionState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Item added to cart"),
            duration: Duration(seconds: 2),
          ));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return Center(child: CircularProgressIndicator());
          case HomeLoadingSuccessRate:
            final sucessRate = state as HomeLoadingSuccessRate;
            return SafeArea(
              child: Scaffold(
                // Background Color
                backgroundColor: Colors.white,

                // Body
                body: Container(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // User Name
                      Text(
                        "Hello Michael",
                        style: AppStyles.headline,
                      ),

                      //  Categories List
                      CategoryRow(
                        onSelected: (value) => handleSelectingIndex(value),
                      ),
                      // Advertistment

                      // body part
                      Expanded(
                          flex: 1,
                          child: Container(
                              child: returningWidget(sucessRate.products))),

                      // Products

                      // App Bar
                    ],
                  ),
                ),
              ),
            );

          default:
            if (state is HomeErrorState) {
              return Center(child: Text("Error: ${state.message}"));
            }
            return Center(child: Text("Unexpected error occurred."));
        }
      },
    );
  }
}
