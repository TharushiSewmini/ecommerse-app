import 'package:ecommerce_app/components/reusable_textfield.dart';
import 'package:ecommerce_app/pages/browseProducts/components/browsedCard.dart';
import 'package:ecommerce_app/pages/singleProduct/ui/singleProduct_page.dart';
import 'package:ecommerce_app/utils/AppStyles.dart';
import 'package:ecommerce_app/utils/pageTransition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce_app/pages/home/bloc/home_bloc.dart';

class BrowseProducts extends StatefulWidget {
  const BrowseProducts({super.key});

  @override
  State<BrowseProducts> createState() => _BrowseProductsState();
}

class _BrowseProductsState extends State<BrowseProducts> {
  TextEditingController searchController = TextEditingController();

  List<dynamic> filteredProducts = [];
  List<dynamic> allProducts = [];

  @override
  void initState() {
    super.initState();
    searchController.addListener(_filterProducts);
  }

  @override
  void dispose() {
    searchController.removeListener(_filterProducts);
    searchController.dispose();
    super.dispose();
  }

  void _filterProducts() {
    final query = searchController.text.toLowerCase();
    setState(() {
      filteredProducts = allProducts
          .where((product) => product.title.toLowerCase().contains(query))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeErrorState) {
            return Center(
              child: Text(
                "ERROR OCCURED",
                style: AppStyles.medium,
              ),
            );
          } else if (state is HomeLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is HomeLoadingSuccessRate) {
            if (allProducts.isEmpty) {
              allProducts = state.products;
              filteredProducts = allProducts;
            }

            return Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    // Search Field
                    ReusableTextField(
                      controller: searchController,
                      placeHolderText: "Search",
                      isIconShow: true,
                    ),
                    const SizedBox(height: 20),
                    // Filter List
                    Expanded(
                      child: filteredProducts.isEmpty
                          ? Center(
                              child: Text(
                                "No products found.",
                                style: AppStyles.medium,
                              ),
                            )
                          : ListView.builder(
                              itemCount: filteredProducts.length,
                              itemBuilder: (context, index) {
                                final product = filteredProducts[index];
                                return Container(
                                  margin: const EdgeInsets.only(bottom: 10),
                                  child: InkWell(
                                    onTap: () => Navigator.push(
                                      context,
                                      CustomPageRoute(
                                        page: SingleProductPage(
                                          product: product,
                                          category: product.title,
                                          description: product.description,
                                          image: product.image,
                                          price: product.price,
                                          title: product.title,
                                        ),
                                      ),
                                    ),
                                    child: BrowseCard(
                                      itemImageuRL: product.image,
                                      itemName: product.title,
                                      itemPrice: product.price,
                                      itemDescription: product.description,
                                    ),
                                  ),
                                );
                              },
                            ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const Center(child: Text("Unexpected Error."));
          }
        },
      ),
    );
  }
}
