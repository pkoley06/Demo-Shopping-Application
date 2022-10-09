import 'package:flutter/material.dart';
import 'package:rest_api_udemy/screens/all_Category.dart';
import 'package:rest_api_udemy/screens/product_details.dart';
import 'package:rest_api_udemy/services/apiSevice.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          title: const Text("Fake Store"),
          backgroundColor: Colors.redAccent,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AllCategory()));
                },
                icon: const Icon(Icons.menu))
          ],
        ),
        body: FutureBuilder(
            future: ApiService().getAllPost(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(snapshot.data[index]['title']),
                      leading: Image.network(
                        snapshot.data[index]['image'],
                        width: 50,
                        height: 30,
                      ),
                      subtitle:
                          Text("price -\$${snapshot.data[index]["price"]}"),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProductDetails(
                                    id: snapshot.data[index]["id"])));
                      },
                    );
                  },
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            }));
  }
}
