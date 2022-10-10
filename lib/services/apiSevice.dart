import 'dart:convert' show json;

import 'package:http/http.dart' as http;

class ApiService {
  //GET REQUEST

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

  Future getCart(String userId) async {
    final cartDetailsUrl = Uri.parse('https://fakestoreapi.com/carts/$userId');
    final response = await http.get(cartDetailsUrl);
    print(response.statusCode);
    print(response.body);
    return json.decode(response.body);
  }

//POST REQUEST

  Future logInUser(String username, String password) async {
    final loginUrl = Uri.parse("https://fakestoreapi.com/auth/login");
    final response = await http
        .post(loginUrl, body: {'username': username, 'password': password});
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    }
    return response.body;
  }
}
