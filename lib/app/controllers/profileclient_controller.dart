import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mecanicawinder/app/data/models/product.dart';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';

import '../data/services/remote_services.dart';
import '../routes/app_pages.dart';

class ProfileclientController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isLoadingButton = false.obs;
  RxBool isImage = false.obs;

  RxString token = ''.obs;
  RxInt idClient = 0.obs;

  RxInt idImg = 0.obs;

  File imageFile = File('');

  TextEditingController nameCtrl = TextEditingController();
  TextEditingController userCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();

  TextEditingController passCtrl = TextEditingController();
  TextEditingController pass2Ctrl = TextEditingController();

  RxString imageProfile =
      'http://34.133.92.25/uploads/descarga_dd70ecac8b.png?updated_at=2022-06-14T16:21:33.137Z'
          .obs;

  GetStorage box = GetStorage();
  @override
  void onInit() async {
    await GetStorage.init('domain');
    await GetStorage.init('token');
    idClient(box.read('id'));
    token(box.read('token'));
    fetchClientService();
    super.onInit();
  }

  logout() {
    box.write('success', false);
    box.write('token', '');
    Get.offAllNamed(Routes.INITIAL);
  }

  void fetchClientService() async {
    isLoading(false);
    try {
      var product = await RemoteServices.fetchUsers(
          "http://34.133.92.25/api/users/${idClient.value}/?populate=*",
          token.value);
      if (product != null) {
        if (product.imageProfile != null) {
          imageProfile.value =
              "http://34.133.92.25${product.imageProfile!.url!}";
          idImg.value = product.imageProfile!.id!;
        }
        nameCtrl.text = product.name!;
        userCtrl.text = product.username!;
        emailCtrl.text = product.email!;
        isLoading(true);
      }
    } finally {}
  }

  // void uploadImage() async {}

  void fetcPutUser() async {
    isLoadingButton(false);

    try {
      if (isImage.value) {
        var uuid = const Uuid();
        String nameImg = uuid.v4();
        var url = "http://34.133.92.25/api/upload/";
        var request = http.MultipartRequest('POST', Uri.parse(url));
        request.files.add(http.MultipartFile(
            'files',
            imageFile.readAsBytes().asStream(),
            File(imageFile.path).lengthSync(),
            filename: "$nameImg.jpg"));
        var res = await request.send();
        var response = await http.Response.fromStream(res);
        print(response.statusCode);
        idImg.value = jsonDecode(response.body)[0]["id"];
      }

      var product = await RemoteServices.fetchPutUser(
          nameCtrl.text,
          userCtrl.text,
          emailCtrl.text,
          idImg.value,
          "http://34.133.92.25/api/users/${idClient.value}",
          token.value);
      if (product != null) {
        fetchClientService();

        isLoadingButton(true);
      }
    } finally {}
  }

  Future pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    final imageTemporary = File(image.path);
    imageFile = imageTemporary;
    isImage(true);
    update();
  }

  changePassword() async {
    try {
      var product = await RemoteServices.fetchPutUserPassword(
          passCtrl.text,
          pass2Ctrl.text,
          "http://34.133.92.25/api/users/${idClient.value}",
          token.value);
      if (product != null) {
        Get.back();
        pass2Ctrl.text = '';
        passCtrl.text = '';
      }
    } finally {}
  }
}
