
import 'package:get/get.dart';
import '../controllers/profileclient_controller.dart';


class ProfileclientBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileclientController>(() => ProfileclientController());
  }
}