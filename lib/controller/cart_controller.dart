import 'package:get/get.dart';
import 'package:orgamart/model/item.dart';

class Cart_Controller extends GetxController {
  var cartItems = [].obs;
  var availabeproductId = [];

  void addtoCart({required Item item, productid}) {
    cartItems.add(item);
    update();
  }
}
