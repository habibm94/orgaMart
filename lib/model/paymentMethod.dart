abstract class PaymentMethod {
  late String paymentmethod_name;
  late String Iconpath;
}

class Creditcard extends PaymentMethod {
  late String cvv;
  late String expiryDate;
  late String name;
}

class Paypal extends PaymentMethod {
  late String email;
  late String name;
}

class CashOnDelivery extends PaymentMethod {}
