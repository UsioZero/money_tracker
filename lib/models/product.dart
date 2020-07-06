import 'package:money_tracker/models/category.dart';

class Product {
  String id;
  String name;
  double prise;
  Category category;
  Product(this.id, this.name, this.prise, this.category);
}
