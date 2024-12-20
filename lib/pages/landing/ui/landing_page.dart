import 'package:ecommerce_app/pages/browseProducts/ui/browseProducts.dart';
import 'package:ecommerce_app/pages/cart/bloc/cart_bloc.dart';
import 'package:ecommerce_app/utils/AppStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cart/ui/cartPage.dart';
import '../../home/ui/home_page.dart';

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

  List pages = [const Home(), const BrowseProducts(), const Cart()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          int cartItemCount = 0;
          if (state is CartUpdatedState && state.cartItems.isNotEmpty) {
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
              const BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: "Home",
              ),
              const BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                ),
                label: "Browse",
              ),
              BottomNavigationBarItem(
                icon: Stack(
                  children: [
                    const Icon(Icons.shopping_bag), // Main icon
                    Positioned(
                      top: 0, // Adjust the top position
                      right: 0, // Adjust the right position
                      child: CircleAvatar(
                        radius: 8, // Adjust radius for size
                        backgroundColor: Colors.black, // Badge background color
                        child: Text(
                          cartItemCount.toString(), // Badge count
                          style: const TextStyle(
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
