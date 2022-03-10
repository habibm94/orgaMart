import 'package:orgamart/model/item.dart';

class Category {
  String name;
  List<Item> items;
  String imagePath;
  Category({required this.name, required this.items, required this.imagePath});
}
