import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/profileclient_controller.dart';

class ProfileclientPage extends GetView<ProfileclientController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ProfileclientPage'),
      ),
      body: SafeArea(
        child: Center(
            child: IconButton(
                onPressed: () => controller.logout(),
                icon: const Icon(Icons.logout))),
      ),
    );
  }
}
