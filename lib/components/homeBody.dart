import 'package:ecommerce_app/components/dealsCard.dart';
import 'package:ecommerce_app/components/productCard.dart';
import 'package:ecommerce_app/utils/AppStyles.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

List<DealsBanner> dealsBanners = [
  DealsBanner(
      dealImageUrl: 'assets/deals.png',
      dealCategory: "Microphones",
      dealPrice: "107.87",
      dealName: "Rode PodMic",
      dealDescription: "Dynamic microphone, Speaker microphone"),
  DealsBanner(
      dealImageUrl: 'assets/earphone.png',
      dealCategory: "Microphones",
      dealPrice: "107.87",
      dealName: "Rode PodMic",
      dealDescription: "Dynamic microphone, Speaker microphone"),
  DealsBanner(
      dealImageUrl: 'assets/headset.png',
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

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(top: 20),
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
          Container(
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
              itemCount: 10,
              itemBuilder: (context, index) => const ProductCard(),
            ),
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
