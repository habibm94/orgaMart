import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:orgamart/model/item.dart';
import 'package:collection/collection.dart';

class Cart_Controller extends GetxController {
  List<Item> cartItems = [];
  double cartItemPrice = 0.0;
  late Item? userClickedItem;
  var orderoftimes = 1;
  var totalPrice = 0.0;
  var price_aftercheckingDiscount = 0.0;
  var productweight;
  var totalweight = 0;
  var weightType;
  var price;
  late String itemImage;

  var total_priceofCartItems = 0.0;

  ///importsnt- current value of all cart items

  ///use it in ui
  ///add the product in the screen
  void addtoCart() {
    if (cartItems.contains(userClickedItem)) {
      var index = cartItems.indexWhere((element) => element == userClickedItem);
      cartItems[index].totalItemcount += orderoftimes;
      cartItems[index].totalPrice += totalPrice;
      cartItems[index].totalWeight += totalweight;
    } else {
      userClickedItem?.totalItemcount += orderoftimes;
      userClickedItem?.totalPrice += totalPrice;
      userClickedItem?.totalWeight += totalweight;
      userClickedItem?.itemPrice_incart = cartItemPrice;
      cartItems.add(userClickedItem!);
    }
    ;
    counttotalCartValue();
    update();
  }

  ///edit ordercount
  void edit_increaseorder({required int index}) {
    cartItems[index].totalItemcount += 1;
    cartItems[index].totalWeight =
        (cartItems[index].weight * cartItems[index].totalItemcount).toDouble();
    cartItems[index].totalPrice =
        (cartItems[index].totalItemcount * cartItems[index].itemPrice_incart!);

    counttotalCartValue();

    update();
  }

  void edit_decreaseorder({required int index}) {
    cartItems[index].totalItemcount == 1
        ? null
        : cartItems[index].totalItemcount -= 1;
    cartItems[index].totalWeight =
        (cartItems[index].weight * cartItems[index].totalItemcount).toDouble();
    cartItems[index].totalPrice =
        cartItems[index].totalItemcount * cartItems[index].itemPrice_incart!;
    counttotalCartValue();
    update();
  }

  void counttotalCartValue() {
    List pricevalues = cartItems.map((item) => item.totalPrice).toList();

    var cartsum = 0.0;
    pricevalues.forEach((e) {
      cartsum += e;
    });
    total_priceofCartItems = cartsum;

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
    price = item.initial_pricePerUnit;
    price_aftercheckingDiscount = (item.discount > 0
        ? (((price)! - ((price)! * item.discount) / 100))
        : price)!;
    cartItemPrice = price_aftercheckingDiscount;
    totalPrice = price_aftercheckingDiscount;
    totalweight = item.weight;
    itemImage = item.imagePath;
  }

  ///increases order
  void increaseOrder() {
    orderoftimes += 1;
    totalweight = productweight * orderoftimes;
    totalPrice = price_aftercheckingDiscount * orderoftimes;
    update();
  }

  ///decreases order
  void decreaseOrder() {
    orderoftimes -= 1;
    totalweight = productweight * orderoftimes;
    totalPrice = price_aftercheckingDiscount * orderoftimes;
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
    cartItems = [];
    update();
  }
}
