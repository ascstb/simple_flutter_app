class CategoryModel {
  String id;
  String name;
  String iconUrl;

  CategoryModel.fromJsonMap(Map<String, dynamic> json) {
    id = json["categoryId"];
    name = json["name"];
    iconUrl = json["iconUrl"];
  }
}