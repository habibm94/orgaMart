class Adress {
  String house;
  String road;
  String block;
  String city;
  String area;
  Adress(
      {required this.house,
      required this.city,
      required this.area,
      this.block = '',
      this.road = ''});
}
