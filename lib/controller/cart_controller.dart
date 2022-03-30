import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:orgamart/model/item.dart';

class Cart_Controller extends GetxController {
  var cartItems = [].obs;
  var availabeproductId = [];
  late Item userClickedItem;
  var orderoftimes = 1;

  ///use it in ui
  var totalPrice;
  var productweight;
  var totalweight;
  var weightType;
  var price;

  ///use it in ui

  void addtoCart() {
    try {
      userClickedItem.totalItemcount += orderoftimes;
      userClickedItem.totalPrice += totalPrice;
      userClickedItem.totalWeight += totalweight;
      cartItems.add(userClickedItem);
      update();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      print('check add to cart function in cart controller');
      userClickedItem == null
          ? print('crtcntroller userclicked item is null')
          : null;
    }
  }

  void addtoUserClickedItem({required Item item}) {
    userClickedItem = item;
    productweight = userClickedItem.weight;
    totalweight = productweight;
    weightType = userClickedItem.weightType;
    price = (((userClickedItem.pricePerUnit) -
        ((userClickedItem.pricePerUnit) * userClickedItem.discount) / 100));
    totalPrice = price;
  }

  void increaseOrder() {
    orderoftimes += 1;
    totalweight = productweight * orderoftimes;
    totalPrice = price * orderoftimes;
    update();
  }

  void decreaseOrder() {
    orderoftimes -= 1;
    totalPrice = price * orderoftimes;
    totalweight = productweight * orderoftimes;

    update();
  }

  void reset_orderoftimes() {
    orderoftimes = 1;
    totalweight = 0;
    totalPrice = 0;
    productweight = 0;
    price = 0;
    totalPrice = 0;
    update();
  }

  void removeFromCart(int index) {
    cartItems.removeAt(index);
  }

  @override
  void onClose() {
    reset_orderoftimes();
    super.onClose();
  }
}
