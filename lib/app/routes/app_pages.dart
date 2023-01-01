import 'package:bmi_firebase_app/app/bindings/base_binding.dart';
import 'package:bmi_firebase_app/app/bindings/home_binding.dart';
import 'package:bmi_firebase_app/app/bindings/login_binding.dart';
import 'package:bmi_firebase_app/app/bindings/user_info_binding.dart';
import 'package:bmi_firebase_app/app/ui/pages/base_page/base_page.dart';
import 'package:bmi_firebase_app/app/ui/pages/home_page/home_page.dart';
import 'package:bmi_firebase_app/app/ui/pages/login_page/login_page.dart';
import 'package:bmi_firebase_app/app/ui/pages/register_page/register_page.dart';
import 'package:bmi_firebase_app/app/ui/pages/user_info/user_info_page.dart';
import 'package:bmi_firebase_app/main.dart';
import 'package:get/get.dart';

import '../bindings/register_binding.dart';
part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.LOGIN;
  static final routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => const SplashView(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
        name: Routes.REGISTER,
        page: () => RegisterPage(),
        binding: RegisterBinding()),
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.USER_INFO,
      page: () => const UserInfoPage(),
      binding: UserInfoBinding(),
    ),
    GetPage(
      name: Routes.BASE,
      page: () => BasePage(),
      binding: BaseBinding(),
    ),
    /*  GetPage(
        name: Routes.DETAIL,
        page: () => const DetailView(),
        binding: HomeBinding()),
    GetPage(
        name: Routes.ADDBLOG,
        page: () => const CreateBlogView(),
        binding: CreateBlogBinding())  */
  ];
}
