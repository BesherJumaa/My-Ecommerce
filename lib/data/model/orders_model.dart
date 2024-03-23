class OrdersModel {
  String? ordersId;
  String? ordersUsersid;
  String? ordersAddress;
  String? ordersType;
  String? ordersPaymentmethod;
  String? ordersPricedelivery;
  String? ordersPrice;
  String? ordersTotalprice;
  String? ordersCoupon;
  String? ordersNoterating;
  String? ordersRating;
  String? ordersStatus;
  String? ordersDatetime;
  String? addressId;
  String? addressUsersid;
  String? addressName;
  String? addressCountry;
  String? addressGovernorate;
  String? addressCity;
  String? addressStreet;
  String? addressLat;
  String? addressLong;

  OrdersModel(
      {this.ordersId,
      this.ordersUsersid,
      this.ordersAddress,
      this.ordersType,
      this.ordersPaymentmethod,
      this.ordersPricedelivery,
      this.ordersPrice,
      this.ordersTotalprice,
      this.ordersCoupon,
      this.ordersNoterating,
      this.ordersRating,
      this.ordersStatus,
      this.ordersDatetime,
      this.addressId,
      this.addressUsersid,
      this.addressName,
      this.addressCountry,
      this.addressGovernorate,
      this.addressCity,
      this.addressStreet,
      this.addressLat,
      this.addressLong});

  OrdersModel.fromJson(Map<String, dynamic> json) {
    ordersId = json['orders_id'];
    ordersUsersid = json['orders_usersid'];
    ordersAddress = json['orders_address'];
    ordersType = json['orders_type'];
    ordersPaymentmethod = json['orders_paymentmethod'];
    ordersPricedelivery = json['orders_pricedelivery'];
    ordersPrice = json['orders_price'];
    ordersTotalprice = json['orders_totalprice'];
    ordersCoupon = json['orders_coupon'];
    ordersNoterating = json['orders_noterating'];
    ordersRating = json['orders_rating'];
    ordersStatus = json['orders_status'];
    ordersDatetime = json['orders_datetime'];
    addressId = json['address_id'];
    addressUsersid = json['address_usersid'];
    addressName = json['address_name'];
    addressCountry = json['address_country'];
    addressGovernorate = json['address_governorate'];
    addressCity = json['address_city'];
    addressStreet = json['address_street'];
    addressLat = json['address_lat'];
    addressLong = json['address_long'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['orders_id'] = ordersId;
    data['orders_usersid'] = ordersUsersid;
    data['orders_address'] = ordersAddress;
    data['orders_type'] = ordersType;
    data['orders_paymentmethod'] = ordersPaymentmethod;
    data['orders_pricedelivery'] = ordersPricedelivery;
    data['orders_price'] = ordersPrice;
    data['orders_totalprice'] = ordersTotalprice;
    data['orders_coupon'] = ordersCoupon;
    data['orders_noterating'] = ordersNoterating;
    data['orders_rating'] = ordersRating;
    data['orders_status'] = ordersStatus;
    data['orders_datetime'] = ordersDatetime;
    data['address_id'] = addressId;
    data['address_usersid'] = addressUsersid;
    data['address_name'] = addressName;
    data['address_country'] = addressCountry;
    data['address_governorate'] = addressGovernorate;
    data['address_city'] = addressCity;
    data['address_street'] = addressStreet;
    data['address_lat'] = addressLat;
    data['address_long'] = addressLong;
    return data;
  }
}
