import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mecanicawinder/app/routes/app_pages.dart';

import '../data/models/post_model.dart';
import '../data/services/remote_services.dart';

class HomeController extends GetxController {
  RxList<Datum> postList = RxList<Datum>();

  RxBool isLoading = false.obs;
  GetStorage box = GetStorage();
  RxString token = ''.obs;
  @override
  void onInit() async {
    await GetStorage.init('token');
    token(box.read('token'));
    fetchPostList();
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

  navigationProfileClient() {
    Get.toNamed(Routes.PROFILE_CLIENT);
  }
}
