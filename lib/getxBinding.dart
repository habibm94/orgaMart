import 'package:get/get.dart';
import 'package:orgamart/controller/user_controller.dart';
import 'package:orgamart/controller/cart_controller.dart';
import 'package:orgamart/controller/shopping_Controller.dart';
import 'package:orgamart/controller/route_controller.dart';
import 'package:orgamart/controller/offer_Controller.dart';

class GetxBinding implements Bindings {
// default dependency
  @override
  void dependencies() {
    Get.put(Cart_Controller(), permanent: true);
    Get.put(User_Controller(), permanent: true);
    Get.lazyPut(() => Shopping_Controller(), fenix: true);
    Get.lazyPut(() => Route_Controller(), fenix: true);
    Get.lazyPut(() => Offer_Controller(), fenix: true);
  }
}
