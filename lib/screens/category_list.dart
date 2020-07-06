import 'package:flutter/material.dart';
import 'package:money_tracker/models/category.dart';
import 'package:money_tracker/models/product.dart';
import 'package:money_tracker/screens/products_list.dart';

class CategoryList extends StatefulWidget {
  @override
  CategoryListState createState() => CategoryListState();
}

class CategoryListState extends State<CategoryList> {
  int _selectedIndex = 0;
  List<Category> categories;

  CategoryListState() {
    categories = [
      Category('1', 'name1', []),
      Category('2', 'name2', []),
      Category('3', 'name3', []),
    ];
  }

  void newProduct(String id, Product product) {
    setState(() {
      categories
          .firstWhere((element) => element.id == id)
          .products
          .add(product);
    });
  }

  void onDismissed(String catId, String prodId) {
    setState(() {
      categories
          .firstWhere((element) => element.id == catId)
          .products
          .removeWhere((element) => element.id == prodId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[200],
      appBar: AppBar(
        title: Text('Tracker Category'),
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, i) {
          return Card(
            elevation: 2,
            margin: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
            child: Container(
              decoration: BoxDecoration(color: Colors.green.withOpacity(0.7)),
              child: ListTile(
                title: Text(
                  categories[i].name,
                  style: TextStyle(fontSize: 25),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductsList(
                            categories[i], newProduct, onDismissed),
                      ));
                },
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.search), title: Text('Categories')),
          BottomNavigationBarItem(
              icon: Icon(Icons.list), title: Text('History'))
        ],
        currentIndex: _selectedIndex,
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
      ),
    );
  }
}
