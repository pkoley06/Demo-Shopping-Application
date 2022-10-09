import 'dart:convert' show json;

import 'package:http/http.dart' as http;

class ApiService {
  Future getAllPost() async {
    final allProductUrl = Uri.parse('https://fakestoreapi.com/products');
    final response = await http.get(allProductUrl);
    print(response.statusCode);
    print(response.body);
    return json.decode(response.body);
  }

  Future getSingleProduct(int id) async {
    final singleProductUrl = Uri.parse('https://fakestoreapi.com/products/$id');
    final response = await http.get(singleProductUrl);
    print(response.statusCode);
    print(response.body);
    return json.decode(response.body);
  }

  Future getCategories() async {
    final categoriesUrl =
        Uri.parse('https://fakestoreapi.com/products/categories');
    final response = await http.get(categoriesUrl);
    print(response.statusCode);
    print(response.body);
    return json.decode(response.body);
  }

  Future getProductByCategory(String cgName) async {
    final fetchProductCategory =
        Uri.parse('https://fakestoreapi.com/products/category/$cgName');
    final response = await http.get(fetchProductCategory);
    print(response.statusCode);
    print(response.body);
    return json.decode(response.body);
  }
}
