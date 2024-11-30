import 'package:ecommerce_app/components/reusableButton.dart';
import 'package:ecommerce_app/components/reusable_textfield.dart';
import 'package:ecommerce_app/pages/checkout/ui/components/checkout_card.dart';
import 'package:ecommerce_app/pages/cart/bloc/cart_bloc.dart';
import 'package:ecommerce_app/pages/home/ui/home_page.dart';
import 'package:ecommerce_app/pages/landing/ui/landing_page.dart';
import 'package:ecommerce_app/utils/AppStyles.dart';
import 'package:ecommerce_app/utils/pageTransition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({super.key});

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  // Controllers for text fields
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController zipcodeController = TextEditingController();

  // place an order functionality
  void placeAnOrder() {
    // input field validation
    if (nameController.text.trim().isNotEmpty &&
        emailController.text.trim().isNotEmpty &&
        phoneController.text.trim().isNotEmpty &&
        addressController.text.trim().isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: AppStyles.successColor,
          content: Text(
            "Order Placed",
            style: AppStyles.extrasmallwhite,
            textAlign: TextAlign.center,
          ),
          duration: Duration(seconds: 2),
          dismissDirection: DismissDirection.down,
        ),
      );
      // navigatate to home
      Navigator.push(context, CustomPageRoute(page: Landing()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: AppStyles.errorColor,
          content: Text(
            "Fill the fields",
            style: AppStyles.extrasmallwhite,
            textAlign: TextAlign.center,
          ),
          duration: Duration(seconds: 2),
          dismissDirection: DismissDirection.down,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "CHECKOUT",
          style: AppStyles.normalLight,
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
      ),
      body: BlocBuilder<CartBloc, CartState>(builder: (context, state) {
        // Handle different states
        if (state is CartUpdatedState) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header Text
                Text(
                  "Enter Shipping Details",
                  style: AppStyles.normal,
                ),
                const SizedBox(height: 20),

                // Input Fields
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: double.maxFinite,
                  child: SingleChildScrollView(
                    child: Wrap(
                      runSpacing: 15,
                      children: [
                        ReusableTextField(
                            controller: nameController,
                            placeHolderText: "Enter Full Name"),
                        ReusableTextField(
                            controller: emailController,
                            placeHolderText: "Enter Email"),
                        ReusableTextField(
                            controller: addressController,
                            placeHolderText: "Enter Address"),
                        ReusableTextField(
                            controller: phoneController,
                            placeHolderText: "Enter Contact Number"),
                        ReusableTextField(
                            controller: zipcodeController,
                            placeHolderText: "Enter Zip Code"),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                // Your Products Header
                Center(
                  child: Text(
                    "Your Products",
                    style: AppStyles.normal,
                  ),
                ),
                const SizedBox(height: 10),

                // Product List
                Expanded(
                  child: state.cartItems.isEmpty
                      ? Center(
                          child: Text(
                            "Your cart is empty.",
                            style: AppStyles.normal,
                          ),
                        )
                      : ListView.builder(
                          itemCount: state.cartItems.length,
                          itemBuilder: (context, index) {
                            return CheckOutCard(
                              itemImageuRL: state.cartItems[index].image,
                              itemName: state.cartItems[index].title,
                              itemPrice: state.cartItems[index].price,
                              itemQuantity: state.cartItems[index].quantity!,
                              productId: state.cartItems[index].id,
                            );
                          },
                        ),
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
                ),
                SizedBox(
                  height: 10,
                ),
                ReusableButton(
                  ButttonText: "Place an Order",
                  onClick: () => placeAnOrder(),
                  isDisable: state.cartItems.isEmpty ? true : false,
                ),

                SizedBox(
                  height: 10,
                ),
              ],
            ),
          );
        } else {
          // Default fallback
          return const Center(
            child: Text("Unexpected state."),
          );
        }
      }),
    );
  }
}
