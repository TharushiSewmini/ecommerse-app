import 'package:ecommerce_app/pages/cart/component/calculationRow.dart';
import 'package:ecommerce_app/utils/AppStyles.dart';
import 'package:flutter/material.dart';

class CartCard extends StatelessWidget {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  CartCard(
      {super.key,
      required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.category,
      required this.image});

  @override
  Widget build(BuildContext context) {
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
                        "\$ $price",
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
                    const Icon(
                      Icons.more_vert,
                      size: 30,
                      weight: 0.3,
                    ),
                    // adding item row
                    CalculationRow()
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
