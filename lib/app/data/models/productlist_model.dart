// To parse this JSON data, do
//
//     final productlist = productlistFromJson(jsonString);

import 'dart:convert';

Productlist productlistFromJson(String str) =>
    Productlist.fromJson(json.decode(str));

String productlistToJson(Productlist data) => json.encode(data.toJson());

class Productlist {
  Productlist({
    this.data,
    this.meta,
  });

  List<ProductlistDatum>? data;
  Meta? meta;

  factory Productlist.fromJson(Map<String, dynamic> json) => Productlist(
        data: List<ProductlistDatum>.from(
            json["data"].map((x) => ProductlistDatum.fromJson(x))),
        meta: Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "meta": meta?.toJson(),
      };
}

class ProductlistDatum {
  ProductlistDatum({
    this.id,
    this.attributes,
  });

  int? id;
  PurpleAttributes? attributes;

  factory ProductlistDatum.fromJson(Map<String, dynamic> json) =>
      ProductlistDatum(
        id: json["id"],
        attributes: PurpleAttributes.fromJson(json["attributes"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "attributes": attributes?.toJson(),
      };
}

class PurpleAttributes {
  PurpleAttributes({
    this.name,
    this.description,
    this.stock,
    this.price,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.image,
  });

  String? name;
  String? description;
  int? stock;
  double? price;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? publishedAt;
  Image? image;

  factory PurpleAttributes.fromJson(Map<String, dynamic> json) =>
      PurpleAttributes(
        name: json["name"],
        description: json["description"],
        stock: json["stock"],
        price: json["price"].toDouble(),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        publishedAt: DateTime.parse(json["publishedAt"]),
        image: Image.fromJson(json["image"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "stock": stock,
        "price": price,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "publishedAt": publishedAt!.toIso8601String(),
        "image": image?.toJson(),
      };
}

class Image {
  Image({
    this.data,
  });

  List<ImageDatum>? data;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        data: List<ImageDatum>.from(
            json["data"].map((x) => ImageDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class ImageDatum {
  ImageDatum({
    this.id,
    this.attributes,
  });

  int? id;
  FluffyAttributes? attributes;

  factory ImageDatum.fromJson(Map<String, dynamic> json) => ImageDatum(
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
    this.alternativeText,
    this.caption,
    this.width,
    this.height,
    this.hash,
    this.ext,
    this.mime,
    this.size,
    this.url,
    this.previewUrl,
    this.provider,
    this.providerMetadata,
    this.createdAt,
    this.updatedAt,
  });

  String? name;
  String? alternativeText;
  String? caption;
  int? width;
  int? height;
  String? hash;
  String? ext;
  String? mime;
  double? size;
  String? url;
  dynamic? previewUrl;
  String? provider;
  dynamic? providerMetadata;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory FluffyAttributes.fromJson(Map<String, dynamic> json) =>
      FluffyAttributes(
        name: json["name"],
        alternativeText: json["alternativeText"],
        caption: json["caption"],
        width: json["width"],
        height: json["height"],
        hash: json["hash"],
        ext: json["ext"],
        mime: json["mime"],
        size: json["size"].toDouble(),
        url: json["url"],
        previewUrl: json["previewUrl"],
        provider: json["provider"],
        providerMetadata: json["provider_metadata"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "alternativeText": alternativeText,
        "caption": caption,
        "width": width,
        "height": height,
        "hash": hash,
        "ext": ext,
        "mime": mime,
        "size": size,
        "url": url,
        "previewUrl": previewUrl,
        "provider": provider,
        "provider_metadata": providerMetadata,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
      };
}

class Meta {
  Meta({
    this.pagination,
  });

  Pagination? pagination;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        pagination: Pagination.fromJson(json["pagination"]),
      );

  Map<String, dynamic> toJson() => {
        "pagination": pagination!.toJson(),
      };
}

class Pagination {
  Pagination({
    this.page,
    this.pageSize,
    this.pageCount,
    this.total,
  });

  int? page;
  int? pageSize;
  int? pageCount;
  int? total;

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        page: json["page"],
        pageSize: json["pageSize"],
        pageCount: json["pageCount"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "pageSize": pageSize,
        "pageCount": pageCount,
        "total": total,
      };
}
