import 'package:get/get.dart';
import 'package:orgamart/model/item.dart';

class Cart_Controller extends GetxController {
  var cartItems = [].obs;
  var availabeproductId = [];
  var orderoftimes = 1;
  var userClickedItem;

  void addtoCart({required Item item, productid}) {
    cartItems.add(item);
    update();
  }

  void addtoUserClickedItem({required Item item}) {
    userClickedItem = item;
  }

  void increaseOrder() {
    orderoftimes += 1;
    update();
  }

  void decreaseOrder() {
    orderoftimes -= 1;
    update();
  }

  void reset_orderoftimes() {
    orderoftimes = 1;
    update();
  }

  @override
  void onClose() {
    reset_orderoftimes();
    super.onClose();
  }
}
