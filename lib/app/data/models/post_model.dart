// To parse this JSON data, do
//
//     final Postlist = PostlistFromJson(jsonString);

import 'dart:convert';

Postlist postlistFromJson(String str) => Postlist.fromJson(json.decode(str));

String postlistToJson(Postlist data) => json.encode(data.toJson());

class Postlist {
  Postlist({
    this.data,
    this.meta,
  });

  Data? data;
  Meta? meta;

  factory Postlist.fromJson(Map<String, dynamic> json) => Postlist(
        data: Data.fromJson(json["data"]),
        meta: Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "meta": meta?.toJson(),
      };
}

class Data {
  Data({
    this.id,
    this.attributes,
  });

  int? id;
  DataAttributes? attributes;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        attributes: DataAttributes.fromJson(json["attributes"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "attributes": attributes?.toJson(),
      };
}

class DataAttributes {
  DataAttributes({
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.imagePost,
  });

  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? publishedAt;
  ImagePost? imagePost;

  factory DataAttributes.fromJson(Map<String, dynamic> json) => DataAttributes(
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        publishedAt: DateTime.parse(json["publishedAt"]),
        imagePost: ImagePost.fromJson(json["image_post"]),
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "publishedAt": publishedAt!.toIso8601String(),
        "image_post": imagePost!.toJson(),
      };
}

class ImagePost {
  ImagePost({
    this.data,
  });

  List<Datum>? data;

  factory ImagePost.fromJson(Map<String, dynamic> json) => ImagePost(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.id,
    this.attributes,
  });

  int? id;
  DatumAttributes? attributes;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        attributes: DatumAttributes.fromJson(json["attributes"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "attributes": attributes!.toJson(),
      };
}

class DatumAttributes {
  DatumAttributes({
    this.name,
    this.alternativeText,
    this.caption,
    this.width,
    this.height,
    this.formats,
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
  Formats? formats;
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

  factory DatumAttributes.fromJson(Map<String, dynamic> json) =>
      DatumAttributes(
        name: json["name"],
        alternativeText: json["alternativeText"],
        caption: json["caption"],
        width: json["width"],
        height: json["height"],
        formats: Formats.fromJson(json["formats"]),
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
        "formats": formats?.toJson(),
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

class Formats {
  Formats({
    this.small,
    this.thumbnail,
    this.medium,
  });

  Small? small;
  Small? thumbnail;
  Small? medium;

  factory Formats.fromJson(Map<String, dynamic> json) => Formats(
        small: Small.fromJson(json["small"]),
        thumbnail: Small.fromJson(json["thumbnail"]),
        medium: json["medium"] == null ? null : Small.fromJson(json["medium"]),
      );

  Map<String, dynamic> toJson() => {
        "small": small!.toJson(),
        "thumbnail": thumbnail!.toJson(),
        // ignore: prefer_null_aware_operators
        "medium": medium == null ? null : medium?.toJson(),
      };
}

class Small {
  Small({
    this.ext,
    this.url,
    this.hash,
    this.mime,
    this.name,
    this.path,
    this.size,
    this.width,
    this.height,
  });

  String? ext;
  String? url;
  String? hash;
  String? mime;
  String? name;
  dynamic? path;
  double? size;
  int? width;
  int? height;

  factory Small.fromJson(Map<String, dynamic> json) => Small(
        ext: json["ext"],
        url: json["url"],
        hash: json["hash"],
        mime: json["mime"],
        name: json["name"],
        path: json["path"],
        size: json["size"].toDouble(),
        width: json["width"],
        height: json["height"],
      );

  Map<String, dynamic> toJson() => {
        "ext": ext,
        "url": url,
        "hash": hash,
        "mime": mime,
        "name": name,
        "path": path,
        "size": size,
        "width": width,
        "height": height,
      };
}

class Meta {
  Meta();

  factory Meta.fromJson(Map<String, dynamic> json) => Meta();

  Map<String, dynamic> toJson() => {};
}
