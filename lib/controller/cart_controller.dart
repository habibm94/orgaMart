import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:orgamart/model/item.dart';
import 'package:collection/collection.dart';

class Cart_Controller extends GetxController {
  var cartItems = [].obs;

  late Item? userClickedItem;
  var orderoftimes = 1;
  var totalPrice = 0.0;
  var discountedPrice = 0.0;
  var productweight;
  var totalweight = 0;
  var weightType;
  var price;
  late String itemImage;

  var total_priceofCartItems = 0.0;

  ///use it in ui
  ///add the product in the screen
  void addtoCart() {
    if (cartItems.contains(userClickedItem)) {
      var index = cartItems.indexWhere((element) => element == userClickedItem);
      cartItems[index].totalItemcount += orderoftimes;
      cartItems[index]?.totalPrice += totalPrice;
      cartItems[index]?.totalWeight += totalweight;
    } else {
      userClickedItem?.totalItemcount += orderoftimes;
      userClickedItem?.totalPrice += totalPrice;
      userClickedItem?.totalWeight += totalweight;
      cartItems.add(userClickedItem);
    }
    ;
    counttotalCartValue();
    update();
  }

  void counttotalCartValue() {
    List pricevalues = cartItems.map((item) => item.totalPrice).toList();
    print('${pricevalues}' + ' from beginning');
    var cartsum = 0.0;
    pricevalues.forEach((e) {
      cartsum += e;
    });
    print(cartsum);
    print('total price' + '$totalPrice');
    total_priceofCartItems = cartsum;

    print('total cart value from count funct' + '${total_priceofCartItems}');
    update();
  }

  void removeFromCart(int index) {
    cartItems.removeAt(index);
    counttotalCartValue();
    update();
  }

  ///activates upon clicking the product in main screen
  void addtoUserClickedItem({required Item item}) {
    userClickedItem = item;
    productweight = item.weight;
    weightType = item.weightType;
    price = item.pricePerUnit;
    discountedPrice = item.discounted == true
        ? (((item.pricePerUnit) - ((item.pricePerUnit) * item.discount) / 100))
        : item.pricePerUnit;
    totalPrice = price;
    totalweight = item.weight;
    itemImage = item.imagePath;
  }

  ///increases order
  void increaseOrder() {
    orderoftimes += 1;
    totalweight = productweight * orderoftimes;
    totalPrice = price * orderoftimes;
    update();
  }

  ///decreases order
  void decreaseOrder() {
    orderoftimes -= 1;
    totalweight = productweight * orderoftimes;
    totalPrice = price * orderoftimes;
    update();
  }

  ///reset the cart temporaily after pop up closes
  void reset_temp_CartValues() {
    Future.delayed(Duration(milliseconds: 500), () {
      orderoftimes = 1;
      totalweight = 0;
      totalPrice = 0;
      productweight = 0;
      price = 0;
      totalPrice = 0;
    });
    update();
  }

  ///item get removes from the cart

  ///totally reset the cart
  void resetCart() {
    total_priceofCartItems = 0;
    cartItems.value = [];
    update();
  }
}
