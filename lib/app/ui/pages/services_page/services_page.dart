import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mecanicawinder/app/ui/theme/color.dart';
import '../../../controllers/services_controller.dart';

class ServicesPage extends GetView<ServicesController> {
  final _controller = Get.put(ServicesController());

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            foregroundColor: primaryTextColor,
            title: const Text('Servicios'),
            actions: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.search,
                        color: primaryTextColor,
                      )),
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
                                      'http://34.133.92.25${controller.productList[index].attributes!.image!.data!.attributes!.url}',
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
                                                Row(
                                                  children: [
                                                    const CircleAvatar(
                                                      maxRadius: 7,
                                                      backgroundColor:
                                                          Color.fromARGB(255,
                                                              41, 172, 108),
                                                    ),
                                                    spaceW(10),
                                                    const Text('Disponible'),
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
                                                onPressed: () {},
                                                child: const SizedBox(
                                                  width: double.maxFinite,
                                                  child: Center(
                                                    child: Text(
                                                      'Pedir servicio',
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

  Widget spaceH(double height) {
    return SizedBox(height: height);
  }

  Widget spaceW(double width) {
    return SizedBox(width: width);
  }
}
