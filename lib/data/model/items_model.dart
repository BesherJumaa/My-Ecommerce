class ItemsModel {
  String? itemsId;
  String? itemsName;
  String? itemsNameAr;
  String? itemsDesc;
  String? itemsDescAr;
  String? itemsImage;
  String? itemsCount;
  String? itemsActive;
  String? itemsPrice;
  String? itemsDiscount;
  String? itemsDate;
  String? itemsCat;
  String? categoriesId;
  String? categoriesName;
  String? categoriesNameAr;
  String? categoriesImage;
  String? categoriesDatetime;

  ItemsModel(
      {this.itemsId,
      this.itemsName,
      this.itemsNameAr,
      this.itemsDesc,
      this.itemsDescAr,
      this.itemsImage,
      this.itemsCount,
      this.itemsActive,
      this.itemsPrice,
      this.itemsDiscount,
      this.itemsDate,
      this.itemsCat,
      this.categoriesId,
      this.categoriesName,
      this.categoriesNameAr,
      this.categoriesImage,
      this.categoriesDatetime});

  ItemsModel.fromJson(Map<String, dynamic> json) {
    itemsId = json["items_id"];
    itemsName = json["items_name"];
    itemsNameAr = json["items_name_ar"];
    itemsDesc = json["items_desc"];
    itemsDescAr = json["items_desc_ar"];
    itemsImage = json["items_image"];
    itemsCount = json["items_count"];
    itemsActive = json["items_active"];
    itemsPrice = json["items_price"];
    itemsDiscount = json["items_discount"];
    itemsDate = json["items_date"];
    itemsCat = json["items_cat"];
    categoriesId = json["categories_id"];
    categoriesName = json["categories_name"];
    categoriesNameAr = json["categories_name_ar"];
    categoriesImage = json["categories_image"];
    categoriesDatetime = json["categories_datetime"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["items_id"] = itemsId;
    _data["items_name"] = itemsName;
    _data["items_name_ar"] = itemsNameAr;
    _data["items_desc"] = itemsDesc;
    _data["items_desc_ar"] = itemsDescAr;
    _data["items_image"] = itemsImage;
    _data["items_count"] = itemsCount;
    _data["items_active"] = itemsActive;
    _data["items_price"] = itemsPrice;
    _data["items_discount"] = itemsDiscount;
    _data["items_date"] = itemsDate;
    _data["items_cat"] = itemsCat;
    _data["categories_id"] = categoriesId;
    _data["categories_name"] = categoriesName;
    _data["categories_name_ar"] = categoriesNameAr;
    _data["categories_image"] = categoriesImage;
    _data["categories_datetime"] = categoriesDatetime;
    return _data;
  }
}
