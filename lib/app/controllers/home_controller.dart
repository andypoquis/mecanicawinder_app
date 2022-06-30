import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mecanicawinder/app/data/models/client_Service.dart';
import 'package:mecanicawinder/app/routes/app_pages.dart';

import '../data/models/post_model.dart';
import '../data/models/services_model.dart';
import '../data/services/remote_services.dart';

class HomeController extends GetxController {
  RxList<Datum> postList = RxList<Datum>();
  RxList<ClientServicData> clientServiceList = RxList<ClientServicData>();
  RxBool isLoading = false.obs;
  GetStorage box = GetStorage();
  RxString token = ''.obs;
  RxInt idClient = 0.obs;

  @override
  void onInit() async {
    await GetStorage.init('token');
    token(box.read('token'));
    idClient(box.read('id'));
    token(box.read('token'));
    fetchPostList();
    fetchProductList();
    super.onInit();
  }

  void fetchPostList() async {
    try {
      var posts = await RemoteServices.fetchPosts(
          "http://34.133.92.25/api/post?populate=*", token.value);
      if (posts != null) {
        postList(posts.data!.attributes!.imagePost!.data);
      }
    } finally {}
  }

  void fetchProductList() async {
    try {
      var product = await RemoteServices.fetchClientServices(
          "http://34.133.92.25/api/client-services?populate=*&&filters[client_service][id][\$eq]=${idClient.value}",
          token.value);
      if (product != null) {
        clientServiceList(product.data);
      }
    } finally {}
  }

  navigationProfileClient() {
    Get.toNamed(Routes.PROFILE_CLIENT);
  }

  RxString stateService(int index) {
    switch (index) {
      case 0:
        return "Sin técnico asignado".obs;
      case 1:
        return "Tecnico asignado".obs;
      case 2:
        return "Listo para recojo".obs;
    }
    return "-".obs;
  }
}
