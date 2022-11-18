import 'package:flutter/material.dart';
import 'package:rest_api_udemy/screens/product_details.dart';
import 'package:rest_api_udemy/services/apiSevice.dart';

class ProductByCategory extends StatelessWidget {
  final String categoryName;
  const ProductByCategory({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName.toUpperCase()),
      ),
      body: FutureBuilder(
          future: ApiService().getProductByCategory(categoryName),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(snapshot.data[index]['title']),
                      leading: Image.network(
                        snapshot.data[index]['image'],
                        width: 80,
                        height: 60,
                      ),
                      subtitle:
                          Text('price -\$ ${snapshot.data[index]['price']}'),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => ProductDetails(
                                      id: snapshot.data[index]['id'],
                                    ))));
                      },
                    );
                  });
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
