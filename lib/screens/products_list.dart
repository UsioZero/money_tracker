import 'package:flutter/material.dart';
import 'package:money_tracker/models/category.dart';
import 'package:money_tracker/models/product.dart';
import 'package:money_tracker/screens/new_product.dart';

class ProductsList extends StatefulWidget {
  final Category category;
  ProductsList(this.category);
  @override
  ProductsListState createState() => ProductsListState(category);
}

class ProductsListState extends State<ProductsList> {
  Category category;
  List<Product> products = [
    Product('1', 'name1', 1),
    Product('2', 'name2', 2),
    Product('3', 'name3', 3),
  ];
  Product newProduct;

  ProductsListState(this.category);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[200],
      appBar: AppBar(
        title: Text(category.name),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, i) {
          return Card(
            elevation: 2,
            margin: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
            child: Container(
              decoration: BoxDecoration(color: Colors.green.withOpacity(0.8)),
              child: ListTile(
                title: Text(
                  products[i].name,
                  style: TextStyle(fontSize: 20),
                ),
                subtitle: Text("prise: ${products[i].prise}"),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          size: 39,
        ),
        onPressed: () async {
          newProduct = await Navigator.push(
              context, MaterialPageRoute(builder: (context) => NewProduct()));
          if (newProduct.name != 'null' && newProduct.prise != -1)
            setState(() {
              products.add(newProduct);
            });
        },
      ),
    );
  }
}
