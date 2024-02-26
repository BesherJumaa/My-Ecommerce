class AppLink {
  static const String server =
      "https://besherjumaaa.000webhostapp.com/ecommerce";

  //============Image=============================
  static const String imageStatic =
      "https://besherjumaaa.000webhostapp.com/ecommerce/upload";
  static const String imageCategories = "$imageStatic/categories";
  static const String imageItems = "$imageStatic/items";
  //============================================
  static const String test = "$server/test.php";

  //***************Auth****************
  static const String signUp = "$server/auth/signup.php";
  static const String verifycode = "$server/auth/verifycode.php";
  static const String signIn = "$server/auth/signin.php";
  static const String resend = "$server/auth/resend.php";

  //--------------resetPassword=============
  static const String checkEmail = "$server/forgetpassword/checkemail.php";
  static const String resetPassword =
      "$server/forgetpassword/resetpassword.php";
  static const String verifyCodePassword =
      "$server/forgetpassword/verifycodepassword.php";

  //------home-----

  static const String home = "$server/home.php";
  //----------items-------
  static const String items = "$server/items/items.php";
  static const String searchItem = "$server/items/search.php";
  //--------favorite---------
  static const String favoriteAdd = "$server/favorite/add.php";
  static const String favoriteRemove = "$server/favorite/remove.php";
  static const String favoriteView = "$server/favorite/view.php";
  static const String deleteFavorite =
      "$server/favorite/deleteFromFavorite.php";

  //-----Cart ----------
  static const String cartAdd = "$server/cart/add.php";
  static const String cartRemove = "$server/cart/delete.php";
  static const String cartView = "$server/cart/view.php";
  static const String cartCount = "$server/cart/getcountitems.php";
  //-----Address ----------
  static const String addressAdd = "$server/address/add.php";
  static const String addressEdit = "$server/address/edit.php";
  static const String addressDelete = "$server/address/delete.php";
  static const String addressView = "$server/address/view.php";
  static const String addressViewById = "$server/address/viewbyid.php";
}
