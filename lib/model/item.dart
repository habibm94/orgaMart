class Item {
  String? type;
  String name;
  String weightType;
  int weight;
  String? packOrBottle;
  double? initial_pricePerUnit = 0.0;
  double discount;
  String? brand;
  String imagePath;
  bool? discounted;

  int totalItemcount = 0;
  late double totalPrice = 0;
  double totalWeight = 0;
  double? itemPrice_incart = 0.0;

  Item({
    required this.name,
    required this.type,
    required this.brand,
    required this.initial_pricePerUnit,
    required this.discount,
    required this.weightType,
    required this.packOrBottle,
    required this.weight,
    required this.imagePath,
    this.discounted,
    this.itemPrice_incart,
  });
}
