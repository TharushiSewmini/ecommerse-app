import 'package:ecommerce_app/utils/AppStyles.dart';
import 'package:flutter/material.dart';

class SingleProductPage extends StatelessWidget {
  const SingleProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Head Phone',
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
                      "https://images.pexels.com/photos/51383/photo-camera-subject-photographer-51383.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
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
                      "\$349.99",
                      style: AppStyles.largeBold,
                    ),

                    Text(
                      "SONY Premium Wireless Headphones",
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
                      "The technology with two noise sensors and two microphones on each ear cup detects ambient noise and sends the data to the HD noise minimization processor QN1. Using a new algorithm, the QN1 then processes and minimizes noise for different acoustic environments in real time. Together with a new Bluetooth Audio SoC ",
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
