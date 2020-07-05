import 'package:flutter/material.dart';
import 'package:money_tracker/screens/new_product.dart';
import 'package:money_tracker/screens/category_list.dart';

void main() => runApp(Tracker());

class Tracker extends StatefulWidget {
  @override
  _TrackerState createState() => _TrackerState();
}

class _TrackerState extends State<Tracker> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Money Tracker',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        body: CategoryList(),
      ),
      routes: {
        '/categories': (BuildContext context) => CategoryList(),
        '/new_product': (BuildContext context) => NewProduct()
      },
    );
  }
}
