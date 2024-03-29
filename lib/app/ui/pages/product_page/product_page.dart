// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mecanicawinder/app/routes/app_pages.dart';
import '../../../controllers/product_controller.dart';
import '../../theme/color.dart';

class ProductPage extends GetView<ProductController> {
  final _controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            foregroundColor: primaryTextColor,
            title: const Text('Porductos'),
            actions: [
              Row(
                children: [
                  IconButton(
                      onPressed: () => controller.navigationHistory(),
                      icon: const Icon(
                        Icons.history,
                        color: primaryTextColor,
                      )),
                  Stack(
                    children: [
                      IconButton(
                          onPressed: () => Get.toNamed(Routes.DETAILPRODUCT),
                          icon: const Icon(
                            Icons.shopping_cart,
                            color: primaryTextColor,
                          )),
                      CircleAvatar(
                        maxRadius: 10,
                        child: Obx(() => Text(
                              '${controller.amountShoop.value}',
                              style: const TextStyle(fontSize: 10),
                            )),
                      )
                    ],
                  ),
                ],
              ),
            ]),
        body: ListView(
          controller: controller.sc,
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          children: [
            ElevatedButton(
              style:
                  ElevatedButton.styleFrom(primary: Colors.white, elevation: 0),
              onPressed: () => Get.bottomSheet(
                Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: Wrap(
                    children: <Widget>[
                      spaceH(25),
                    ],
                  ),
                ),
                backgroundColor: Colors.transparent,
                isScrollControlled: true,
              ),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Icon(
                  Icons.filter_alt,
                  color: Color(0xff3F60F2),
                ),
                spaceW(5),
                Obx(() => Text(
                      'Filtrar y ordenar ${controller.productList.length}',
                      style: const TextStyle(color: Color(0xff3F60F2)),
                    ))
              ]),
            ),
            spaceH(20),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: screenSize.height * 0.01),
              child: Obx(() => (controller.productList.isNotEmpty)
                  ? GridView.builder(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemCount: controller.productList.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: 355,
                          mainAxisSpacing: screenSize.height * 0.005,
                          crossAxisSpacing: screenSize.height * 0.005),
                      itemBuilder: (_, index) => (index <
                              controller.productList.length)
                          ? Container(
                              height: 355,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10)),
                                    child: Image.network(
                                      'http://34.133.92.25${controller.productList[index].attributes!.image!.data![0].attributes!.url}',
                                      height: 200,
                                      width: 300,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 85,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                    '${controller.productList[index].attributes!.name}'),
                                                spaceH(7),
                                                Text(
                                                  "S/. ${controller.productList[index].attributes!.price}",
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                  ),
                                                ),
                                                Expanded(child: Container()),
                                                controller
                                                            .productList[index]
                                                            .attributes!
                                                            .stock! >
                                                        0
                                                    ? Row(
                                                        children: [
                                                          const CircleAvatar(
                                                            maxRadius: 7,
                                                            backgroundColor:
                                                                Color.fromARGB(
                                                                    255,
                                                                    41,
                                                                    172,
                                                                    108),
                                                          ),
                                                          spaceW(10),
                                                          const Text(
                                                              'Disponible'),
                                                        ],
                                                      )
                                                    : Row(
                                                        children: [
                                                          const CircleAvatar(
                                                            maxRadius: 7,
                                                            backgroundColor:
                                                                Color.fromARGB(
                                                                    255,
                                                                    172,
                                                                    43,
                                                                    41),
                                                          ),
                                                          spaceW(10),
                                                          const Text('Agotado'),
                                                        ],
                                                      ),
                                                spaceH(10),
                                              ],
                                            ),
                                          ),
                                          Center(
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.white,
                                                    side: const BorderSide(
                                                      color: primaryColor,
                                                      width: 1,
                                                    )),
                                                onPressed: () {
                                                  controller.amount(0);
                                                  Get.bottomSheet(
                                                      Container(
                                                          decoration: const BoxDecoration(
                                                              color:
                                                                  Colors.white,
                                                              borderRadius: BorderRadius.only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          10),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          10))),
                                                          child: detailSell(
                                                              screenSize,
                                                              index)),
                                                      backgroundColor:
                                                          Colors.transparent);
                                                },
                                                child: const SizedBox(
                                                  width: double.maxFinite,
                                                  child: Center(
                                                    child: Text(
                                                      'Agregar al carro',
                                                      style: TextStyle(
                                                          color: primaryColor),
                                                    ),
                                                  ),
                                                )),
                                          )
                                        ]),
                                  )
                                ],
                              ))
                          : const Center(
                              child: CircularProgressIndicator(),
                            ))
                  : const Center(
                      child: CircularProgressIndicator(),
                    )),
            ),
          ],
        ));
  }

  Widget detailSell(final screenSize, int index) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 25, 25, 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            children: [
              Image.network(
                'http://34.133.92.25${controller.productList[index].attributes!.image!.data![0].attributes!.url}',
                height: screenSize.height * 0.1,
              ),
              spaceW(25),
              Text('S/. ${controller.productList[index].attributes!.price}',
                  style: const TextStyle(
                      fontSize: 20,
                      color: secondaryTextColor,
                      fontWeight: FontWeight.bold))
            ],
          ),
          spaceH(10),
          Text(
              'Nombre: ${controller.productList[index].attributes!.description}'),
          spaceH(25),
          spaceH(25),
          const Text(
            'Cantidad:',
            style: TextStyle(color: secondaryTextColor),
          ),
          spaceH(5),
          Row(
            children: [
              Obx((() => GestureDetector(
                    onTap: () => controller.reduceAmount(),
                    child: CircleAvatar(
                      backgroundColor: (controller.amount.value == 0)
                          ? const Color.fromARGB(135, 163, 163, 163)
                          : const Color.fromARGB(136, 58, 58, 58),
                      child: const Text(
                        '-',
                        style: TextStyle(color: Colors.white),
                      ),
                      radius: 10,
                    ),
                  ))),
              spaceW(10),
              Obx(() {
                return Text('${controller.amount.value}',
                    style: const TextStyle(color: primaryColor));
              }),
              spaceW(10),
              Obx(() => GestureDetector(
                    onTap: () => controller.amount.value !=
                            controller.productList[index].attributes!.stock
                        ? controller.addAmount()
                        : null,
                    child: CircleAvatar(
                      backgroundColor: (controller.amount.value ==
                              controller.productList[index].attributes!.stock)
                          ? const Color.fromARGB(135, 163, 163, 163)
                          : const Color.fromARGB(136, 58, 58, 58),
                      child: const Text(
                        '+',
                        style: TextStyle(color: Colors.white),
                      ),
                      radius: 10,
                    ),
                  )),
              spaceW(10),
              Text(
                  '${controller.productList[index].attributes!.stock} disponible',
                  style: const TextStyle(color: secondaryTextColor))
            ],
          ),
          spaceH(25),
          SizedBox(
            height: 40,
            width: double.maxFinite,
            child: Obx(() => ElevatedButton(
                  onPressed:
                      controller.productList[index].attributes!.stock! > 0 &&
                              controller.amount > 0
                          ? () => controller.addProductshop(index)
                          : null,
                  child: const Text('Agregar'),
                )),
          )
        ],
      ),
    );
  }

  Widget spaceH(double height) {
    return SizedBox(height: height);
  }

  Widget spaceW(double width) {
    return SizedBox(width: width);
  }
}
