import 'package:flutter/material.dart';
import 'package:rest_api_udemy/screens/home.dart';
import 'package:rest_api_udemy/screens/login_page.dart';
import 'package:rest_api_udemy/services/apiSevice.dart';

void main() {
  runApp(MaterialApp(
    title: ("Api Service"),
    home: LogInDetails(),
  ));
}
