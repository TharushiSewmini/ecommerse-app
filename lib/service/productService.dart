import 'dart:convert';
import 'package:ecommerce_app/pages/home/model/product_model.dart';
import 'package:http/http.dart' as http;

class ProductService {
  final String baseUrl = "https://fakestoreapi.com/products";

  Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      print("data"+ data.toString());
      return data.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load products");
    }
  }
}
