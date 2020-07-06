import 'package:flutter/material.dart';
import 'package:money_tracker/models/category.dart';
import 'package:money_tracker/models/product.dart';
import 'package:money_tracker/screens/new_product.dart';

class ProductsList extends StatefulWidget {
  final Category category;
  final Function(String, Product) newProduct;
  final Function(String, String) onDismissed;

  ProductsList(this.category, this.newProduct, this.onDismissed);
  @override
  ProductsListState createState() =>
      ProductsListState(category, newProduct, onDismissed);
}

class ProductsListState extends State<ProductsList> {
  Category category;
  Function(String, Product) newProduct;
  Function(String, String) onDismissed;

  ProductsListState(this.category, this.newProduct, this.onDismissed) {
    if (category.products == null)
      category.products = [
        Product('1', 'name1', 1, category),
        Product('2', 'name2', 2, category),
        Product('3', 'name3', 3, category),
      ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[200],
      appBar: AppBar(
        title: Text(category.name),
      ),
      body: ListView.builder(
        itemCount: category.products.length,
        itemBuilder: (context, i) {
          return Dismissible(
            key: ValueKey(category.products[i].id),
            background: Container(
              color: Colors.red,
            ),
            child: Card(
              elevation: 2,
              margin: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
              child: Container(
                decoration: BoxDecoration(color: Colors.green.withOpacity(0.8)),
                child: ListTile(
                  title: Text(
                    category.products[i].name,
                    style: TextStyle(fontSize: 20),
                  ),
                  subtitle: Text("prise: ${category.products[i].prise}"),
                ),
              ),
            ),
            onDismissed: (direction) {
              onDismissed(category.id, category.products[i].id);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          size: 39,
        ),
        onPressed: () async {
          var product = await Navigator.push(context,
              MaterialPageRoute(builder: (context) => NewProduct(category)));
          if (product != null) newProduct(category.id, product);
          setState(() {});
        },
      ),
    );
  }
}
