import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:mecanicawinder/app/controllers/datauser_controller.dart';
import 'package:mecanicawinder/app/data/models/client_Service.dart';
import 'package:mecanicawinder/app/data/models/post_model.dart';
import 'package:mecanicawinder/app/data/models/request_data/newuser_model.dart';
import 'package:mecanicawinder/app/data/models/services_model.dart';
import 'package:mecanicawinder/app/data/models/voucher_model.dart';

import '../models/auth_model.dart';
import '../models/productlist_model.dart';

class RemoteServices {
  static var client = http.Client();

  static Future<Auth?> fetchAuth(
      String email, String password, String url) async {
    Map<String, String> requestHeaders = {
      "Content-Type": "application/json; charset=utf-8"
    };
    var body = jsonEncode({"identifier": email, "password": password});

    var response =
        await client.post(Uri.parse(url), body: body, headers: requestHeaders);

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return authFromJson(jsonString);
    } else {
      if (response.statusCode == 400) {
        Fluttertoast.showToast(
            msg: "Datos incorrectos",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: const Color(0xffF67878),
            textColor: Colors.white,
            fontSize: 16.0);
      }
      return null;
    }
  }

  static Future<NewUser?> fetchRegister(String name, String username,
      String email, String password, String url) async {
    Map<String, String> requestHeaders = {
      "Content-Type": "application/json; charset=utf-8"
    };
    var body = jsonEncode({
      "blocked": false,
      "confirmed": true,
      "name": name,
      "username": username,
      "email": email,
      "password": password,
      "role": 5
    });

    var response =
        await client.post(Uri.parse(url), body: body, headers: requestHeaders);

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return NewUserFromJson(jsonString);
    } else {
      if (response.statusCode == 400) {
        Fluttertoast.showToast(
            msg: "El registro no se pudo completar",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: const Color(0xffF67878),
            textColor: Colors.white,
            fontSize: 16.0);
      }
      return null;
    }
  }

  static Future<Productlist?> fetchListProduct(String url, String token) async {
    Map<String, String> requestHeaders = {
      "Content-Type": "application/json; charset=utf-8",
      "Authorization": "Bearer $token"
    };

    var response = await client.get(Uri.parse(url), headers: requestHeaders);

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return productlistFromJson(jsonString);
    } else {
      print(response.statusCode);
      print(response.body);
      return null;
    }
  }

  static Future<Services?> fetchListServices(String url, String token) async {
    Map<String, String> requestHeaders = {
      "Content-Type": "application/json; charset=utf-8",
      "Authorization": "Bearer $token"
    };

    var response = await client.get(Uri.parse(url), headers: requestHeaders);

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return servicesFromJson(jsonString);
    } else {
      return null;
    }
  }

  static Future<Postlist?> fetchPosts(String url, String token) async {
    Map<String, String> requestHeaders = {
      "Content-Type": "application/json; charset=utf-8",
      "Authorization": "Bearer $token"
    };
    var response = await client.get(Uri.parse(url), headers: requestHeaders);
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return postlistFromJson(jsonString);
    } else {
      print(response.statusCode);
      return null;
    }
  }

  static Future fetchVaucher(
      String code, int pdf, String url, int idClient, String token) async {
    Map<String, String> requestHeaders = {
      "Content-Type": "application/json; charset=utf-8",
      "Authorization": "Bearer $token"
    };
    var body = jsonEncode({
      "data": {"code": code, "pdf": pdf, "client": idClient}
    });

    var response =
        await client.post(Uri.parse(url), body: body, headers: requestHeaders);

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return jsonString;
    } else {
      if (response.statusCode == 400) {
        Fluttertoast.showToast(
            msg: "Error a procesar su pedido",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: const Color(0xffF67878),
            textColor: Colors.white,
            fontSize: 16.0);
      }
      return null;
    }
  }

  static Future fetchServiceClient(int idClient, int idService, int idImage,
      String url, String token) async {
    Map<String, String> requestHeaders = {
      "Content-Type": "application/json; charset=utf-8",
      "Authorization": "Bearer $token"
    };
    var body = jsonEncode({
      "data": {
        "client_service": idClient,
        "state": 0,
        "image": idImage,
        "service": idService
      }
    });

    var response =
        await client.post(Uri.parse(url), body: body, headers: requestHeaders);

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return jsonString;
    } else {
      if (response.statusCode == 400) {
        Fluttertoast.showToast(
            msg: "Error a procesar su pedido",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: const Color(0xffF67878),
            textColor: Colors.white,
            fontSize: 16.0);
      }
      return null;
    }
  }

  static Future<ClientService?> fetchClientServices(
      String url, String token) async {
    Map<String, String> requestHeaders = {
      "Content-Type": "application/json; charset=utf-8",
      "Authorization": "Bearer $token"
    };

    var response = await client.get(Uri.parse(url), headers: requestHeaders);

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return clientServiceFromJson(jsonString);
    } else {
      return null;
    }
  }

  static Future<UserClient?> fetchUsers(String url, String token) async {
    Map<String, String> requestHeaders = {
      "Content-Type": "application/json; charset=utf-8",
      "Authorization": "Bearer $token"
    };

    var response = await client.get(Uri.parse(url), headers: requestHeaders);

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return userClientFromJson(jsonString);
    } else {
      return null;
    }
  }

  static Future<Voucher?> fetchVoucher(String url, String token) async {
    Map<String, String> requestHeaders = {
      "Content-Type": "application/json; charset=utf-8",
      "Authorization": "Bearer $token"
    };

    var response = await client.get(Uri.parse(url), headers: requestHeaders);

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return voucherFromJson(jsonString);
    } else {
      return null;
    }
  }

  static Future fetchPutUser(String name, String user, String email, int idImg,
      String url, String token) async {
    Map<String, String> requestHeaders = {
      "Content-Type": "application/json; charset=utf-8",
      "Authorization": "Bearer $token"
    };
    print(name);
    var body = jsonEncode({
      "username": user,
      "name": name,
      "email": email,
      "image_profile": idImg,
    });

    var response =
        await client.put(Uri.parse(url), body: body, headers: requestHeaders);

    if (response.statusCode == 200) {
      var jsonString = response.body;
      print(jsonString);
      return jsonString;
    } else {
      if (response.statusCode == 400) {
        Fluttertoast.showToast(
            msg: "Error",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: const Color(0xffF67878),
            textColor: Colors.white,
            fontSize: 16.0);
      }
      return null;
    }
  }

  static Future fetchPutUserPassword(
      String pass01, pass02, String url, String token) async {
    Map<String, String> requestHeaders = {
      "Content-Type": "application/json; charset=utf-8",
      "Authorization": "Bearer $token"
    };

    if (pass01 != pass02) {
      Fluttertoast.showToast(
          msg: "Las contraseñas no coinciden",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: const Color(0xffF67878),
          textColor: Colors.white,
          fontSize: 16.0);
    }

    var body = jsonEncode({
      "password": pass01,
    });

    var response =
        await client.put(Uri.parse(url), body: body, headers: requestHeaders);

    if (response.statusCode == 200) {
      var jsonString = response.body;

      return jsonString;
    } else {
      if (response.statusCode == 400) {
        Fluttertoast.showToast(
            msg: "Error",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: const Color(0xffF67878),
            textColor: Colors.white,
            fontSize: 16.0);
      }
      return null;
    }
  }
}
