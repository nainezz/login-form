class categoryModel {
  late String title;
  categoryModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
  }
}
