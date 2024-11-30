import 'package:ecommerce_app/pages/cart/bloc/cart_bloc.dart';
import 'package:ecommerce_app/utils/AppStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckOutCard extends StatelessWidget {
  int productId;
  String itemImageuRL;
  String itemName;
  double itemPrice;
  int itemQuantity;
  CheckOutCard(
      {super.key,
      required this.productId,
      required this.itemImageuRL,
      required this.itemName,
      required this.itemPrice,
      required this.itemQuantity});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(color: Colors.grey.shade300, width: 1))),
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // image
          Container(
            height: 80,
            width: 80,
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(right: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                itemImageuRL,
                fit: BoxFit.cover,
              ),
            ),
          ),

          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // price
                Text(
                  "\$ $itemPrice X $itemQuantity",
                  style: AppStyles.medium,
                ),

                // product name
                Text(
                  itemName,
                  style: AppStyles.extrasmallgrey,
                ),
              ],
            ),
          ),

          IconButton(
              onPressed: () {
                BlocProvider.of<CartBloc>(context)
                    .add(RemoveCartEvent(productId));
              },
              icon: Icon(Icons.delete_outline_outlined))

          // Row
        ],
      ),
    );
  }
}
