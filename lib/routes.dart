import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/core/middleware/mymiddleware.dart';
import 'package:ecommercecourse/view/cart/checkout.dart';

import 'package:ecommercecourse/view/screens/Auth/passwordrestore/forgotpassword.dart';
import 'package:ecommercecourse/view/screens/Auth/passwordrestore/resetpassword.dart';
import 'package:ecommercecourse/view/screens/Auth/passwordrestore/successresetpassword.dart';
import 'package:ecommercecourse/view/screens/Auth/passwordrestore/verifycode.dart';
import 'package:ecommercecourse/view/screens/Auth/login.dart';
import 'package:ecommercecourse/view/screens/Auth/passwordrestore/verifycodesignup.dart';
import 'package:ecommercecourse/view/screens/Auth/signup.dart';
import 'package:ecommercecourse/view/screens/Auth/successsignup.dart';
import 'package:ecommercecourse/view/screens/address/address_add.dart';
import 'package:ecommercecourse/view/screens/address/address_add_second.dart';
import 'package:ecommercecourse/view/screens/address/address_edit.dart';
import 'package:ecommercecourse/view/screens/address/address_view.dart';
import 'package:ecommercecourse/view/cart/cart.dart';
import 'package:ecommercecourse/view/screens/homeScreens/items.dart';
import 'package:ecommercecourse/view/screens/homeScreens/item_details.dart';
import 'package:ecommercecourse/view/screens/homeScreens/myfavorite.dart';
import 'package:ecommercecourse/view/screens/home_screen.dart';
import 'package:ecommercecourse/view/screens/language.dart';
import 'package:ecommercecourse/view/screens/language_app.dart';
import 'package:ecommercecourse/view/screens/offers.dart';
import 'package:ecommercecourse/view/screens/onboarding.dart';
import 'package:ecommercecourse/view/screens/orders/archive.dart';
import 'package:ecommercecourse/view/screens/orders/details.dart';
import 'package:ecommercecourse/view/screens/orders/pending.dart';

import 'package:get/get.dart';

List<GetPage<dynamic>>? routes = [
  //Main Page
  // GetPage(name: "/", page: () => const Cart()), //Main Page
  GetPage(
      name: "/", page: () => const Language(), middlewares: [MyMiddleware()]),

  //HomePage
  GetPage(name: AppRoutes.homePage, page: () => const HomeScreen()),
  GetPage(name: AppRoutes.items, page: () => const Items()),
  //Product Details
  GetPage(name: AppRoutes.productDetails, page: () => const ItemDetails()),
  // On Boarding
  GetPage(name: AppRoutes.onBoarding, page: () => const OnBoarding()),
  //Language
  GetPage(name: AppRoutes.language, page: () => const Language()),
  //Auth
  GetPage(name: AppRoutes.login, page: () => const Login()),
  GetPage(name: AppRoutes.signUp, page: () => const SignUp()),

  GetPage(name: AppRoutes.forgotPassword, page: () => const ForgotPassword()),
  GetPage(name: AppRoutes.verifyCode, page: () => const VerifyCode()),
  GetPage(
      name: AppRoutes.verifyCodeSignUp, page: () => const VerifyCodeSignUp()),
  GetPage(name: AppRoutes.resetPassword, page: () => const ResetPassword()),
  GetPage(
      name: AppRoutes.successResetPassword,
      page: () => const SuccessResetPassword()),
  GetPage(name: AppRoutes.successSignUp, page: () => const SuccessSignUp()),
  GetPage(
    name: AppRoutes.languageApp,
    page: () => const LanguageApp(),
  ),
  GetPage(
    name: AppRoutes.myFavorite,
    page: () => const MyFavorite(),
  ),
  //Cart
  GetPage(
    name: AppRoutes.cart,
    page: () => const Cart(),
  ),
  //----------ADDRESS---------------
  GetPage(
    name: AppRoutes.addressView,
    page: () => const AddressView(),
  ),
  GetPage(
    name: AppRoutes.addressEdit,
    page: () => const AddressEdit(),
  ),
  GetPage(
    name: AppRoutes.addressAdd,
    page: () => const AddressAdd(),
  ),
  GetPage(
    name: AppRoutes.addressAddSecondPart,
    page: () => const AddressAddSecondPart(),
  ),

  //--------CheckOut
  GetPage(
    name: AppRoutes.checkout,
    page: () => const Checkout(),
  ),
//-----Orders
  GetPage(
    name: AppRoutes.ordersDetails,
    page: () => const OrdersDetails(),
  ),
  GetPage(
    name: AppRoutes.ordersArchive,
    page: () => const OrdersArchive(),
  ),
  GetPage(
    name: AppRoutes.ordersPending,
    page: () => const OrdersPending(),
  ),

  GetPage(
    name: AppRoutes.offers,
    page: () => const Offers(),
  ),
  GetPage(
    name: AppRoutes.language,
    page: () => const Language(),
  ),
];

// };
