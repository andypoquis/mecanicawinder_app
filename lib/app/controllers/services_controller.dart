import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mecanicawinder/app/data/services/remote_services.dart';

import '../data/models/services_model.dart';

class ServicesController extends GetxController {
  RxList<ServicesData> productList = RxList<ServicesData>();
  RxBool isLoading = false.obs;
  GetStorage box = GetStorage();
  RxString token = ''.obs;
  RxInt idClient = 0.obs;
  ScrollController sc = ScrollController();

  RxInt amount = 1.obs;
  addAmount() {
    amount.value++;
  }

  reduceAmount() {
    if (amount.value > 1) {
      amount.value--;
    }
  }

  @override
  void onInit() async {
    await GetStorage.init('token');
    await GetStorage.init('id');
    idClient(box.read('id'));
    token(box.read('token'));

    fetchProductList();
    super.onInit();
  }

  void fetchProductList() async {
    try {
      var product = await RemoteServices.fetchListServices(
          "http://34.133.92.25/api/services?populate=*", token.value);
      if (product != null) {
        productList(product.data);
      }
    } finally {}
  }

  void fetchClientService(int idService, int idImage) async {
    try {
      var product = await RemoteServices.fetchServiceClient(
          idClient.value,
          idService,
          idImage,
          "http://34.133.92.25/api/client-services",
          token.value);
      if (product != null) {
        print("Todo okey");
      }
    } finally {}
  }
}
