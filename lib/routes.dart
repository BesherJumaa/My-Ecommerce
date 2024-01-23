import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/core/middleware/mymiddleware.dart';

import 'package:ecommercecourse/view/screens/Auth/passwordrestore/forgotpassword.dart';
import 'package:ecommercecourse/view/screens/Auth/passwordrestore/resetpassword.dart';
import 'package:ecommercecourse/view/screens/Auth/passwordrestore/successresetpassword.dart';
import 'package:ecommercecourse/view/screens/Auth/passwordrestore/verifycode.dart';
import 'package:ecommercecourse/view/screens/Auth/login.dart';
import 'package:ecommercecourse/view/screens/Auth/passwordrestore/verifycodesignup.dart';
import 'package:ecommercecourse/view/screens/Auth/signup.dart';
import 'package:ecommercecourse/view/screens/Auth/successsignup.dart';
import 'package:ecommercecourse/view/screens/homeScreens/items.dart';
import 'package:ecommercecourse/view/screens/home_screen.dart';
import 'package:ecommercecourse/view/screens/language.dart';
import 'package:ecommercecourse/view/screens/onboarding.dart';

import 'package:get/get.dart';

List<GetPage<dynamic>>? routes = [
  //Main Page
  // GetPage(name: "/", page: () => const Language()), //Main Page
  GetPage(
      name: "/", page: () => const Language(), middlewares: [MyMiddleware()]),
  //HomePage
  GetPage(name: AppRoutes.homePage, page: () => const HomeScreen()),
  GetPage(name: AppRoutes.items, page: () => const Items()),
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
];
//
// Map<String, Widget Function(BuildContext)> routes = {
//   // On Boarding
//   AppRoutes.onBoarding: (context) => const OnBoarding(),
//   //Language
//   AppRoutes.language: (context) => const Language(),
//   //Auth
//   AppRoutes.login: (context) => const Login(),
//   AppRoutes.signUp: (context) => const SignUp(),
//
//   AppRoutes.forgotPassword: (context) => const ForgotPassword(),
//   AppRoutes.verifyCode: (context) => const VerifyCode(),
//   AppRoutes.verifyCodeSignUp: (context) => const VerifyCodeSignUp(),
//   AppRoutes.resetPassword: (context) => const ResetPassword(),
//   AppRoutes.successResetPassword: (context) => const SuccessResetPassword(),
//   AppRoutes.successSignUp: (context) => const SuccessSignUp(),
// };
