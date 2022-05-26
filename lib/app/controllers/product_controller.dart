import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../data/models/productlist_model.dart';
import '../data/services/remote_services.dart';

class ProductController extends GetxController {
  RxList<ProductlistDatum> productList = RxList<ProductlistDatum>();
  RxBool isLoading = false.obs;
  GetStorage box = GetStorage();
  RxString token = ''.obs;

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
    token(box.read('token'));
    fetchProductList();
    super.onInit();
  }

  void fetchProductList() async {
    try {
      var product = await RemoteServices.fetchListProduct(
          "http://34.133.92.25/api/products?populate=*",
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MywiaWF0IjoxNjUyODIzNDg1LCJleHAiOjE2NTU0MTU0ODV9.s-Hpa1iwFA3mctGPlp9vaNN7VCSuB2r2JdkQ0Y4T1Cc");
      if (product != null) {
        productList(product.data);
      }
    } finally {}
  }
}
