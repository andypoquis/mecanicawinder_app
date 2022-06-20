import 'package:get/get.dart';
import 'package:mecanicawinder/app/bindings/product_binding.dart';
import 'package:mecanicawinder/app/bindings/profileclient_binding.dart';
import 'package:mecanicawinder/app/bindings/register_binding.dart';
import 'package:mecanicawinder/app/ui/pages/product_page/detail_product_page.dart';
import 'package:mecanicawinder/app/ui/pages/profileclient_page/profileclient_page.dart';
import 'package:mecanicawinder/app/ui/pages/register_page/register_page.dart';

import '../bindings/auth_binding.dart';
import '../bindings/getstart_binding.dart';
import '../bindings/menu_binding.dart';
import '../ui/pages/auth_page/auth_page.dart';
import '../ui/pages/getstart_page/getstart_page.dart';
import '../ui/pages/menu_page/menu_page.dart';
part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
        name: Routes.INITIAL,
        page: () => GetstartPage(),
        binding: GetstartBinding()),
    GetPage(name: Routes.AUTH, page: () => AuthPage(), binding: AuthBinding()),
    GetPage(
      name: Routes.MENU,
      page: () => MenuPage(),
      bindings: [MenuBinding()],
    ),
    GetPage(
      name: Routes.PROFILE_CLIENT,
      page: () => ProfileclientPage(),
      bindings: [ProfileclientBinding()],
    ),
    GetPage(
      name: Routes.REGISTER,
      page: () => RegisterPage(),
      bindings: [RegisterBinding()],
    ),
    GetPage(
      name: Routes.DETAILPRODUCT,
      page: () => DetailProductPage(),
      bindings: [ProductBinding()],
    ),
  ];
}
