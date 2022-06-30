import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mecanicawinder/app/data/services/remote_services.dart';
import 'package:mecanicawinder/app/routes/app_pages.dart';

class RegisterController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool success = false.obs;
  RxBool incorrect = false.obs;

  GetStorage box = GetStorage();

  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void onInit() async {
    super.onInit();
  }

  //Auth HTTP
  void fetchRegister() async {
    try {
      isLoading(true);
      var register = await RemoteServices.fetchRegister(
          nameController.text,
          usernameController.text,
          emailController.text,
          passwordController.text,
          "http://34.133.92.25/api/users");
      if (register != null) {
        //box.write('token', auth.jwt);

        box.write('success', true);
        incorrect(false);
      } else {
        fetchAuth();
      }
    } finally {}
  }

  void fetchAuth() async {
    try {
      isLoading(true);
      var auth = await RemoteServices.fetchAuth(emailController.text,
          passwordController.text, "http://34.133.92.25/api/auth/local");
      if (auth != null) {
        box.write('token', auth.jwt);
        box.write('id', auth.user!.id);

        box.write('success', true);
        incorrect(false);
        Get.offAllNamed(Routes.MENU);
      }
    } finally {
      isLoading(false);
    }
  }
}
