import 'dart:convert';

ClientService clientServiceFromJson(String str) =>
    ClientService.fromJson(json.decode(str));

String clientServiceToJson(ClientService data) => json.encode(data.toJson());

class ClientService {
  ClientService({
    this.data,
    this.meta,
  });

  List<ClientServicData>? data;
  Meta? meta;

  factory ClientService.fromJson(Map<String, dynamic> json) => ClientService(
        data: List<ClientServicData>.from(
            json["data"].map((x) => ClientServicData.fromJson(x))),
        meta: Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "meta": meta!.toJson(),
      };
}

class ClientServicData {
  ClientServicData({
    this.id,
    this.attributes,
  });

  int? id;
  DatumAttributes? attributes;

  factory ClientServicData.fromJson(Map<String, dynamic> json) =>
      ClientServicData(
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
    this.state,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.clientService,
    this.technicalService,
    this.image,
    this.service,
  });

  int? state;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? publishedAt;
  Service? clientService;
  Service? technicalService;
  Image? image;
  ServiceClass? service;

  factory DatumAttributes.fromJson(Map<String, dynamic> json) =>
      DatumAttributes(
        state: json["state"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        publishedAt: DateTime.parse(json["publishedAt"]),
        clientService: Service.fromJson(json["client_service"]),
        technicalService: Service.fromJson(json["technical_service"]),
        image: Image.fromJson(json["image"]),
        service: ServiceClass.fromJson(json["service"]),
      );

  Map<String, dynamic> toJson() => {
        "state": state,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "publishedAt": publishedAt!.toIso8601String(),
        "client_service": clientService!.toJson(),
        "technical_service": technicalService!.toJson(),
        "image": image!.toJson(),
        "service": service!.toJson(),
      };
}

class Service {
  Service({
    this.data,
  });

  ClientServiceData? data;

  factory Service.fromJson(Map<String, dynamic> json) => Service(
        data: json["data"] == null
            ? null
            : ClientServiceData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null ? null : data!.toJson(),
      };
}

class ClientServiceData {
  ClientServiceData({
    this.id,
    this.attributes,
  });

  int? id;
  PurpleAttributes? attributes;

  factory ClientServiceData.fromJson(Map<String, dynamic> json) =>
      ClientServiceData(
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
    this.createdAt,
    this.updatedAt,
  });

  String? username;
  String? email;
  Provider? provider;
  bool? confirmed;
  bool? blocked;
  String? name;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory PurpleAttributes.fromJson(Map<String, dynamic> json) =>
      PurpleAttributes(
        username: json["username"],
        email: json["email"],
        provider: providerValues.map[json["provider"]],
        confirmed: json["confirmed"],
        blocked: json["blocked"],
        name: json["name"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        "provider": providerValues.reverse[provider],
        "confirmed": confirmed,
        "blocked": blocked,
        "name": name,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
      };
}

enum Provider { LOCAL }

final providerValues = EnumValues({"local": Provider.LOCAL});

class Image {
  Image({
    this.data,
  });

  ImageData? data;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        data: ImageData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data!.toJson(),
      };
}

class ImageData {
  ImageData({
    this.id,
    this.attributes,
  });

  int? id;
  FluffyAttributes? attributes;

  factory ImageData.fromJson(Map<String, dynamic> json) => ImageData(
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
  dynamic alternativeText;
  dynamic caption;
  int? width;
  int? height;
  Formats? formats;
  String? hash;
  Ext? ext;
  Mime? mime;
  double? size;
  String? url;
  dynamic previewUrl;
  Provider? provider;
  dynamic providerMetadata;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory FluffyAttributes.fromJson(Map<String, dynamic> json) =>
      FluffyAttributes(
        name: json["name"],
        alternativeText: json["alternativeText"],
        caption: json["caption"],
        width: json["width"],
        height: json["height"],
        formats:
            json["formats"] == null ? null : Formats.fromJson(json["formats"]),
        hash: json["hash"],
        ext: extValues.map[json["ext"]],
        mime: mimeValues.map[json["mime"]],
        size: json["size"].toDouble(),
        url: json["url"],
        previewUrl: json["previewUrl"],
        provider: providerValues.map[json["provider"]],
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
        "formats": formats == null ? null : formats!.toJson(),
        "hash": hash,
        "ext": extValues.reverse[ext],
        "mime": mimeValues.reverse[mime],
        "size": size,
        "url": url,
        "previewUrl": previewUrl,
        "provider": providerValues.reverse[provider],
        "provider_metadata": providerMetadata,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
      };
}

enum Ext { JPG }

final extValues = EnumValues({".jpg": Ext.JPG});

class Formats {
  Formats({
    this.small,
    this.medium,
    this.thumbnail,
  });

  Medium? small;
  Medium? medium;
  Medium? thumbnail;

  factory Formats.fromJson(Map<String, dynamic> json) => Formats(
        small: Medium.fromJson(json["small"]),
        medium: Medium.fromJson(json["medium"]),
        thumbnail: Medium.fromJson(json["thumbnail"]),
      );

  Map<String, dynamic> toJson() => {
        "small": small!.toJson(),
        "medium": medium!.toJson(),
        "thumbnail": thumbnail!.toJson(),
      };
}

class Medium {
  Medium({
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

  Ext? ext;
  String? url;
  String? hash;
  Mime? mime;
  String? name;
  dynamic? path;
  double? size;
  int? width;
  int? height;

  factory Medium.fromJson(Map<String, dynamic> json) => Medium(
        ext: extValues.map[json["ext"]],
        url: json["url"],
        hash: json["hash"],
        mime: mimeValues.map[json["mime"]],
        name: json["name"],
        path: json["path"],
        size: json["size"].toDouble(),
        width: json["width"],
        height: json["height"],
      );

  Map<String, dynamic> toJson() => {
        "ext": extValues.reverse[ext],
        "url": url,
        "hash": hash,
        "mime": mimeValues.reverse[mime],
        "name": name,
        "path": path,
        "size": size,
        "width": width,
        "height": height,
      };
}

enum Mime { IMAGE_JPEG }

final mimeValues = EnumValues({"image/jpeg": Mime.IMAGE_JPEG});

class ServiceClass {
  ServiceClass({
    this.data,
  });

  ServiceData? data;

  factory ServiceClass.fromJson(Map<String, dynamic> json) => ServiceClass(
        data: ServiceData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data!.toJson(),
      };
}

class ServiceData {
  ServiceData({
    this.id,
    this.attributes,
  });

  int? id;
  TentacledAttributes? attributes;

  factory ServiceData.fromJson(Map<String, dynamic> json) => ServiceData(
        id: json["id"],
        attributes: TentacledAttributes.fromJson(json["attributes"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "attributes": attributes!.toJson(),
      };
}

class TentacledAttributes {
  TentacledAttributes({
    this.name,
    this.description,
    this.price,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
  });

  String? name;
  String? description;
  double? price;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? publishedAt;

  factory TentacledAttributes.fromJson(Map<String, dynamic> json) =>
      TentacledAttributes(
        name: json["name"],
        description: json["description"],
        price: json["price"].toDouble(),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        publishedAt: DateTime.parse(json["publishedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "price": price,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "publishedAt": publishedAt!.toIso8601String(),
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

class EnumValues<T> {
  late Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
