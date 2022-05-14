import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mecanicawinder/app/ui/theme/color.dart';
import '../../../controllers/auth_controller.dart';

class AuthPage extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.05),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /*   Center(
                child: Image.asset(
                  'assets/logo.png',
                  height: screenSize.height * 0.15,
                ),
              ), */
              spaceH(screenSize.height * 0.05),
              ElevatedButton(
                  onPressed: () {},
                  child: const Icon(Icons.arrow_back_ios_new)),
              Expanded(
                child: Container(),
              ),
              spaceH(25),
              const Text(
                'Bienvenido',
                style: TextStyle(
                    color: Color(0xff212529),
                    fontSize: 36,
                    fontWeight: FontWeight.w900),
              ),
              spaceH(10),
              const Text(
                'Ingresa tus credenciales para continuar',
                style: TextStyle(
                    color: Color(0xff545E64),
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
              Expanded(
                child: Container(),
              ),
              const Text(
                'Email',
                style: TextStyle(
                    color: Color(0xff545E64),
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
              spaceH(10),
              Container(
                color: Colors.white,
                child: TextField(
                    controller: controller.emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration:
                        const InputDecoration(border: OutlineInputBorder())),
              ),
              spaceH(20),
              const Text(
                'Contraseña',
                style: TextStyle(
                    color: Color(0xff545E64),
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
              spaceH(10),
              Container(
                color: Colors.white,
                child: TextField(
                    controller: controller.passwordController,
                    obscureText: true,
                    decoration:
                        const InputDecoration(border: OutlineInputBorder())),
              ),
              spaceH(5),
              SizedBox(
                width: screenSize.width,
                child: const Text(
                  '¿Has olvidado tu contraseña?',
                  style: TextStyle(
                    color: Color(0xff545E64),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
              Expanded(
                child: Container(),
              ),
              SizedBox(
                height: 45,
                child: Obx(() => ElevatedButton(
                    onPressed: (!controller.isLoading.value)
                        ? () => controller.fetchAuth()
                        : null,
                    child: /* Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: const [
                                            Text('Continuar'),
                                            Icon(Icons.navigate_next)
                                          ],
                                        ) */

                        Center(
                            child: (!controller.isLoading.value)
                                ? const Text(
                                    'Iniciar sesión',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                    ),
                                  )
                                : const CircularProgressIndicator(
                                    color: Colors.white,
                                  )))),
              ),
              spaceH(10),
              Center(
                  child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    '¿Aun no tienes una cuenta?',
                    style: TextStyle(color: Colors.black54),
                  ),
                  spaceW(5),
                  const Text(
                    'Registrate',
                    style: TextStyle(color: primaryTextColor),
                  ),
                ],
              )),
              Expanded(
                child: Container(),
              ),
            ],
          ),
        ),
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
