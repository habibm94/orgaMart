import 'package:get/get.dart';
import 'package:orgamart/model/offer.dart';
import 'package:orgamart/services/sample_dataBase.dart';

class Offer_Controller extends GetxController {
  List<Offer> offerProductsList = [];
  @override
  void onInit() {
    fetchOfferProducts();
    super.onInit();
  }

  void fetchOfferProducts() {
    var offerproductsList_fromDB = Sample_DatabaseOfProducts().offerList;
    offerProductsList = offerproductsList_fromDB;
    print('got offer products');
    update();
  }
}
