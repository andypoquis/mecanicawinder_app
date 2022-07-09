import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdf/pdf.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../controllers/history_controller.dart';

class HistoryPage extends GetView<HistoryController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Historial'),
      ),
      body: SafeArea(
        child: Obx(() => controller.isLoading.value
            ? ListView.builder(
                itemCount: controller.voucherList.length,
                itemBuilder: ((context, index) => Column(
                      children: [
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    height: 500,
                                    child: SfPdfViewer.network(
                                        "http://34.133.92.25${controller.voucherList[index].attributes!.pdf!.data!.attributes!.url!}")),
                                Container(
                                    height: 500,
                                    child: Obx(() =>
                                        controller.isLoadingPDF.value
                                            ? PDFViewer(
                                                zoomSteps: 1,
                                                document: controller.document)
                                            : Container())),
                                Text(controller
                                    .voucherList[index].attributes!.code!),
                                Text(controller.voucherList[index].attributes!
                                    .client!.data!.attributes!.name!),
                                ElevatedButton(
                                  onPressed: () {
                                    controller.navigationUrl(index);
                                  },
                                  child: const Text('Abrir PDF'),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    )))
            : const Center(
                child: CircularProgressIndicator(),
              )),
      ),
    );
  }
}
