import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mecanicawinder/app/ui/pages/product_page/product_pdf.dart';

import '../../../controllers/product_controller.dart';

class DetailProductPage extends GetView<ProductController> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          isExtended: true,
          onPressed: () async {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => PdfPage()),
            // );

            controller.pdfGenerater();
          },
          icon: const Icon(Icons.shopify_rounded),
          label: const Text('Generar mi pedido S/210.90'),
        ),
        appBar: AppBar(title: const Text('Carrito')),
        body: SafeArea(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemCount: controller.productsShop.length,
                itemBuilder: ((context, index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flex(
                            direction: Axis.horizontal,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  "${controller.productsShop[index]['product'].attributes!.name}"),
                              Text(
                                  "${controller.productsShop[index]['amount']}")
                            ],
                          ),
                          const Divider()
                        ],
                      ),
                    ))),
          ],
        )));
  }
}
