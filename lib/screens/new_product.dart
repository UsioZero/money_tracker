import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:money_tracker/models/category.dart';
import 'package:money_tracker/models/product.dart';

class NewProduct extends StatefulWidget {
  final Category category;
  NewProduct(this.category);

  @override
  _NewProductState createState() => _NewProductState(category);
}

class _NewProductState extends State<NewProduct> {
  Category category;
  _NewProductState(this.category);

  TextEditingController _nameController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  String name;
  String price;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[200],
      appBar: AppBar(title: Text('Add to category')),
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
                double doublePrise;
                try {
                  doublePrise = double.parse(price);
                  Navigator.pop(
                      context,
                      Product(DateTime.now().millisecondsSinceEpoch.toString(),
                          name, doublePrise, category));
                } catch (e) {
                  showCupertinoDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CupertinoAlertDialog(
                          title: Text('Wrong name/price'),
                          content: Text(
                              'The text must be not empty.\nThe price must be like 123.45 or 46.'),
                          actions: <Widget>[
                            CupertinoDialogAction(
                              child: Text('Ok'),
                              onPressed: () => Navigator.pop(context),
                            )
                          ],
                        );
                      });
                }
              },
            ),
          ],
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
