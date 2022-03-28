import 'package:get/get.dart';
import 'package:orgamart/model/category.dart';
import 'package:orgamart/model/item.dart';

class Shopping_controller extends GetxController {
  var products = [].obs;
  var trendingproducts = [].obs;
  var allDiscountedProducts = [].obs;
  @override
  void onInit() {
    FetchProducts();
    super.onInit();
  }

  ///oninit
  void FetchProducts() async {
    fetchFromDatabase();
    List<Category> _allProducts = [
      Category(
          name: 'Vegetable',
          items: [
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
              name: 'Pumpkin',
              brand: 'Farmer',
              type: 'Vegetable',
              discount: 0,
              pricePerUnit: 2.5,
              weight: 1,
              packOrBottle: 'package',
              weightType: 'Kg',
              imagePath: 'assets/images/products/vegetable/pumpkin.jpg',
            ),
            Item(
                name: 'Potato',
                brand: 'Farmer',
                type: 'Vegetable',
                discount: 0,
                pricePerUnit: 1.5,
                weight: 500,
                packOrBottle: 'package',
                weightType: 'gm',
                imagePath: 'assets/images/products/vegetable/potato.jpg'),
            Item(
                name: 'Tomato',
                brand: 'Farmer',
                type: 'Vegetable',
                discount: 0,
                pricePerUnit: 2,
                weight: 500,
                packOrBottle: 'package',
                weightType: 'gm',
                imagePath: 'assets/images/products/vegetable/tomato.jpg'),
            Item(
                name: 'Onion',
                brand: 'Farmer',
                type: 'Vegetable',
                discount: 0,
                pricePerUnit: 4,
                weight: 500,
                packOrBottle: 'package',
                weightType: 'gm',
                imagePath: 'assets/images/products/vegetable/onion.jpg'),
            Item(
                name: 'Cucumber',
                brand: 'Farmer',
                type: 'Vegetable',
                discount: 0,
                pricePerUnit: 3,
                weight: 500,
                packOrBottle: 'package',
                weightType: 'gm',
                imagePath: 'assets/images/products/vegetable/cucumber.jpg'),
            Item(
                name: 'Cauliflower',
                brand: 'Farmer',
                type: 'Vegetable',
                discount: 0,
                pricePerUnit: 2.7,
                weight: 1,
                packOrBottle: 'package',
                weightType: 'Kg',
                imagePath: 'assets/images/products/vegetable/cauliflower.jpg'),
          ],
          imagePath: 'assets/images/category/vegetable.jpg'),
      Category(
          name: 'Meat',
          imagePath: 'assets/images/category/meat.jpg',
          items: [
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
                name: 'Mutton Chopped',
                brand: 'Butcher',
                type: 'Meat',
                discount: 0,
                pricePerUnit: 5.5,
                weight: 500,
                packOrBottle: 'package',
                weightType: 'gm',
                imagePath: 'assets/images/products/meat/mutton chopped.jpg'),
            Item(
                name: 'Venison',
                brand: 'Butcher',
                type: 'Meat',
                discount: 0,
                pricePerUnit: 7,
                weight: 500,
                packOrBottle: 'package',
                weightType: 'gm',
                imagePath: 'assets/images/products/meat/venison.jpg'),
            Item(
                name: 'Lamb Chopped',
                brand: 'Butcher',
                type: 'Meat',
                discount: 0,
                pricePerUnit: 7,
                weight: 500,
                packOrBottle: 'package',
                weightType: 'gm',
                imagePath: 'assets/images/products/meat/lamb chop.jpg'),
          ]),
      Category(
          name: 'Egg',
          imagePath: 'assets/images/category/egg.jpg',
          items: [
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
          ]),
      Category(
          name: 'Poultry',
          imagePath: 'assets/images/category/poultry.jpeg',
          items: [
            Item(
                name: 'Chicken',
                brand: 'Farmer',
                type: 'Poultry',
                discount: 0,
                pricePerUnit: 3.5,
                weight: 500,
                packOrBottle: 'package',
                weightType: 'gm',
                imagePath: 'assets/images/products/poultry/chicken.jpeg'),
            Item(
                name: 'Duck Skinned',
                brand: 'Farmer',
                type: 'Poultry',
                discount: 0,
                pricePerUnit: 4.5,
                weight: 500,
                packOrBottle: 'package',
                weightType: 'gm',
                imagePath: 'assets/images/products/poultry/duck skinned.jpg'),
            Item(
                name: 'Geese Skinned',
                brand: 'Farmer',
                type: 'Poultry',
                discount: 0,
                pricePerUnit: 5.5,
                weight: 500,
                packOrBottle: 'package',
                weightType: 'gm',
                imagePath: 'assets/images/products/poultry/geese.jpg'),
            Item(
                name: 'Koel Skinned',
                brand: 'Farmer',
                type: 'Poultry',
                discount: 0,
                pricePerUnit: 2,
                weight: 500,
                packOrBottle: 'package',
                weightType: 'gm',
                imagePath: 'assets/images/products/poultry/koel.jpg'),
          ]),
      Category(
        imagePath: 'assets/images/category/spices.jpg',
        name: 'Spices',
        items: [
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
              name: 'Chilli Powder',
              brand: 'Farmer',
              type: 'Spices',
              discount: 0,
              pricePerUnit: 4.5,
              weight: 100,
              packOrBottle: 'package',
              weightType: 'gm',
              imagePath: 'assets/images/products/spices/chiili powder.jpg'),
          Item(
              name: 'chilli',
              brand: 'Farmer',
              type: 'Spices',
              discount: 0,
              pricePerUnit: 3.5,
              weight: 100,
              packOrBottle: 'package',
              weightType: 'gm',
              imagePath: 'assets/images/products/spices/chilli.jpg'),
          Item(
              name: 'Garlic',
              brand: 'Farmer',
              type: 'Spices',
              discount: 0,
              pricePerUnit: 2,
              weight: 100,
              packOrBottle: 'package',
              weightType: 'gm',
              imagePath: 'assets/images/products/spices/garlic.jpg'),
          Item(
              name: 'Ginger',
              brand: 'Farmer',
              type: 'Spices',
              discount: 0,
              pricePerUnit: 3,
              weight: 100,
              packOrBottle: 'package',
              weightType: 'gm',
              imagePath: 'assets/images/products/spices/ginger.jpg'),
          Item(
              name: 'Salt',
              brand: 'Farmer',
              type: 'Spices',
              discount: 0,
              pricePerUnit: 5,
              weight: 500,
              packOrBottle: 'package',
              weightType: 'gm',
              imagePath: 'assets/images/products/spices/salt.jpg'),
          Item(
              name: 'Turmeric Powder',
              brand: 'Farmer',
              type: 'Spices',
              discount: 0,
              pricePerUnit: 3,
              weight: 100,
              packOrBottle: 'package',
              weightType: 'gm',
              imagePath: 'assets/images/products/spices/turmeric powder.jpg'),
        ],
      ),
      Category(
        imagePath: 'assets/images/category/oil.jpg',
        name: 'Oil',
        items: [
          Item(
              name: 'Coconut Oil',
              brand: 'Farmer',
              type: 'Oil',
              discount: 0,
              pricePerUnit: 12,
              weight: 500,
              packOrBottle: 'package',
              weightType: 'gm',
              imagePath: 'assets/images/products/oil/coconut oil.jpg'),
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
        ],
      ),
      Category(
        imagePath: 'assets/images/category/milk.jpg',
        name: 'Milk',
        items: [
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
              name: 'Cheese',
              brand: 'Farmer',
              type: 'Milk',
              discount: 0,
              pricePerUnit: 3.5,
              weight: 100,
              packOrBottle: 'package',
              weightType: 'gm',
              imagePath: 'assets/images/products/milk/cheese.jpg'),
        ],
      ),
    ];
    var _alltrendingproducts = [
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
    var _discountedProducts = [
      Item(
          name: 'Coconut Oil',
          brand: 'Farmer',
          type: 'Oil',
          discount: 20,
          pricePerUnit: 12,
          weight: 500,
          packOrBottle: 'package',
          weightType: 'gm',
          imagePath: 'assets/images/products/oil/coconut oil.jpg',
          productId: 'cocoil_farmer'),
      Item(
          name: 'Pumpkin',
          brand: 'Farmer',
          type: 'Vegetable',
          discount: 30,
          pricePerUnit: 2.5,
          weight: 1,
          packOrBottle: 'package',
          weightType: 'Kg',
          imagePath: 'assets/images/products/vegetable/pumpkin.jpg',
          productId: 'pumpkin_farmer'),
      Item(
          name: 'Onion',
          brand: 'Farmer',
          type: 'Vegetable',
          discount: 20,
          pricePerUnit: 4,
          weight: 500,
          packOrBottle: 'package',
          weightType: 'gm',
          imagePath: 'assets/images/products/vegetable/onion.jpg',
          productId: 'onion_farmer'),
      Item(
          name: 'Ginger',
          brand: 'Farmer',
          type: 'Spices',
          discount: 0,
          pricePerUnit: 3,
          weight: 100,
          packOrBottle: 'package',
          weightType: 'gm',
          imagePath: 'assets/images/products/spices/ginger.jpg',
          productId: 'Ginger_farmer'),
      Item(
          name: 'Salt',
          brand: 'Farmer',
          type: 'Spices',
          discount: 0,
          pricePerUnit: 5,
          weight: 500,
          packOrBottle: 'package',
          weightType: 'gm',
          imagePath: 'assets/images/products/spices/salt.jpg',
          productId: 'salt_farmer'),
      Item(
          name: 'Turmeric Powder',
          brand: 'Farmer',
          type: 'Spices',
          discount: 0,
          pricePerUnit: 3,
          weight: 100,
          packOrBottle: 'package',
          weightType: 'gm',
          imagePath: 'assets/images/products/spices/turmeric powder.jpg',
          productId: 'tm_farmer'),
      Item(
          name: 'Pumpkin',
          brand: 'Farmer',
          type: 'Vegetable',
          discount: 30,
          pricePerUnit: 2.5,
          weight: 1,
          packOrBottle: 'package',
          weightType: 'Kg',
          imagePath: 'assets/images/products/vegetable/pumpkin.jpg',
          productId: 'pumpkin_farmer'),
      Item(
          name: 'Onion',
          brand: 'Farmer',
          type: 'Vegetable',
          discount: 20,
          pricePerUnit: 4,
          weight: 500,
          packOrBottle: 'package',
          weightType: 'gm',
          imagePath: 'assets/images/products/vegetable/onion.jpg',
          productId: 'onion_farmer'),
      Item(
          name: 'Ginger',
          brand: 'Farmer',
          type: 'Spices',
          discount: 0,
          pricePerUnit: 3,
          weight: 100,
          packOrBottle: 'package',
          weightType: 'gm',
          imagePath: 'assets/images/products/spices/ginger.jpg',
          productId: 'gnger_farmer'),
      Item(
          name: 'Salt',
          brand: 'Farmer',
          type: 'Spices',
          discount: 0,
          pricePerUnit: 5,
          weight: 500,
          packOrBottle: 'package',
          weightType: 'gm',
          imagePath: 'assets/images/products/spices/salt.jpg',
          productId: 'slt_farmer'),
      Item(
          name: 'Turmeric Powder',
          brand: 'Farmer',
          type: 'Spices',
          discount: 0,
          pricePerUnit: 3,
          weight: 100,
          packOrBottle: 'package',
          weightType: 'gm',
          imagePath: 'assets/images/products/spices/turmeric powder.jpg',
          productId: 'tmrc_farmer'),
    ];

    products.value = _allProducts;
    trendingproducts.value = _alltrendingproducts;
    allDiscountedProducts.value = _discountedProducts;
  }

  ///fetch and sav to contrller
  void fetchFromDatabase() {
    print('Products fetched from database');
  }
}

///fetch all products to database
