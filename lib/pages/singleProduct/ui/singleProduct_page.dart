import 'package:ecommerce_app/model/product_model.dart';
import 'package:ecommerce_app/pages/cart/bloc/cart_bloc.dart';
import 'package:ecommerce_app/utils/AppStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SingleProductPage extends StatelessWidget {
  Product? product;
  String title;
  String image;
  double price;
  String category;
  String description;
  SingleProductPage(
      {super.key,
      this.product,
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
          style: AppStyles.normalLight,
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
                  height: MediaQuery.of(context).size.height * 0.6,
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
                      const SizedBox(
                        height: 6,
                      ),
                      Container(
                        height: 36,
                        width: 36,
                        decoration: const BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                        child: IconButton(
                            onPressed: () => {
                                  BlocProvider.of<CartBloc>(context)
                                      .add(AddOrUpdateCartEvent(product!, 1)),
                                  // showing snacBar

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      backgroundColor: AppStyles.secondaryColor,
                                      content: Text(
                                        "${product!.title} added to cart",
                                        style: AppStyles.extrasmallwhite,
                                        textAlign: TextAlign.center,
                                      ),
                                      duration: Duration(seconds: 1),
                                    ),
                                  )
                                },
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
                padding: const EdgeInsets.only(top: 20),
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
                    const SizedBox(
                      height: 6,
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
