import 'package:ecommerce_app/pages/cart/component/calculationRow.dart';
import 'package:ecommerce_app/utils/AppStyles.dart';
import 'package:flutter/material.dart';

class CartCard extends StatelessWidget {
  String itemImageuRL;
  String itemName;
  String itemPrice;
  String itemDescription;
  CartCard(
      {super.key,
      required this.itemImageuRL,
      required this.itemName,
      required this.itemPrice,
      required this.itemDescription});

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
                itemImageuRL,
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
                SizedBox(
                  width: 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // price
                      Text(
                        "\$ $itemPrice",
                        style: AppStyles.mediumred,
                      ),
                              
                      // product name
                      Text(
                        itemName,
                        style: AppStyles.medium,
                      ),
                              
                      //  description
                      Text(
                        itemDescription,
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
