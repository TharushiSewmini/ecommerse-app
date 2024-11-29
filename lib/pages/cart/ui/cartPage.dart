import 'package:ecommerce_app/components/reusableButton.dart';
import 'package:ecommerce_app/pages/cart/bloc/cart_bloc.dart';
import 'package:ecommerce_app/pages/cart/component/cartCard.dart';
import 'package:ecommerce_app/pages/home/bloc/home_bloc.dart';
import 'package:ecommerce_app/pages/singleProduct/ui/singleProductPage.dart';
import 'package:ecommerce_app/utils/AppStyles.dart';
import 'package:ecommerce_app/utils/pageTransition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocBuilder<CartBloc, CartState>(builder: (context, state) {
      if (state is CartUpdatedState && state.cartItems.isNotEmpty) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'CART',
              style: AppStyles.normalLight,
            ),
            centerTitle: true,
            elevation: 0,
            scrolledUnderElevation: 0,
            backgroundColor: Colors.white,
          ),
          backgroundColor: Colors.white,
          body: ListView.builder(
              itemCount: state.cartItems.length,
              itemBuilder: (context, index) {
                final cartItems = state.cartItems;
                return Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        CustomPageRoute(
                            page: SingleProductPage(
                                category: cartItems[index].category,
                                description: cartItems[index].description,
                                image: cartItems[index].image,
                                price: cartItems[index].price,
                                title: cartItems[index].title))),
                    child: CartCard(
                      id: cartItems[index].id,
                      title: cartItems[index].title,
                      price: cartItems[index].price,
                      description: cartItems[index].description,
                      category: cartItems[index].category,
                      image: cartItems[index].image,
                      quantity: cartItems[index].quantity.toString(),
                    ),
                  ),
                );
              }),
          bottomNavigationBar: Container(
            height: 100,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            width: double.maxFinite,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 4,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total",
                          style: AppStyles.medium,
                        ),
                        Text(
                          "\$ " + state.total.toString(),
                          style: AppStyles.medium,
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 4,
                ),
                ReusableButton(ButttonText: "Checkout", onClick: () {}),
                Row(
                  children: [],
                )
              ],
            ),
          ),
        );
      } else {
        return Center(
            child: Text(
          "No items in cart",
          style: AppStyles.largeLight20,
        ));
      }
    }));
  }
}

class CartProps {
  String itemImageURL;
  String itemName;
  String itemPrice;
  String itemDescription;

  CartProps(
      {required this.itemImageURL,
      required this.itemName,
      required this.itemPrice,
      required this.itemDescription});
}
