class ProductModel {
  late int id;
  late String title;
  late num price;
  late String description;
  late String image;

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    image = json['image'];
  }
}
