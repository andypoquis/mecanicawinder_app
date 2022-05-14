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
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: sizeScreen.width * 0.05,
              vertical: sizeScreen.height * 0.025),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
          '¡Bienvenido!, Andrés',
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
                  width: 1000,
                );
              },
              options: CarouselOptions(
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                  aspectRatio: 2.0,
                  viewportFraction: 1.0,
                  enlargeCenterPage: false,
                  height: 350),
            )
          : const Center(
              child: CircularProgressIndicator(),
            )),
    );
  }

  Widget myServicesWidget() {
    return Column(
      children: [
        const Text('Estado de mis servicios:',
            style: TextStyle(
                color: secondaryTextColor, fontWeight: FontWeight.w400)),
      ],
    );
  }
}
