import 'package:get/get.dart';

import '../routes/app_pages.dart';

class GetstartController extends GetxController {
  navigatorAuthPage() {
    Get.toNamed(Routes.AUTH);
  }

  navigatorValidateDomain() {
    Get.toNamed(Routes.VALIDATEDOMAIN);
  }
}
