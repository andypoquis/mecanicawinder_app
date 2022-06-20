import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart';
import 'package:uuid/uuid.dart';

import '../data/models/productlist_model.dart';
import '../data/services/remote_services.dart';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'dart:io';

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

  addProductshop(int index) {
    productsShop.add({"product": productList[index], "amount": amount.value});
    Get.back();
  }

  removeProductShop(int index) {
    productsShop.removeAt(index);
  }

  RxList<Map<String, dynamic>> productsShop = <Map<String, dynamic>>[].obs;

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
          "http://34.133.92.25/api/products?populate=*", token.value);
      if (product != null) {
        productList(product.data);
      }
    } finally {}
  }

  void fetchVaucher(String code, int pdf) async {
    try {
      var product = await RemoteServices.fetchVaucher(
          code, pdf, "http://34.133.92.25/api/vouchers", token.value);
      if (product != null) {
        Get.back();
      }
    } finally {}
  }

  // ignore: use_function_type_syntax_for_parameters
  void pdfGenerater() async {
    final pdf = pw.Document();
    pdf.addPage(pw.Page(
        theme: pw.ThemeData.withFont(
          base: Font.ttf(await rootBundle.load("assets/OpenSans-Regular.ttf")),
          bold: Font.ttf(await rootBundle.load("assets/OpenSans-Bold.ttf")),
          italic: Font.ttf(await rootBundle.load("assets/OpenSans-Italic.ttf")),
          boldItalic:
              Font.ttf(await rootBundle.load("assets/OpenSans-BoldItalic.ttf")),
        ),
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.ListView.builder(
              itemBuilder: ((context, index) => pw.Column(children: [
                    pw.Text(
                        "${productsShop[index]["product"].attributes!.name}")
                  ])),
              itemCount: productsShop.length); // Center
        }));
    var uuid = const Uuid();
    String namePDF = uuid.v4();
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/$namePDF.pdf');
    await file.writeAsBytes(await pdf.save());

    var url = "http://34.133.92.25/api/upload/";
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.files.add(http.MultipartFile(
        'files',
        File('${dir.path}/$namePDF.pdf').readAsBytes().asStream(),
        File(file.path).lengthSync(),
        filename: "$namePDF.pdf"));
    var res = await request.send();
    var response = await http.Response.fromStream(res);
    int idPDF = jsonDecode(response.body)[0]["id"];

    fetchVaucher(namePDF, idPDF);
  }

  Upload(File imageFile) async {}
}
