import 'package:ecommerce_app/utils/AppStyles.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final Function() onAddCart;

  const ProductCard(
      {super.key,
      required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.category,
      required this.image,
      required this.onAddCart});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // image
        Stack(alignment: Alignment.topRight, children: [
          Container(
              height: 170,
              width: double.maxFinite,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade400, width: 1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.network(
                image,
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
                  onPressed: () => onAddCart(),
                  icon: const Icon(
                    Icons.shopping_cart_rounded,
                    color: Colors.black,
                    size: 16,
                  )),
            ),
          ),
        ]),

        //  price
        Text(
          price.toString(),
          style: AppStyles.medium,
        ),
        Text(
          category,
          style: AppStyles.medium,
        ),
        Text(
          title,
          softWrap: true,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          style: AppStyles.extrasmallgrey,
        )

        // barnd

        // product name

        // model type
      ],
    );
  }
}
