import 'package:ecommerce_app/components/commanAppBar.dart';
import 'package:ecommerce_app/pages/browseProducts/components/browsedCard.dart';
import 'package:ecommerce_app/pages/singleProduct/ui/singleProductPage.dart';
import 'package:ecommerce_app/utils/AppStyles.dart';
import 'package:ecommerce_app/utils/pageTransition.dart';
import 'package:flutter/material.dart';

class BrowseProducts extends StatefulWidget {
  const BrowseProducts({super.key});

  @override
  State<BrowseProducts> createState() => _BrowseProductsState();
}

final List<BrowseProductProps> items = [
  BrowseProductProps(
    itemImageURL:
        'https://images.pexels.com/photos/205926/pexels-photo-205926.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    itemName: 'Wireless Headphones',
    itemPrice: "49.99",
    itemDescription: 'High-quality sound with noise cancellation.',
  ),
  BrowseProductProps(
    itemImageURL:
        'https://images.pexels.com/photos/812264/pexels-photo-812264.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    itemName: 'Smart Laptop',
    itemPrice: " 15.99",
    itemDescription: 'Adjustable stand for all smartphones.',
  ),
  BrowseProductProps(
    itemImageURL:
        'https://images.pexels.com/photos/1298601/pexels-photo-1298601.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    itemName: 'Gaming Mouse',
    itemPrice: "25.99",
    itemDescription: 'Ergonomic design with customizable buttons.',
  ),
];

class _BrowseProductsState extends State<BrowseProducts> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Scaffold(
          body: Column(
            children: [
              // Search field
              SizedBox(
                height: 56,
                width: double.maxFinite,
                child: TextField(
                    decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.search,
                          color: Colors.grey.shade500,
                          size: 30,
                        ),
                        labelText: "Search",
                        labelStyle: AppStyles.largeSemiBoldGrey20,
                        focusColor: Colors.grey.shade200,
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: Colors.transparent)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: Colors.transparent)))),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) => Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          child: InkWell(
                            onTap: () => Navigator.push(
                              context,
                             CustomPageRoute(page: SingleProductPage())
                            ),
                            child: BrowseCard(
                                itemImageuRL: items[index].itemImageURL,
                                itemName: items[index].itemName,
                                itemPrice: items[index].itemPrice,
                                itemDescription: items[index].itemDescription),
                          ),
                        )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BrowseProductProps {
  String itemImageURL;
  String itemName;
  String itemPrice;
  String itemDescription;

  BrowseProductProps(
      {required this.itemImageURL,
      required this.itemName,
      required this.itemPrice,
      required this.itemDescription});
}
