import 'package:ecommerce_app/utils/AppStyles.dart';
import 'package:flutter/material.dart';

class DealsCart extends StatelessWidget {
  String dealImageUrl;
  String dealCategory;
  String dealPrice;
  String dealName;
  String dealDescription;

  DealsCart(
      {super.key,
      required this.dealImageUrl,
      required this.dealCategory,
      required this.dealPrice,
      required this.dealName,
      required this.dealDescription});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        
        crossAxisAlignment: CrossAxisAlignment.end, children: [
        //  favourite icon
      
        Container(
         
          decoration:
              BoxDecoration(color: Colors.grey.shade300, shape: BoxShape.circle),
          child: IconButton(
              onPressed: () => {},
              icon: const Icon(
                Icons.favorite,
                color: Colors.black,
              )),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Deals of the Day
            Expanded(
              flex: 1,
              child: Container(
                width: double.maxFinite,
                height: 200,
                padding: const EdgeInsets.all(20),
                child: Image.network(
                  dealImageUrl,
                
                  fit: BoxFit.cover,
                ),
              ),
            ),
      
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dealCategory,
                    style: AppStyles.normalgrey,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text( "\$$dealPrice", style: AppStyles.normalRed),
                  Text(dealName, style: AppStyles.largeLight),
                  Text(dealDescription, style: AppStyles.smallGrey)
                ],
              ),
            )
      
            // Recomended for you
          ],
        ),
      ]),
    );
  }
}
