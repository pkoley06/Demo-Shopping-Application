
import 'package:flutter/material.dart';
import 'package:rest_api_udemy/services/apiSevice.dart';

class ProductDetails extends StatelessWidget {
  int id;
  ProductDetails({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Details"),
        backgroundColor: Colors.redAccent,
      ),
      body: FutureBuilder(
          future: ApiService().getSingleProduct(id),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Image.network(
                        snapshot.data['image'],
                        height: 200,
                        width: double.infinity,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "\$ ${snapshot.data['price'].toString()}",
                        style: const TextStyle(
                            fontSize: 15,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        snapshot.data['title'].toString(),
                        style: const TextStyle(fontSize: 12),
                      ),
                      Chip(
                        label: Text(
                          snapshot.data['category'].toString(),
                          style: const TextStyle(
                              fontSize: 15, color: Colors.white),
                        ),
                        backgroundColor: Colors.red.shade800,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(snapshot.data['description'])
                    ],
                  ),
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.blue,
        child: const Icon(Icons.shopping_cart_checkout),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
