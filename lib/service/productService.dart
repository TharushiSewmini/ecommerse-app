import 'dart:convert';
import 'package:ecommerce_app/model/product_model.dart';
import 'package:http/http.dart' as http;

class ProductService {
  final String baseUrl = "https://fakestoreapi.com/products";

// fetch all products
  Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load products");
    }
  }


// fetch all products by category
  Future<List<Product>> fetchSepearetCategoriesProducts(String category) async {
    String url = baseUrl + (category.isNotEmpty ? "/category/$category" : "");
    final resonse = await http.get(Uri.parse(url));
    if (resonse.statusCode == 200) {
      final List<dynamic> data = jsonDecode(resonse.body);
      return data.map((Json) => Product.fromJson(Json)).toList();
    } else {
      throw Exception("Failed to fetch data");
    }
  }
}
