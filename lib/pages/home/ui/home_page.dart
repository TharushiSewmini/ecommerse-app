import 'package:ecommerce_app/pages/home/ui/components/allItems.dart';
import 'package:ecommerce_app/pages/home/bloc/home_bloc.dart';
import 'package:ecommerce_app/model/product_model.dart';
import 'package:ecommerce_app/pages/home/ui/components/categoryRow.dart';
import 'package:ecommerce_app/pages/login/bloc/auth_bloc.dart';
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

  void handleSelectingIndex(int index) {
    setState(() {
      selectedItem = index;
    });

    String category = "";
    switch (index) {
      case 1:
        category = "electronics";
        break;
      case 2:
        category = "jewelery";
        break;
      case 3:
        category = "electronics";
        break;
      default:
        category = "";
    }

    homeBloc.add(HomeInitialEvent(category));
  }


  final HomeBloc homeBloc = HomeBloc();

  @override
  void initState() {
    super.initState();
    homeBloc.add(HomeInitialEvent(""));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {},
          builder: (context, authState) {
            String userName = "";
            if (authState is LoginSuccessState) {
              userName = authState.user.userName;
            }

            return Container(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // User Name
                  Text(
                    "Hello $userName",
                    style: AppStyles.headline,
                  ),

                  // Categories List
                  CategoryRow(
                    onSelected: (value) => handleSelectingIndex(value),
                  ),

                  Expanded(
                    flex: 1,
                    child: BlocConsumer<HomeBloc, HomeState>(
                      bloc: homeBloc,
                      listenWhen: (previous, current) =>
                          current is HomeActionState,
                      buildWhen: (previous, current) =>
                          current is! HomeActionState,
                      listener: (context, state) {},
                      builder: (context, state) {
                        switch (state.runtimeType) {
                          case HomeLoadingState:
                            return Center(child: CircularProgressIndicator());
                          case HomeLoadingSuccessRate:
                            final successState =
                                state as HomeLoadingSuccessRate;
                            return AllItems(products: successState.products);
                          default:
                            if (state is HomeErrorState) {
                              return Center(
                                  child: Text("Error: ${state.message}"));
                            }
                            return Center(
                                child: Text("Unexpected error occurred."));
                        }
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
