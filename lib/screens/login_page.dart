import 'package:flutter/material.dart';
import 'package:rest_api_udemy/screens/home.dart';
import 'package:rest_api_udemy/services/apiSevice.dart';

class LogInDetails extends StatelessWidget {
  TextEditingController nameController =
      TextEditingController(text: "mor_2314");
  TextEditingController passwordController =
      TextEditingController(text: "83r5^_");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Screen"),
        centerTitle: true,
        backgroundColor: Colors.cyanAccent,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "UserName",
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Password",
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              child: ElevatedButton(
                child: const Text("Login"),
                onPressed: () async {
                  final getToken = await ApiService()
                      .logInUser(nameController.text, passwordController.text);

                  try {
                    if (getToken['token'] != null) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Login Successfully"),
                        backgroundColor: Colors.green,
                      ));
                      Future.delayed(Duration(seconds: 1), () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => HomePage())));
                      });
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Incorrect credential!"),
                        backgroundColor: Colors.red,
                      ));
                    }
                  } catch (e) {
                    print(e);
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
