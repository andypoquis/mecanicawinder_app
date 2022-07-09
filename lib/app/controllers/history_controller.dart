import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mecanicawinder/app/data/models/voucher_model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../data/services/remote_services.dart';

class HistoryController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<VoucherData> voucherList = RxList<VoucherData>();

  RxString token = ''.obs;
  RxInt idClient = 0.obs;
  GetStorage box = GetStorage();

  @override
  void onInit() async {
    await GetStorage.init('domain');
    await GetStorage.init('token');
    idClient(box.read('id'));
    token(box.read('token'));
    fetchVouchers();
    super.onInit();
  }

  void fetchVouchers() async {
    isLoading(false);
    try {
      var product = await RemoteServices.fetchVoucher(
          "http://34.133.92.25/api/vouchers?populate=*&&filters[client][id][\$eq]=${idClient.value}",
          token.value);
      if (product != null) {
        voucherList.value = product.data!;
      }
    } finally {
      isLoading(true);
    }
  }

  void navigationUrl(index) async {
    print(
        "http://34.133.92.25${voucherList[index].attributes!.pdf!.data!.attributes!.url!}");
    print(
        "http://34.133.92.25${voucherList[index].attributes!.pdf!.data!.attributes!.url!}");

    final url = Uri.parse(
        "http://34.133.92.25${voucherList[index].attributes!.pdf!.data!.attributes!.url!}");
    if (await canLaunchUrl(url))
      await launchUrl(url);
    else
      // can't launch url, there is some error
      throw "Could not launch $url";
  }

  PDFDocument document = PDFDocument();

  RxBool isLoadingPDF = false.obs;

  loadDocument(index) async {
    isLoadingPDF(false);

    final _document = await PDFDocument.fromURL(
        "https://unec.edu.az/application/uploads/2014/12/pdf-sample.pdf");

    document = _document;
    print(document.filePath);
    update();
    isLoadingPDF(true);
  }
}
