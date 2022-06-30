import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mecanicawinder/app/ui/theme/color.dart';
import '../../../controllers/home_controller.dart';

class HomePage extends GetView<HomeController> {
  final _controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: sizeScreen.width * 0.05,
              vertical: sizeScreen.height * 0.025),
          child: ListView(
            children: [
              welcomeWidget(),
              spaceH(50),
              comuncationWidget(),
              spaceH(50),
              myServicesWidget()
            ],
          ),
        ),
      ),
    );
  }

  Widget welcomeWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          '¡Bienvenido!',
          style: TextStyle(
              color: primaryTextColor,
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
        GestureDetector(
          onTap: () => controller.navigationProfileClient(),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.network(
              'https://i.pinimg.com/736x/27/19/78/2719787bc16a7d027de64c23fda34296.jpg',
              height: 55,
            ),
          ),
        )
      ],
    );
  }

  Widget spaceH(double height) {
    return SizedBox(
      height: height,
    );
  }

  Widget spaceW(double width) {
    return SizedBox(
      height: width,
    );
  }

  Widget comuncationWidget() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Obx(() => (controller.postList.isNotEmpty)
          ? CarouselSlider.builder(
              itemCount: controller.postList.length,
              itemBuilder: (_, index, i) {
                return Image.network(
                  'http://34.133.92.25${controller.postList[index].attributes!.url}',
                  fit: BoxFit.contain,
                  width: 750,
                );
              },
              options: CarouselOptions(
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                  aspectRatio: 2.0,
                  viewportFraction: 1.0,
                  enlargeCenterPage: false,
                  height: 300),
            )
          : const Center(
              child: CircularProgressIndicator(),
            )),
    );
  }

  Widget myServicesWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Estado de mis servicios:',
            style: TextStyle(
                color: secondaryTextColor, fontWeight: FontWeight.w400)),
        const SizedBox(
          height: 25,
        ),
        Container(
          height: 150,
          child: Obx(() => ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.clientServiceList.length,
                itemBuilder: (BuildContext context, int index) {
                  return controller
                              .clientServiceList[index].attributes!.state! <=
                          2
                      ? Column(
                          children: [
                            GestureDetector(
                              onTap: () => Get.bottomSheet(
                                Container(
                                  padding: EdgeInsets.all(15),
                                  decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20))),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      spaceH(25),
                                      Text(
                                        "${controller.clientServiceList[index].attributes!.service!.data!.attributes!.name}",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(
                                                255, 22, 27, 64)),
                                      ),
                                      spaceH(25),
                                      Text(
                                          "${controller.clientServiceList[index].attributes?.technicalService?.data != null ? controller.clientServiceList[index].attributes!.technicalService!.data!.attributes!.name : '_'}",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromARGB(
                                                  189, 22, 27, 64))),
                                      spaceH(10),
                                      Text(
                                          controller
                                              .stateService(controller
                                                  .clientServiceList[index]
                                                  .attributes!
                                                  .state!)
                                              .value,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromARGB(
                                                  189, 22, 27, 64)))
                                    ],
                                  ),
                                ),
                                backgroundColor: Colors.transparent,
                                isScrollControlled: true,
                              ),
                              child: Container(
                                  padding: const EdgeInsets.all(8.0),
                                  width: 150,
                                  height: 150,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color(0xFF755470),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      colorFilter: ColorFilter.mode(
                                          Colors.black.withOpacity(0.2),
                                          BlendMode.dstATop),
                                      image: NetworkImage(
                                        'http://34.133.92.25${controller.clientServiceList[index].attributes!.image!.data!.attributes!.url!}',
                                      ),
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Center(
                                        child: Text(
                                          "${controller.clientServiceList[index].attributes!.service!.data!.attributes!.name}",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromARGB(
                                                  255, 242, 242, 242)),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        controller
                                            .stateService(controller
                                                .clientServiceList[index]
                                                .attributes!
                                                .state!)
                                            .value,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(
                                                221, 231, 233, 253)),
                                      ),
                                    ],
                                  )),
                            ),
                            const SizedBox(
                              width: 160,
                            )
                          ],
                        )
                      : Container();
                },
              )),
        ),
        const SizedBox(
          height: 25,
        ),
      ],
    );
  }
}
