import 'package:flutter/material.dart';
import 'package:app_desing/routes/routes_page.dart';
import 'package:app_desing/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: getAplicationsRoutes(),
    );
  }
}
