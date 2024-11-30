import 'package:ecommerce_app/pages/cart/bloc/cart_bloc.dart';
import 'package:ecommerce_app/pages/cart/ui/component/calculationRow.dart';
import 'package:ecommerce_app/utils/AppStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCard extends StatelessWidget {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final String quantity;
  CartCard(
      {super.key,
      required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.category,
      required this.image,
      required this.quantity});

  @override
  Widget build(BuildContext context) {
    // cart item removing
    void handleCartItemRemove() {
      BlocProvider.of<CartBloc>(context).add(RemoveCartEvent(id));
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      margin: EdgeInsets.only(bottom: 20),
      height: 100,
      width: double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // image
          Container(
            height: 80,
            width: 80,
            margin: EdgeInsets.only(right: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                image,
                width: double.maxFinite,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
          ),

          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // price
                      Text(
                        "\$ $price x $quantity",
                        style: AppStyles.mediumred,
                      ),

                      // product name
                      Text(
                        title,
                        softWrap: true,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppStyles.medium,
                      ),

                      //  description
                      Text(
                        description,
                        softWrap: true,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppStyles.extrasmallgrey,
                      )
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () => handleCartItemRemove(),
                      child: const Icon(
                        Icons.delete_outline_sharp,
                        size: 30,
                        weight: 0.1,
                        color: Colors.grey,
                      ),
                    ),
                    // adding item row
                    CalculationRow(
                      productId: id,
                      quantity: quantity,
                    )
                  ],
                )
              ],
            ),
          )

          // Row
        ],
      ),
    );
  }
}
