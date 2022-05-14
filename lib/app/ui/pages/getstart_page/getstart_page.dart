import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/getstart_controller.dart';

class GetstartPage extends GetView<GetstartController> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Ahorra tiempo en reserva nuestro servicio',
                  style: TextStyle(
                      color: Color(0xff212529),
                      fontSize: 36,
                      fontWeight: FontWeight.w900),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'La mejor oplicación para pedir tus un servicio y productos de calidad para su automovil.',
                  style: TextStyle(
                      color: Color(0xff545E64),
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 40,
                ),
                Center(
                  child: Image.asset(
                    'assets/getstart.png',
                    height: screenSize.height * 0.35,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                SizedBox(
                  height: 45,
                  child: ElevatedButton(
                      onPressed: () => controller.navigatorAuthPage(),
                      child: /* Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text('Continuar'),
                            Icon(Icons.navigate_next)
                          ],
                        ) */
                          const Center(
                              child: Text(
                        'Continuar',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                        ),
                      ))),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
