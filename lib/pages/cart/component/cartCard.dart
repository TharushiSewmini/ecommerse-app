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
    return SizedBox(
      height: 110,
      width: double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // image
          Container(
            height: 80,
            width: 80,
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(right: 10),
            decoration: const BoxDecoration(shape: BoxShape.circle),
            child: Image.network(
              itemImageuRL,
              width: double.maxFinite,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),

          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
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
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Icon(
                        Icons.more_vert,
                        size: 30,
                        weight: 0.3,
                      ),
                      // adding item row
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        spacing: 10,
                        children: [
                          SizedBox(
                            height: 30,
                            width: 30,
                            child: FittedBox(
                              child: FloatingActionButton(
                                backgroundColor: Colors.grey.shade100,
                                elevation: 0,
                                onPressed: () => {},
                                child: const Icon(Icons.remove),
                              ),
                            ),
                          ),
                          Text(
                            "0",
                            style: AppStyles.normal,
                          ),
                          SizedBox(
                            height: 30,
                            width: 30,
                            child: FittedBox(
                              child: FloatingActionButton(
                                backgroundColor: const Color(0xff495057),
                                elevation: 0,
                                onPressed: () => {},
                                child: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
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
