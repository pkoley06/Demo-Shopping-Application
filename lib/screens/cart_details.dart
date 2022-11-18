import 'package:flutter/material.dart';
import 'package:rest_api_udemy/services/apiSevice.dart';

class CartDetails extends StatelessWidget {
  const CartDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Cart"),
        backgroundColor: Colors.cyan,
      ),
      body: FutureBuilder(
        future: ApiService().getCart('1'),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            List products = snapshot.data['products'];
            return ListView.builder(
                itemCount: products.length,
                itemBuilder: ((context, index) {
                  return FutureBuilder(
                      future: ApiService()
                          .getSingleProduct(products[index]['productId']),
                      builder: ((context, AsyncSnapshot asyncSnapshot) {
                        if (asyncSnapshot.hasData) {
                          return ListTile(
                            title: Text(asyncSnapshot.data['title']),
                            leading: Image.network(
                              asyncSnapshot.data['image'],
                              height: 60,
                              width: 80,
                            ),
                            subtitle: Text(
                                "Quantity - ${products[index]['quantity'].toString()}"),
                            trailing: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                )),
                          );
                        }
                        return const LinearProgressIndicator();
                      }));
                }));
          }
          return const LinearProgressIndicator();
        },
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 30,
        color: Colors.greenAccent,
        child: Center(child: const Text("Order Now")),
      ),
    );
  }
}
