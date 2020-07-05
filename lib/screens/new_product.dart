import 'package:flutter/material.dart';
import 'package:money_tracker/models/product.dart';

class NewProduct extends StatefulWidget {
  @override
  _NewProductState createState() => _NewProductState();
}

class _NewProductState extends State<NewProduct> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  String name;
  String price;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.green[200],
        appBar: AppBar(
          title: Text('Add to category'),
          leading: Text('123'),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              setProductName(),
              setProductprice(),
              RaisedButton(
                child: Text(
                  'Add',
                  style: TextStyle(fontSize: 20),
                ),
                color: Colors.green,
                onPressed: () {
                  name = _nameController.text;
                  price = _priceController.text;
                  _nameController.clear();
                  _priceController.clear();
                  Navigator.pop(
                      context,
                      Product(DateTime.now().millisecondsSinceEpoch.toString(),
                          name, double.parse(price)));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column setProductName() {
    return Column(
      children: <Widget>[
        Text(
          'Name',
          style: TextStyle(fontSize: 34, fontWeight: FontWeight.w300),
        ),
        TextField(
          controller: _nameController,
          style: TextStyle(
            fontSize: 17,
            color: Colors.black,
          ),
          decoration: InputDecoration(
            hintStyle: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.black38),
            hintText: 'write a name here',
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 3)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black54, width: 1)),
          ),
        ),
      ],
    );
  }

  Column setProductprice() {
    return Column(
      children: <Widget>[
        Text(
          'price',
          style: TextStyle(fontSize: 34, fontWeight: FontWeight.w300),
        ),
        TextField(
          controller: _priceController,
          style: TextStyle(
            fontSize: 17,
            color: Colors.black,
          ),
          decoration: InputDecoration(
            hintStyle: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.black38),
            hintText: 'write price here',
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 3)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black54, width: 1)),
          ),
        ),
      ],
    );
  }
}
