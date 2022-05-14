import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../routes/app_pages.dart';

class ProfileclientController extends GetxController {
  GetStorage box = GetStorage();
  @override
  void onInit() async {
    await GetStorage.init('domain');
    super.onInit();
  }

  logout() {
    box.write('success', false);
    box.write('domain', '');
    Get.offAllNamed(Routes.INITIAL);
  }
}
