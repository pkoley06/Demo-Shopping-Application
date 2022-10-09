import 'package:flutter/material.dart';
import 'package:rest_api_udemy/services/apiSevice.dart';

import 'category_details.dart';

class AllCategory extends StatelessWidget {
  const AllCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Category"),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: ApiService().getCategories(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProductByCategory(
                                    categoryName: snapshot.data[index])));
                      },
                      child: Card(
                        color: Colors.amber.shade800,
                        elevation: 2,
                        margin: const EdgeInsets.all(10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          child: Center(
                            child: Text(
                              snapshot.data[index].toString().toUpperCase(),
                              style: const TextStyle(fontSize: 25),
                            ),
                          ),
                        ),
                      ),
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
