import 'package:ecommerce_app/pages/landing/ui/singleProductPage.dart';

import 'package:ecommerce_app/utils/AppStyles.dart';
import 'package:flutter/material.dart';

import '../cart/ui/checkoutpage.dart';
import '../home/ui/homepage.dart';

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

  List pages = [Home(), SingleProductPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentBottomIndex,
          onTap: (index) => handleBottomNavigationBar(index),
          elevation: 0,
          backgroundColor: Colors.white,
          selectedLabelStyle: AppStyles.small,
          unselectedLabelStyle: AppStyles.smallGrey,
          selectedItemColor: Colors.black,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag), label: "Cart"),
          ]),
      body: pages[currentBottomIndex],
    );
  }
}
