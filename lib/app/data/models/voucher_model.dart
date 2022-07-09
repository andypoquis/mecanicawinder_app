// To parse this JSON data, do
//
//     final voucher = voucherFromJson(jsonString);

import 'dart:convert';

Voucher voucherFromJson(String str) => Voucher.fromJson(json.decode(str));

String voucherToJson(Voucher data) => json.encode(data.toJson());

class Voucher {
  Voucher({
    this.data,
  });

  List<VoucherData>? data;

  factory Voucher.fromJson(Map<String, dynamic> json) => Voucher(
        data: List<VoucherData>.from(
            json["data"].map((x) => VoucherData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class VoucherData {
  VoucherData({
    this.id,
    this.attributes,
  });

  int? id;
  VoucherDataAttributes? attributes;

  factory VoucherData.fromJson(Map<String, dynamic> json) => VoucherData(
        id: json["id"],
        attributes: VoucherDataAttributes.fromJson(json["attributes"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "attributes": attributes!.toJson(),
      };
}

class VoucherDataAttributes {
  VoucherDataAttributes({
    this.code,
    this.ispaid,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.pdf,
    this.client,
  });

  String? code;
  bool? ispaid;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? publishedAt;
  Pdf? pdf;
  Client? client;

  factory VoucherDataAttributes.fromJson(Map<String, dynamic> json) =>
      VoucherDataAttributes(
        code: json["code"],
        ispaid: json["ispaid"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        publishedAt: DateTime.parse(json["publishedAt"]),
        pdf: Pdf.fromJson(json["pdf"]),
        client: Client.fromJson(json["client"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "ispaid": ispaid,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "publishedAt": publishedAt!.toIso8601String(),
        "pdf": pdf!.toJson(),
        "client": client!.toJson(),
      };
}

class Client {
  Client({
    this.data,
  });

  ClientData? data;

  factory Client.fromJson(Map<String, dynamic> json) => Client(
        data: ClientData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data!.toJson(),
      };
}

class ClientData {
  ClientData({
    this.id,
    this.attributes,
  });

  int? id;
  PurpleAttributes? attributes;

  factory ClientData.fromJson(Map<String, dynamic> json) => ClientData(
        id: json["id"],
        attributes: PurpleAttributes.fromJson(json["attributes"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "attributes": attributes!.toJson(),
      };
}

class PurpleAttributes {
  PurpleAttributes({
    this.username,
    this.email,
    this.provider,
    this.confirmed,
    this.blocked,
    this.name,
  });

  String? username;
  String? email;
  String? provider;
  bool? confirmed;
  bool? blocked;
  String? name;

  factory PurpleAttributes.fromJson(Map<String, dynamic> json) =>
      PurpleAttributes(
        username: json["username"],
        email: json["email"],
        provider: json["provider"],
        confirmed: json["confirmed"],
        blocked: json["blocked"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        "provider": provider,
        "confirmed": confirmed,
        "blocked": blocked,
        "name": name,
      };
}

class Pdf {
  Pdf({
    this.data,
  });

  PdfData? data;

  factory Pdf.fromJson(Map<String, dynamic> json) => Pdf(
        data: PdfData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data!.toJson(),
      };
}

class PdfData {
  PdfData({
    this.id,
    this.attributes,
  });

  int? id;
  FluffyAttributes? attributes;

  factory PdfData.fromJson(Map<String, dynamic> json) => PdfData(
        id: json["id"],
        attributes: FluffyAttributes.fromJson(json["attributes"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "attributes": attributes!.toJson(),
      };
}

class FluffyAttributes {
  FluffyAttributes({
    this.name,
    this.url,
    this.createdAt,
    this.updatedAt,
  });

  String? name;
  String? url;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory FluffyAttributes.fromJson(Map<String, dynamic> json) =>
      FluffyAttributes(
        name: json["name"],
        url: json["url"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
      };
}
