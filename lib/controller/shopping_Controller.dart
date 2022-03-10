import 'package:get/get.dart';
import 'package:orgamart/model/category.dart';
import 'package:orgamart/model/item.dart';

class Shopping_controller extends GetxController {
  var products = [].obs;
  @override
  void onInit() {
    FetchProducts();
    super.onInit();
  }

  ///oninit
  void FetchProducts() async {
    fetchFromDatabase();
    var allProducts = await [
      Category(
          name: 'Vegetable',
          items: [
            Item(
              name: 'Brocolli',
              brand: 'Farmer',
              type: 'Vegetable',
              discount: 0,
              pricePerUnit: 2,
              weight: 250,
              packOrBottle: 'package',
              weightType: 'gm',
            ),
            Item(
              name: 'Pumpkin',
              brand: 'Farmer',
              type: 'Vegetable',
              discount: 0,
              pricePerUnit: 2,
              weight: 1,
              packOrBottle: 'package',
              weightType: 'Kg',
            ),
            Item(
              name: 'Potato',
              brand: 'Farmer',
              type: 'Vegetable',
              discount: 0,
              pricePerUnit: 2,
              weight: 250,
              packOrBottle: 'package',
              weightType: 'gm',
            ),
            Item(
              name: 'Tomato',
              brand: 'Farmer',
              type: 'Vegetable',
              discount: 0,
              pricePerUnit: 2,
              weight: 500,
              packOrBottle: 'package',
              weightType: 'gm',
            ),
          ],
          imagePath: 'assets/images/category/vegetable.jpg'),
      Category(
          name: 'Meat',
          imagePath: 'assets/images/category/beef.jpg',
          items: [
            Item(
              name: 'Beef',
              brand: 'Farmer',
              type: 'Vegetable',
              discount: 0,
              pricePerUnit: 2,
              weight: 250,
              packOrBottle: 'package',
              weightType: 'gm',
            ),
            Item(
              name: 'Mutton',
              brand: 'Farmer',
              type: 'Meat',
              discount: 0,
              pricePerUnit: 2,
              weight: 1,
              packOrBottle: 'package',
              weightType: 'Kg',
            ),
            Item(
              name: 'Venison',
              brand: 'Farmer',
              type: 'Meat',
              discount: 0,
              pricePerUnit: 2,
              weight: 250,
              packOrBottle: 'package',
              weightType: 'gm',
            ),
            Item(
              name: 'Beef (Minced)',
              brand: 'Farmer',
              type: 'Meat',
              discount: 0,
              pricePerUnit: 2,
              weight: 500,
              packOrBottle: 'package',
              weightType: 'gm',
            ),
          ]),
      Category(
          name: 'Egg',
          imagePath: 'assets/images/category/egg.jpg',
          items: [
            Item(
              name: 'Brocolli',
              brand: 'Farmer',
              type: 'Vegetable',
              discount: 0,
              pricePerUnit: 2,
              weight: 250,
              packOrBottle: 'package',
              weightType: 'gm',
            ),
            Item(
              name: 'Pumpkin',
              brand: 'Farmer',
              type: 'Vegetable',
              discount: 0,
              pricePerUnit: 2,
              weight: 1,
              packOrBottle: 'package',
              weightType: 'Kg',
            ),
            Item(
              name: 'Potato',
              brand: 'Farmer',
              type: 'Vegetable',
              discount: 0,
              pricePerUnit: 2,
              weight: 250,
              packOrBottle: 'package',
              weightType: 'gm',
            ),
            Item(
              name: 'Tomato',
              brand: 'Farmer',
              type: 'Vegetable',
              discount: 0,
              pricePerUnit: 2,
              weight: 500,
              packOrBottle: 'package',
              weightType: 'gm',
            ),
          ]),
      Category(
          name: 'Poultry',
          imagePath: 'assets/images/category/poultry.jpeg',
          items: [
            Item(
              name: 'Brocolli',
              brand: 'Farmer',
              type: 'Vegetable',
              discount: 0,
              pricePerUnit: 2,
              weight: 250,
              packOrBottle: 'package',
              weightType: 'gm',
            ),
            Item(
              name: 'Pumpkin',
              brand: 'Farmer',
              type: 'Vegetable',
              discount: 0,
              pricePerUnit: 2,
              weight: 1,
              packOrBottle: 'package',
              weightType: 'Kg',
            ),
            Item(
              name: 'Potato',
              brand: 'Farmer',
              type: 'Vegetable',
              discount: 0,
              pricePerUnit: 2,
              weight: 250,
              packOrBottle: 'package',
              weightType: 'gm',
            ),
            Item(
              name: 'Tomato',
              brand: 'Farmer',
              type: 'Vegetable',
              discount: 0,
              pricePerUnit: 2,
              weight: 500,
              packOrBottle: 'package',
              weightType: 'gm',
            ),
          ]),
      Category(
        imagePath: 'assets/images/category/spices.jpg',
        name: 'spices',
        items: [
          Item(
            name: 'Brocolli',
            brand: 'Farmer',
            type: 'Vegetable',
            discount: 0,
            pricePerUnit: 2,
            weight: 250,
            packOrBottle: 'package',
            weightType: 'gm',
          ),
          Item(
            name: 'Pumpkin',
            brand: 'Farmer',
            type: 'Vegetable',
            discount: 0,
            pricePerUnit: 2,
            weight: 1,
            packOrBottle: 'package',
            weightType: 'Kg',
          ),
          Item(
            name: 'Potato',
            brand: 'Farmer',
            type: 'Vegetable',
            discount: 0,
            pricePerUnit: 2,
            weight: 250,
            packOrBottle: 'package',
            weightType: 'gm',
          ),
          Item(
            name: 'Tomato',
            brand: 'Farmer',
            type: 'Vegetable',
            discount: 0,
            pricePerUnit: 2,
            weight: 500,
            packOrBottle: 'package',
            weightType: 'gm',
          ),
        ],
      ),
    ];
    products.value = allProducts;
  }

  ///fetch and sav to contrller
  void fetchFromDatabase() {
    print('Products fetched from database');
  }
}

///fetch all products to database
