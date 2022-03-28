import 'package:get/get.dart';
import 'package:orgamart/model/item.dart';

class User_Controller extends GetxController {
  RxString? userimage = 'assets/images/user/user.jpg'.obs;
  RxString? username = 'Waifu'.obs;
  var recentPurchases = [].obs;
  @override
  void onInit() {
    var userPurchase = [
      Item(
          name: 'Brocolli',
          brand: 'Farmer',
          type: 'Vegetable',
          discount: 0,
          pricePerUnit: 3,
          weight: 250,
          packOrBottle: 'package',
          weightType: 'gm',
          imagePath: 'assets/images/products/vegetable/brocolli.jpg'),
      Item(
          name: 'Milk Liquid',
          brand: 'Farmer',
          type: 'Milk',
          discount: 0,
          pricePerUnit: 5,
          weight: 500,
          packOrBottle: 'package',
          weightType: 'ml',
          imagePath: 'assets/images/products/milk/liquid milk.jpg'),
      Item(
          name: 'Milk Non-Fat',
          brand: 'Farmer',
          type: 'Milk',
          discount: 0,
          pricePerUnit: 14.5,
          weight: 500,
          packOrBottle: 'package',
          weightType: 'gm',
          imagePath: 'assets/images/products/milk/cheese.jpg'),
      Item(
          name: 'Beef',
          brand: 'Butcher',
          type: 'Vegetable',
          discount: 0,
          pricePerUnit: 4,
          weight: 500,
          packOrBottle: 'package',
          weightType: 'gm',
          imagePath: 'assets/images/products/meat/beef.jpg'),
      Item(
          name: 'Chicken',
          brand: 'Farmer',
          type: 'Egg',
          discount: 0,
          pricePerUnit: 4.5,
          weight: 1,
          packOrBottle: 'Box',
          weightType: 'box(12)',
          imagePath: 'assets/images/products/egg/chicken egg.jpg'),
      Item(
          name: 'Black pepper',
          brand: 'Farmer',
          type: 'Spices',
          discount: 0,
          pricePerUnit: 10,
          weight: 100,
          packOrBottle: 'package',
          weightType: 'gm',
          imagePath: 'assets/images/products/spices/black pepper.jpg'),
      Item(
          name: 'Olive Oil',
          brand: 'Farmer',
          type: 'Oil',
          discount: 0,
          pricePerUnit: 14.5,
          weight: 500,
          packOrBottle: 'package',
          weightType: 'gm',
          imagePath: 'assets/images/products/oil/olive oil.jpg'),
      Item(
          name: 'Soybean Oil',
          brand: 'Farmer',
          type: 'Oil',
          discount: 0,
          pricePerUnit: 3.5,
          weight: 100,
          packOrBottle: 'package',
          weightType: 'gm',
          imagePath: 'assets/images/products/oil/soybean oil.jpg'),
    ];
    recentPurchases.value = userPurchase;
    super.onInit();
  }
}
