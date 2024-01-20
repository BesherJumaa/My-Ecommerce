class CategoriesModel {
  String? categoriesId;
  String? categoriesName;
  String? categoriesNameAr;
  String? categoriesImage;
  String? categoriesDatetime;

  CategoriesModel(
      {this.categoriesId,
      this.categoriesName,
      this.categoriesNameAr,
      this.categoriesImage,
      this.categoriesDatetime});

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    categoriesId = json["categories_id"];
    categoriesName = json["categories_name"];
    categoriesNameAr = json["categories_name_ar"];
    categoriesImage = json["categories_image"];
    categoriesDatetime = json["categories_datetime"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["categories_id"] = categoriesId;
    _data["categories_name"] = categoriesName;
    _data["categories_name_ar"] = categoriesNameAr;
    _data["categories_image"] = categoriesImage;
    _data["categories_datetime"] = categoriesDatetime;
    return _data;
  }
}
