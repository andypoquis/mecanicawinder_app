import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart';
import 'package:uuid/uuid.dart';

import '../data/models/productlist_model.dart';
import '../data/services/remote_services.dart';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:http/http.dart' as http;

import '../routes/app_pages.dart';

class ProductController extends GetxController {
  RxList<ProductlistDatum> productList = RxList<ProductlistDatum>();
  RxBool isLoading = false.obs;
  GetStorage box = GetStorage();
  RxString token = ''.obs;
  RxInt idClient = 0.obs;

  RxInt amountShoop = 0.obs;

  ScrollController sc = ScrollController();

  RxDouble totalPrice = (0.0).obs;

  RxInt amount = 1.obs;
  addAmount() {
    amount.value++;
  }

  reduceAmount() {
    if (amount.value > 0) {
      amount.value--;
    }
  }

  addProductshop(int index) {
    productsShop.add({"product": productList[index], "amount": amount.value});
    totalPrice.value += productList[index].attributes!.price! * amount.value;
    amountShoop.value += 1;
    Get.back();
  }

  removeProductShop(int index) {
    totalPrice.value -= productsShop[index]["product"].attributes!.price! *
        productsShop[index]["amount"];
    amountShoop.value -= 1;
    productsShop.removeAt(index);
  }

  RxList<Map<String, dynamic>> productsShop = <Map<String, dynamic>>[].obs;

  @override
  void onInit() async {
    await GetStorage.init('token');
    token(box.read('token'));
    await GetStorage.init('id');
    idClient(box.read('id'));
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

  void fetchVaucher(
    String code,
    int pdf,
    String name,
  ) async {
    try {
      var product = await RemoteServices.fetchVaucher(code, pdf,
          "http://34.133.92.25/api/vouchers", idClient.value, token.value);
      if (product != null) {
        productsShop([]);
        amountShoop.value = 0;
        Get.back();
      }
    } finally {}
  }

  // ignore: use_function_type_syntax_for_parameters
  void pdfGenerater() async {
    var uuid = const Uuid();
    String namePDF = uuid.v4();

    final pdf = pw.Document();
    const size = PdfPageFormat.a4;
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
          return pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Row(children: [
                  pw.Expanded(child: pw.Container()),
                  pw.Text('Factura: $namePDF')
                ]),
                pw.Text('${DateTime.now()}'),
                pw.Text('Mecanica Winder.',
                    style: pw.TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: PdfColor.fromHex("#285EA7"))),
                pw.SizedBox(height: 25),
                pw.Text('Oficinas: ',
                    style: pw.TextStyle(fontWeight: FontWeight.bold)),
                pw.SizedBox(height: 10),
                pw.Text(
                  'Jr. Messones Muro 364 - Rioja: ',
                ),
                pw.SizedBox(height: 25),
                pw.Text(
                  '+51982687078',
                ),
                pw.SizedBox(height: 50),
                pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.start,
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Column(
                          mainAxisAlignment: pw.MainAxisAlignment.start,
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Container(
                                width: size.width * 0.35,
                                height: 35,
                                decoration: pw.BoxDecoration(
                                  color: PdfColor.fromHex("#285EA7"),
                                ),
                                child: pw.Center(
                                  child: pw.Text('Productos',
                                      style: pw.TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: PdfColor.fromHex("#FDFBFF"))),
                                )),
                            pw.Container(
                                width: size.width * 0.35,
                                child: pw.ListView.builder(
                                    itemBuilder: ((context, index) => (index %
                                                2 ==
                                            0)
                                        ? pw.Container(
                                            height: 35,
                                            width: size.width * 0.35,
                                            child: pw.Text(
                                                "${productsShop[index]["product"].attributes!.name}"))
                                        : pw.Container(
                                            height: 35,
                                            width: size.width * 0.35,
                                            color: PdfColor.fromHex("#E0E2EC"),
                                            child: pw.Text(
                                                "${productsShop[index]["product"].attributes!.name}"))),
                                    itemCount: productsShop.length))
                          ]),
                      pw.Column(
                          mainAxisAlignment: pw.MainAxisAlignment.start,
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Container(
                                width: size.width * 0.22125,
                                height: 35,
                                decoration: pw.BoxDecoration(
                                  color: PdfColor.fromHex("#285EA7"),
                                ),
                                child: pw.Center(
                                  child: pw.Text('Precio unitario',
                                      style: pw.TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: PdfColor.fromHex("#FDFBFF"))),
                                )),
                            pw.Container(
                                width: size.width * 0.22125,
                                child: pw.ListView.builder(
                                    itemBuilder: ((context, index) => (index %
                                                2 ==
                                            0)
                                        ? pw.Container(
                                            height: 35,
                                            width: size.width * 0.22125,
                                            child: pw.Text(
                                                "S/. ${productsShop[index]["product"].attributes!.price}"))
                                        : pw.Container(
                                            height: 35,
                                            width: size.width * 0.35,
                                            color: PdfColor.fromHex("#E0E2EC"),
                                            child: pw.Text(
                                                "S/. ${productsShop[index]["product"].attributes!.price}"))),
                                    itemCount: productsShop.length))
                          ]),
                      pw.Column(
                          mainAxisAlignment: pw.MainAxisAlignment.start,
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Container(
                                width: size.width * 0.25,
                                height: 35,
                                decoration: pw.BoxDecoration(
                                  color: PdfColor.fromHex("#285EA7"),
                                ),
                                child: pw.Center(
                                  child: pw.Text('Cantidad',
                                      style: pw.TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: PdfColor.fromHex("#FDFBFF"))),
                                )),
                            pw.Container(
                                width: size.width * 0.25,
                                child: pw.ListView.builder(
                                    itemBuilder: ((context, index) => (index %
                                                2 ==
                                            0)
                                        ? pw.Container(
                                            width: size.width * 0.25,
                                            height: 35,
                                            child: pw.Text(
                                                "${productsShop[index]["amount"]}"))
                                        : pw.Container(
                                            width: size.width * 0.25,
                                            height: 35,
                                            color: PdfColor.fromHex("#E0E2EC"),
                                            child: pw.Text(
                                                "${productsShop[index]["amount"]}"))),
                                    itemCount: productsShop.length))
                          ]),
                    ]),
                pw.Expanded(child: pw.Container()),
                pw.Text('Total: S/ ${totalPrice.value.toStringAsFixed(2)}',
                    style: pw.TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: PdfColor.fromHex("#285EA7"))),
              ]); // Center
        }));

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

    fetchVaucher(namePDF, idPDF, namePDF);
  }

  cellImpar(double width, double height, String color, String title) {
    return pw.Container(
        width: width,
        height: 35,
        decoration: pw.BoxDecoration(
          color: PdfColor.fromHex(color),
        ),
        child: pw.Center(
          child: pw.Text(title,
              style: pw.TextStyle(
                  fontWeight: FontWeight.bold,
                  color: PdfColor.fromHex("#FDFBFF"))),
        ));
  }

  Upload(File imageFile) async {}

  void navigationHistory() {
    Get.toNamed(Routes.HISTORY);
  }
}
