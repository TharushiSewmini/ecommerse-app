import 'package:ecommerce_app/utils/AppStyles.dart';
import 'package:flutter/material.dart';

class BrowseCard extends StatelessWidget {
  String itemImageuRL;
  String itemName;
  double itemPrice;
  String itemDescription;
  BrowseCard(
      {super.key,
      required this.itemImageuRL,
      required this.itemName,
      required this.itemPrice,
      required this.itemDescription});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
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
                  "\$ $itemPrice",
                  style: AppStyles.medium,
                ),

                // product name
                Text(
                  itemName,
                  style: AppStyles.medium,
                  softWrap: true,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
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
          )

          // Row
        ],
      ),
    );
  }
}
