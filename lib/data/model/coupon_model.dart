class CouponModel {
  String? couponId;
  String? couponName;
  String? couponCount;
  String? couponDiscount;
  String? couponExpireDate;

  CouponModel(
      {this.couponId,
      this.couponName,
      this.couponCount,
      this.couponDiscount,
      this.couponExpireDate});

  CouponModel.fromJson(Map<String, dynamic> json) {
    couponId = json['coupon_id'];
    couponName = json['coupon_name'];
    couponCount = json['coupon_count'];
    couponDiscount = json['coupon_discount'];
    couponExpireDate = json['coupon_expiredate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['coupon_id'] = couponId;
    data['coupon_name'] = couponName;
    data['coupon_count'] = couponCount;
    data['coupon_discount'] = couponDiscount;
    data['coupon_expiredate'] = couponExpireDate;
    return data;
  }
}
