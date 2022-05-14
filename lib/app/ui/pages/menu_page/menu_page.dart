import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/menu_controller.dart';
import '../home_page/home_page.dart';
import '../product_page/product_page.dart';

class MenuPage extends GetView<MenuController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          backgroundColor: Colors.white,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Inicio',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home_repair_service),
              label: 'Servicios',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.inventory),
              label: 'Productos',
            ),
          ],
          currentIndex: controller.currentIndex.value,
          onTap: (value) {
            controller.currentIndex(value);
          },
        ),
      ),
      body: SafeArea(
        child: _selectPage(),
      ),
    );
  }

  Widget _selectPage() {
    return Obx(() {
      switch (controller.currentIndex.value) {
        case 0:
          return HomePage();
        case 2:
          return ProductPage();
        default:
          return Container();
      }
    });
  }
}
