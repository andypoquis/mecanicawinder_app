
import 'package:get/get.dart';
import '../controllers/services_controller.dart';


class ServicesBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ServicesController>(() => ServicesController());
  }
}