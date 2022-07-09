import 'dart:ui';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mecanicawinder/app/ui/theme/color.dart';
import '../../../controllers/profileclient_controller.dart';

class ProfileclientPage extends GetView<ProfileclientController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
          height: 50,
          width: 125,
          child: ElevatedButton(
              onPressed: () => controller.fetcPutUser(),
              child: const Center(
                  child: Text(
                'Editar',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                ),
              )))),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Obx(() => controller.isLoading.value
              ? bodyWidgets(context)
              : const Center(
                  child: CircularProgressIndicator(),
                )),
        ),
      ),
    );
  }

  Widget bodyWidgets(context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Obx(() => Image.network(
                      controller.imageProfile.value,
                      height: 50,
                      width: 50,
                      fit: BoxFit.fill,
                    )),
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    controller.nameCtrl.text,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const Text(
                    'Cliente',
                    style: TextStyle(color: Colors.black87),
                  ),
                ],
              ),
              Expanded(child: Container()),
              Center(
                  child: IconButton(
                      onPressed: () => controller.logout(),
                      icon: const Icon(Icons.logout))),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          const Text(
            'Nombre completo',
            style: TextStyle(
                color: Color(0xff545E64),
                fontSize: 14,
                fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 40,
            color: Colors.white,
            child: TextField(
                controller: controller.nameCtrl,
                keyboardType: TextInputType.emailAddress,
                decoration:
                    const InputDecoration(border: OutlineInputBorder())),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Usaurio',
            style: TextStyle(
                color: Color(0xff545E64),
                fontSize: 14,
                fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 40,
            color: Colors.white,
            child: TextField(
                controller: controller.userCtrl,
                keyboardType: TextInputType.emailAddress,
                decoration:
                    const InputDecoration(border: OutlineInputBorder())),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Email',
            style: TextStyle(
                color: Color(0xff545E64),
                fontSize: 14,
                fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 40,
            color: Colors.white,
            child: TextField(
                controller: controller.emailCtrl,
                keyboardType: TextInputType.emailAddress,
                decoration:
                    const InputDecoration(border: OutlineInputBorder())),
          ),
          const SizedBox(
            height: 20,
          ),
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Obx(() => !controller.isImage.value
                    ? Image.network(
                        controller.imageProfile.value,
                        height: 150,
                      )
                    : Image.file(controller.imageFile, height: 150)),
              ),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: CircleAvatar(
                    backgroundColor: Colors.white60,
                    child: IconButton(
                        onPressed: () => controller.pickImage(),
                        icon: const Icon(
                          Icons.add_a_photo,
                          color: Colors.black38,
                        ))),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  side: const BorderSide(
                    color: primaryColor,
                    width: 1,
                  )),
              onPressed: () {
                Get.bottomSheet(
                    Container(
                      padding: EdgeInsets.all(10),
                      height: 250,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: 40,
                            color: Colors.white,
                            child: TextField(
                                controller: controller.passCtrl,
                                obscureText: true,
                                decoration: const InputDecoration(
                                    hintText: "Nueva Cotraseña",
                                    border: OutlineInputBorder())),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 40,
                            color: Colors.white,
                            child: TextField(
                                controller: controller.pass2Ctrl,
                                obscureText: true,
                                decoration: const InputDecoration(
                                    hintText: "Repetir Cotraseña",
                                    border: OutlineInputBorder())),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              AwesomeDialog(
                                context: context,
                                dialogType: DialogType.QUESTION,
                                animType: AnimType.BOTTOMSLIDE,
                                title: 'Cambiar contraseña',
                                desc:
                                    '¿Está seguro que quiere cambiar su contraseña?',
                                btnCancelOnPress: () {},
                                btnOkOnPress: () => controller.changePassword(),
                              ).show();
                            },
                            child: const Text('Cambiar contraseña'),
                          )
                        ],
                      ),
                    ),
                    backgroundColor: Colors.white);
              },
              child: const SizedBox(
                width: double.maxFinite,
                child: Center(
                  child: Text(
                    'Cambiar contraseña',
                    style: TextStyle(color: primaryColor),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
