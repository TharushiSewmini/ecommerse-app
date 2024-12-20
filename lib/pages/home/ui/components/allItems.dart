import 'package:ecommerce_app/pages/home/ui/components/dealsCard.dart';
import 'package:ecommerce_app/pages/home/ui/components/productCard.dart';
import 'package:ecommerce_app/pages/cart/bloc/cart_bloc.dart';
import 'package:ecommerce_app/model/product_model.dart';
import 'package:ecommerce_app/pages/singleProduct/ui/singleProduct_page.dart';
import 'package:ecommerce_app/utils/AppStyles.dart';
import 'package:ecommerce_app/utils/pageTransition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AllItems extends StatefulWidget {
  final List<Product> products;
  const AllItems({super.key, required this.products});

  @override
  State<AllItems> createState() => _AllItemsState();
}

List<DealsBanner> dealsBanners = [
  DealsBanner(
      dealImageUrl:
          'https://images.pexels.com/photos/3675621/pexels-photo-3675621.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      dealCategory: "Microphones",
      dealPrice: "107.87",
      dealName: "Rode PodMic",
      dealDescription: "Dynamic microphone, Speaker microphone"),
  DealsBanner(
      dealImageUrl:
          'https://images.pexels.com/photos/205926/pexels-photo-205926.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      dealCategory: "Microphones",
      dealPrice: "107.87",
      dealName: "Rode PodMic",
      dealDescription: "Dynamic microphone, Speaker microphone"),
  DealsBanner(
      dealImageUrl:
          'https://images.pexels.com/photos/3394666/pexels-photo-3394666.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      dealCategory: "Microphones",
      dealPrice: "107.87",
      dealName: "Rode PodMic",
      dealDescription: "Dynamic microphone, Speaker microphone")
];

final pages = List.generate(
    dealsBanners.length,
    (index) => DealsCart(
        dealImageUrl: dealsBanners[index].dealImageUrl,
        dealCategory: dealsBanners[index].dealCategory,
        dealPrice: dealsBanners[index].dealPrice,
        dealName: dealsBanners[index].dealName,
        dealDescription: dealsBanners[index].dealDescription));

// page controller
final controller = PageController(viewportFraction: 1, keepPage: true);

class _AllItemsState extends State<AllItems> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.only(top: 20),
        width: double.maxFinite,
        color: Colors.white,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          //  Deals of the day
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Deals of the Day ", style: AppStyles.subHead),
              Text(
                "See all",
                style: AppStyles.smallGrey,
              )
            ],
          ),

          //Deals Banners
          SizedBox(
            width: double.infinity,
            height: 250,
            child: PageView.builder(
                padEnds: false,
                controller: controller,
                itemCount: pages.length,
                itemBuilder: (context, index) => pages[index]),
          ),

          Center(
            child: SmoothPageIndicator(
              axisDirection: Axis.horizontal,
              controller: controller,
              count: pages.length,
              effect: const ExpandingDotsEffect(
                  dotHeight: 4,
                  dotWidth: 16,
                  dotColor: Colors.grey,
                  activeDotColor: Colors.black),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.65,
                  crossAxisSpacing: 10,
                ),
                itemCount: widget.products.length,
                itemBuilder: (context, index) {
                  List<Product> products = widget.products;

                  return InkWell(
                    onTap: () => Navigator.push(
                        context,
                        CustomPageRoute(
                            page: SingleProductPage(
                          category: products[index].category,
                          description: products[index].description,
                          image: products[index].image,
                          price: products[index].price,
                          title: products[index].title,
                          product: products[index],
                        ))),
                    child: ProductCard(
                      id: products[index].id,
                      title: products[index].title,
                      price: products[index].price,
                      description: products[index].description,
                      category: products[index].category,
                      image: products[index].image,
                      onAddCart: () {
                        BlocProvider.of<CartBloc>(context)
                            .add(AddOrUpdateCartEvent(products[index], 1));

                        // showing snacBar

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: AppStyles.secondaryColor,
                            content: Text(
                              "${products[index].title} added to cart",
                              style: AppStyles.extrasmallwhite,
                              textAlign: TextAlign.center,
                            ),
                            duration: const Duration(seconds: 1),
                          ),
                        );
                      },
                    ),
                  );
                }),
          ),
        ]),
      ),
    );
  }
}

// Deals cart
class DealsBanner {
  String dealImageUrl;
  String dealCategory;
  String dealPrice;
  String dealName;
  String dealDescription;

  DealsBanner(
      {required this.dealImageUrl,
      required this.dealCategory,
      required this.dealPrice,
      required this.dealName,
      required this.dealDescription});
}
