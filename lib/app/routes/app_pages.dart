import 'package:get/get.dart';

import '../modules/create_new_password/bindings/create_new_password_binding.dart';
import '../modules/create_new_password/views/create_new_password_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/lengkapi/bindings/lengkapi_binding.dart';
import '../modules/lengkapi/views/lengkapi_view.dart';
import '../modules/lupa_password/bindings/lupa_password_binding.dart';
import '../modules/lupa_password/views/lupa_password_view.dart';
import '../modules/lupa_password_email/bindings/lupa_password_email_binding.dart';
import '../modules/lupa_password_email/views/lupa_password_email_view.dart';
import '../modules/pemesanan/bindings/pemesanan_binding.dart';
import '../modules/pemesanan/views/pemesanan_view.dart';
import '../modules/signin/bindings/signin_binding.dart';
import '../modules/signin/views/signin_view.dart';
import '../modules/signup/bindings/signup_binding.dart';
import '../modules/signup/views/signup_view.dart';
import '../modules/verify_email/bindings/verify_email_binding.dart';
import '../modules/verify_email/views/verify_email_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => const SignupView(),
      binding: SignupBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.SIGNIN,
      page: () => const SigninView(),
      binding: SigninBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.LENGKAPI,
      page: () => const LengkapiView(),
      binding: LengkapiBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: _Paths.VERIFY_EMAIL,
      page: () => const VerifyEmailView(),
      binding: VerifyEmailBinding(),
    ),
    GetPage(
      name: _Paths.LUPA_PASSWORD,
      page: () => const LupaPasswordView(),
      binding: LupaPasswordBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: _Paths.LUPA_PASSWORD_EMAIL,
      page: () => const LupaPasswordEmailView(),
      binding: LupaPasswordEmailBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_NEW_PASSWORD,
      page: () => const CreateNewPasswordView(),
      binding: CreateNewPasswordBinding(),
    ),
    GetPage(
      name: _Paths.PEMESANAN,
      page: () => const PemesananView(),
      binding: PemesananBinding(),
    ),
  ];
}
