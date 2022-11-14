import 'package:get/get.dart';
import 'package:mskapp/app/modules/user_information_search/views/user_information_add.dart';
import 'package:mskapp/app/modules/user_information_search/views/user_information_update.dart';

import '../modules/account_information/bindings/account_information_binding.dart';
import '../modules/account_information/views/account_information_view.dart';
import '../modules/account_setting/bindings/account_setting_binding.dart';
import '../modules/account_setting/views/account_setting_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/reset_password/bindings/reset_password_binding.dart';
import '../modules/reset_password/views/reset_password_view.dart';
import '../modules/signup/bindings/signup_binding.dart';
import '../modules/signup/views/signup_view.dart';
import '../modules/user_information_search/bindings/user_information_search_binding.dart';
import '../modules/user_information_search/views/user_information_search_view.dart';
import '../modules/user_profile_information/bindings/user_profile_information_binding.dart';
import '../modules/user_profile_information/views/user_profile_information_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.RESET_PASSWORD,
      page: () => ResetPasswordView(),
      binding: ResetPasswordBinding(),
    ),
    GetPage(
      name: _Paths.ACCOUNT_INFORMATION,
      page: () => AccountInformationView(),
      binding: AccountInformationBinding(),
    ),
    GetPage(
      name: _Paths.ACCOUNT_SETTING,
      page: () => AccountSettingView(),
      binding: AccountSettingBinding(),
    ),
    GetPage(
      name: _Paths.USER_PROFILE_INFORMATION,
      page: () => UserProfileInformationView(),
      binding: UserProfileInformationBinding(),
    ),
    GetPage(
      name: _Paths.USER_INFORMATION_SEARCH,
      page: () => UserInformationSearchView(),
      binding: UserInformationSearchBinding(),
    ),
    GetPage(
      name: _Paths.USER_INFORMATION_UPDATE,
      page: () => userInformationUpdateView(),
      binding: UserInformationUpdateBinding(),
    ),
    GetPage(
      name: _Paths.USER_INFOMRATION_ADD,
      page: () => userInformationAddView(),
      binding: UserInformationAddBinding(),
    ),
  ];
}
