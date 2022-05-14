import 'package:get/get.dart';
import 'package:mecanicawinder/app/bindings/profileclient_binding.dart';
import 'package:mecanicawinder/app/ui/pages/profileclient_page/profileclient_page.dart';

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
  ];
}
