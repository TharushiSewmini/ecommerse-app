import 'package:ecommerce_app/pages/browseProducts/ui/browseProducts.dart';
import 'package:ecommerce_app/pages/home/bloc/home_bloc.dart';
import 'package:ecommerce_app/pages/singleProduct/ui/singleProductPage.dart';
import 'package:ecommerce_app/utils/AppStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cart/ui/cartPage.dart';
import '../../home/ui/homepage.dart';

class Landing extends StatefulWidget {
  const Landing({super.key});

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  int currentBottomIndex = 0;

  void handleBottomNavigationBar(int index) {
    setState(() {
      currentBottomIndex = index;
    });
  }

  List pages = [Home(), BrowseProducts(), Cart()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          int cartItemCount = 0;
          if (state is HomeCartUpdateState && state.cartItems.isNotEmpty) {
            cartItemCount = state.cartItems.length;
          }
          return BottomNavigationBar(
            currentIndex: currentBottomIndex,
            onTap: (index) => handleBottomNavigationBar(index),
            elevation: 0,
            backgroundColor: Colors.white,
            selectedLabelStyle: AppStyles.small,
            unselectedLabelStyle: AppStyles.smallGrey,
            selectedItemColor: Colors.black,
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                ),
                label: "Browse",
              ),
              BottomNavigationBarItem(
                icon: Stack(
                  children: [
                    Icon(Icons.shopping_bag), // Main icon
                    Positioned(
                      top: 0, // Adjust the top position
                      right: 0, // Adjust the right position
                      child: CircleAvatar(
                        radius: 8, // Adjust radius for size
                        backgroundColor: Colors.black, // Badge background color
                        child: Text(
                          cartItemCount.toString(), // Badge count
                          style: TextStyle(
                            color: Colors.white,
                            fontSize:
                                10, // Ensure the text fits within the badge
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                label: "Cart", // Label for the BottomNavigationBarItem
              )
            ],
          );
        },
      ),
      body: pages[currentBottomIndex],
    );
  }
}
