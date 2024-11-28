import 'package:ecommerce_app/utils/AppStyles.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // image
        Stack(alignment: Alignment.topRight, children: [
          Container(
              height: 170,
              width: double.maxFinite,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade400, width: 1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.asset(
                "assets/headset.png",
                fit: BoxFit.contain,
              )),
          Positioned(
            right: 5,
            top: 10,
            child: Container(
              height: 32,
              width: 32,
              decoration: BoxDecoration(
                  color: Colors.grey.shade300, shape: BoxShape.circle),
              child: IconButton(
                  onPressed: () => {},
                  icon: Icon(
                    Icons.favorite,
                    color: Colors.black,
                    size: 16,
                  )),
            ),
          ),
        ]),

        //  price
        Text(
          "349",
          style: AppStyles.medium,
        ),
        Text(
          "SONY Premium Wireless Headphones",
          style: AppStyles.medium,
        ),
        Text(
          "Modal: WH-1000XM4, Black",
          style: AppStyles.extrasmallgrey,
        )

        // barnd

        // product name

        // model type
      ],
    );
  }
}
