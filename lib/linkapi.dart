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

  //--------------resetPassword=============
  static const String checkEmail = "$server/forgetpassword/checkemail.php";
  static const String resetPassword =
      "$server/forgetpassword/resetpassword.php";
  static const String verifyCodePassword =
      "$server/forgetpassword/verifycodepassword.php";

  //------home-----

  static const String home = "$server/home.php";
}
