import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';
import 'package:orgamart/model/item.dart';

class Cart_Controller extends GetxController {
  List<Item> cartItems = [];
  var totalPrice = 0.0;

  ///coupon section---
  double appliedCoupon = 0.0;
  String couponCode = '';
  bool couponapplied = false;
  var deliveryfee = 10.0;
  var amounttoPay_final = 0.0;
  var totalpriceAfterCoupon = 0.0;
  bool isCouponValid = true;
  Map<String, double> coupons = {
    '20%': 20.0,
    'welcome': 30.0,
    'champion30': 30
  };

  double cartItemPrice = 0.0;
  late Item? userClickedItem;
  var orderoftimes = 1;

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

  ///edit ordercount in cart screen
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
    amounttoPay_final = total_priceofCartItems + deliveryfee;

    update();
  }

  void removeFromCart(int index) {
    cartItems.removeAt(index);
    counttotalCartValue();
    update();
  }

  ///activates upon clicking the product in main screen--alert dialouge

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

  ///reset the cart of temporary items after pop up closes
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
    couponapplied = false;
    couponCode = '';
    amounttoPay_final = 0.0;
    totalPrice = 0.0;
    totalpriceAfterCoupon = 0.0;
    isCouponValid = true;
    couponEditing_TextController.text = '';
    update();
  }

  void calculate_amounttopay() {
    amounttoPay_final = totalpriceAfterCoupon + deliveryfee;
    update();
  }

  void checkCoupon_fromUser() {
    var couponcode = couponEditing_TextController.text;
    if (coupons.containsKey(couponcode)) {
      appliedCoupon = coupons[couponcode]!;
      couponapplied = true;
      couponCode = couponcode;
      updateTotalPrice_bycoupon();
      isCouponValid = true;
      coupons.remove(couponcode);
      update();
    } else {
      isCouponValid = false;
      update();
    }
  }

  void updateTotalPrice_bycoupon() {
    var price = total_priceofCartItems;
    var updatedPrice = price - ((price / 100) * appliedCoupon);
    totalpriceAfterCoupon = updatedPrice;
    calculate_amounttopay();
    update();
  }

  void onClose() {
    isCouponValid = true;

    super.onClose();
  }

  final couponEditing_TextController = TextEditingController();
}
