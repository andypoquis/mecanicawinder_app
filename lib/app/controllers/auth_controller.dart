import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../data/services/remote_services.dart';
import '../routes/app_pages.dart';

class AuthController extends GetxController {
  RxString domain = ''.obs;
  GetStorage box = GetStorage();

  RxBool isLoading = false.obs;
  RxBool success = false.obs;
  Timer? _timer;
  RxBool incorrect = false.obs;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void onInit() async {
    await GetStorage.init('domain');
    domain.value = (box.read('domain') == null) ? '' : box.read('domain');
    super.onInit();
  }

  //Auth HTTP

  void fetchAuth() async {
    try {
      isLoading(true);
      var auth = await RemoteServices.fetchAuth(emailController.text,
          passwordController.text, "http://34.133.92.25/api/auth/local");
      if (auth != null) {
        box.write('token', auth.jwt);
        box.write('success', true);
        incorrect(false);
        Get.offAllNamed(Routes.MENU);
      }
    } finally {
      isLoading(false);
    }
  }

  navigationMenuPage() {
    Get.offAllNamed(Routes.MENU);
  }
}
