import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mecanicawinder/app/ui/theme/color.dart';

import '../../../controllers/product_controller.dart';

class DetailProductPage extends GetView<ProductController> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: const Color(0xffFDFBFF),
        bottomSheet: Container(
            height: size.height * 0.125,
            width: size.width,
            padding: EdgeInsets.all(size.height * 0.025),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  children: [
                    const Text('Total'),
                    const SizedBox(
                      height: 10,
                    ),
                    Obx(() => Text(
                        'S/. ${controller.totalPrice.value.toStringAsFixed(2)}',
                        style: const TextStyle(
                            color: primaryColor, fontSize: 20))),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                      color: const Color(0xff285EA7),
                      borderRadius: BorderRadius.circular(7)),
                  padding: const EdgeInsets.all(8),
                  child: TextButton(
                      onPressed: () => controller.pdfGenerater(),
                      child: const Text(
                        'Completar pedido',
                        style: TextStyle(color: Colors.white),
                      )),
                )
              ],
            )),
        appBar: AppBar(
          foregroundColor: Colors.black87,
          title: const Text('Carrito'),
          backgroundColor: Colors.white,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.history_sharp),
            )
          ],
        ),
        body: SafeArea(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Obx(
              () => ListView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemCount: controller.productsShop.length,
                  itemBuilder: ((context, index) => Container(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(5.0),
                              width: size.width,
                              color: const Color(0xffF1EFF4),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () =>
                                        controller.removeProductShop(index),
                                    child: const CircleAvatar(
                                        radius: 12,
                                        backgroundColor: Colors.black26,
                                        child: Icon(
                                          Icons.close,
                                          color: Colors.white,
                                          size: 15,
                                        )),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Image.network(
                                        "http://34.133.92.25${controller.productsShop[index]['product'].attributes!.image!.data![0].attributes!.url}",
                                        height: 75,
                                        width: 75,
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Flex(
                                        direction: Axis.vertical,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              "${controller.productsShop[index]['product'].attributes!.name}"),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                              "S/.${controller.productsShop[index]['product'].attributes!.price}"),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              CircleAvatar(
                                                backgroundColor:
                                                    (controller.amount.value ==
                                                            1)
                                                        ? const Color.fromARGB(
                                                            135, 163, 163, 163)
                                                        : const Color.fromARGB(
                                                            136, 58, 58, 58),
                                                child: const Text(
                                                  '-',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                radius: 10,
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Obx(() {
                                                return Text(
                                                    "${controller.productsShop[index]['amount']}",
                                                    style: const TextStyle(
                                                        color:
                                                            Color(0xff6750A4)));
                                              }),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              const CircleAvatar(
                                                backgroundColor: Color.fromARGB(
                                                    136, 58, 58, 58),
                                                child: Text(
                                                  '+',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                radius: 10,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ))),
            )
          ],
        )));
  }
}
