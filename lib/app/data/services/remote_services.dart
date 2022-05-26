import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:mecanicawinder/app/data/models/post_model.dart';

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

      print(response.headers);
      return null;
    }
  }
}
