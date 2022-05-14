
import 'package:get/get.dart';
import '../controllers/getstart_controller.dart';


class GetstartBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GetstartController>(() => GetstartController());
  }
}