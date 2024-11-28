import 'package:ecommerce_app/components/reusableButton.dart';
import 'package:ecommerce_app/pages/cart/component/cartCard.dart';
import 'package:ecommerce_app/pages/singleProduct/ui/singleProductPage.dart';
import 'package:ecommerce_app/utils/AppStyles.dart';
import 'package:ecommerce_app/utils/pageTransition.dart';
import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

final List<CartProps> items = [
  CartProps(
    itemImageURL:
        'https://images.pexels.com/photos/205926/pexels-photo-205926.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    itemName: 'Wireless Headphones',
    itemPrice: "49.99",
    itemDescription: 'High-quality sound with noise cancellation.',
  ),
  CartProps(
    itemImageURL:
        'https://images.pexels.com/photos/812264/pexels-photo-812264.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    itemName: 'Smart Laptop',
    itemPrice: " 15.99",
    itemDescription: 'Adjustable stand for all smartphones.',
  ),
  CartProps(
    itemImageURL:
        'https://images.pexels.com/photos/1298601/pexels-photo-1298601.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    itemName: 'Gaming Mouse',
    itemPrice: "25.99",
    itemDescription: 'Ergonomic design with customizable buttons.',
  ),
  CartProps(
    itemImageURL:
        'https://images.pexels.com/photos/51383/photo-camera-subject-photographer-51383.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    itemName: 'USB-C Charger',
    itemPrice: " 19.99",
    itemDescription: 'Fast charging for USB-C compatible devices.',
  ),
  CartProps(
    itemImageURL:
        'https://images.pexels.com/photos/205926/pexels-photo-205926.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    itemName: 'Wireless Headphones',
    itemPrice: "49.99",
    itemDescription: 'High-quality sound with noise cancellation.',
  ),
  CartProps(
    itemImageURL:
        'https://images.pexels.com/photos/812264/pexels-photo-812264.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    itemName: 'Smart Laptop',
    itemPrice: " 15.99",
    itemDescription: 'Adjustable stand for all smartphones.',
  ),
  CartProps(
    itemImageURL:
        'https://images.pexels.com/photos/1298601/pexels-photo-1298601.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    itemName: 'Gaming Mouse',
    itemPrice: "25.99",
    itemDescription: 'Ergonomic design with customizable buttons.',
  ),
  CartProps(
    itemImageURL:
        'https://images.pexels.com/photos/51383/photo-camera-subject-photographer-51383.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    itemName: 'USB-C Charger',
    itemPrice: " 19.99",
    itemDescription: 'Fast charging for USB-C compatible devices.',
  ),
  CartProps(
    itemImageURL:
        'https://images.pexels.com/photos/205926/pexels-photo-205926.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    itemName: 'Wireless Headphones',
    itemPrice: "49.99",
    itemDescription: 'High-quality sound with noise cancellation.',
  ),
  CartProps(
    itemImageURL:
        'https://images.pexels.com/photos/812264/pexels-photo-812264.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    itemName: 'Smart Laptop',
    itemPrice: " 15.99",
    itemDescription: 'Adjustable stand for all smartphones.',
  ),
  CartProps(
    itemImageURL:
        'https://images.pexels.com/photos/1298601/pexels-photo-1298601.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    itemName: 'Gaming Mouse',
    itemPrice: "25.99",
    itemDescription: 'Ergonomic design with customizable buttons.',
  ),
  CartProps(
    itemImageURL:
        'https://images.pexels.com/photos/51383/photo-camera-subject-photographer-51383.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    itemName: 'USB-C Charger',
    itemPrice: " 19.99",
    itemDescription: 'Fast charging for USB-C compatible devices.',
  ),
];

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'CART',
            style: AppStyles.normalLight,
          ),
          centerTitle: true,
          elevation: 0,
          scrolledUnderElevation: 0,
          backgroundColor: Colors.white,
        ),
        backgroundColor: Colors.white,
        body:  ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) => Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: GestureDetector(
                    onTap: () => Navigator.push(context,
                        CustomPageRoute(page: SingleProductPage())),
                    child: CartCard(
                        itemImageuRL: items[index].itemImageURL,
                        itemName: items[index].itemName,
                        itemPrice: items[index].itemPrice,
                        itemDescription: items[index].itemDescription),
                  ),
                )),
        bottomNavigationBar: Container(
          height: 120,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          width: double.maxFinite,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Shipping",
                        style: AppStyles.smallGrey,
                      ),
                      Text(
                        "\$ 43.00",
                        style: AppStyles.smallGrey,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total",
                        style: AppStyles.medium,
                      ),
                      Text(
                        "\$ 234.00",
                        style: AppStyles.medium,
                      ),
                    ],
                  )
                ],
              ),
              ReusableButton(ButttonText: "Checkout", onClick: () {}),
              Row(
                children: [],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CartProps {
  String itemImageURL;
  String itemName;
  String itemPrice;
  String itemDescription;

  CartProps(
      {required this.itemImageURL,
      required this.itemName,
      required this.itemPrice,
      required this.itemDescription});
}
