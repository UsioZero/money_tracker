import 'package:money_tracker/models/product.dart';

class Category {
  String id;
  String name;
  List<Product> products;
  Category(this.id, this.name, List list, {this.products});
}
