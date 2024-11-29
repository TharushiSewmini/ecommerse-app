import 'package:ecommerce_app/utils/AppStyles.dart';
import 'package:flutter/material.dart';

class SingleProductPage extends StatelessWidget {
  String title;
  String image;
  double price;
  String category;
  String description;
  SingleProductPage(
      {super.key,
      required this.category,
      required this.description,
      required this.image,
      required this.price,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          title,
          style: AppStyles.largeLight20,
        ),
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              // image
              Stack(children: [
                Container(
                  height: 350,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.transparent, width: 1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: Column(
                    children: [
                      Container(
                        height: 36,
                        width: 36,
                        decoration: const BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                        child: IconButton(
                            onPressed: () => {},
                            icon: const Icon(
                              Icons.favorite,
                              size: 18,
                              color: Colors.black,
                            )),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Container(
                        height: 36,
                        width: 36,
                        decoration: const BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                        child: IconButton(
                            onPressed: () => {},
                            icon: const Icon(
                              Icons.shopping_cart_outlined,
                              size: 18,
                              color: Colors.black,
                            )),
                      ),
                    ],
                  ),
                ),
              ]),

              // description
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Price
                    Text(
                      "\$ " + price.toString(),
                      style: AppStyles.largeBold,
                    ),

                    Text(
                      category,
                      style: AppStyles.largeSemiBold20,
                    ),
                    Text(
                      "Model: WH-1000XM4, Black",
                      style: AppStyles.smallGrey,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      description,
                      style: AppStyles.smallGrey,
                    )
                    // Brand

                    //
                  ],
                ),
              )

              // more
            ],
          ),
        ),
      ),
    );
  }
}
