import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mecanicawinder/app/ui/theme/color.dart';
import '../../../controllers/register_controller.dart';

class RegisterPage extends GetView<RegisterController> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.05),
          child: ListView(
            children: [
              spaceH(screenSize.height * 0.05),
              spaceH(25),
              const Text(
                'Registrar',
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
              spaceH(25),
              const Text(
                'Nombre completo',
                style: TextStyle(
                    color: Color(0xff545E64),
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
              spaceH(10),
              Container(
                color: Colors.white,
                child: TextField(
                    controller: controller.nameController,
                    keyboardType: TextInputType.emailAddress,
                    decoration:
                        const InputDecoration(border: OutlineInputBorder())),
              ),
              spaceH(20),
              const Text(
                'Nombre Usuario',
                style: TextStyle(
                    color: Color(0xff545E64),
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
              spaceH(10),
              Container(
                color: Colors.white,
                child: TextField(
                    controller: controller.usernameController,
                    decoration:
                        const InputDecoration(border: OutlineInputBorder())),
              ),
              spaceH(20),
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
                    keyboardType: TextInputType.emailAddress,
                    controller: controller.emailController,
                    decoration:
                        const InputDecoration(border: OutlineInputBorder())),
              ),
              spaceH(10),
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
              spaceH(50),
              SizedBox(
                height: 45,
                child: Obx(() => ElevatedButton(
                    onPressed: (!controller.isLoading.value)
                        ? () => controller.fetchRegister()
                        : null,
                    child: Center(
                        child: (!controller.isLoading.value)
                            ? const Text(
                                'Registrarse',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                ),
                              )
                            : const CircularProgressIndicator(
                                color: Colors.white,
                              )))),
              ),
              spaceH(10),
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
