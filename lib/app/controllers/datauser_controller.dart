// To parse this JSON data, do
//
//     final userClient = userClientFromJson(jsonString);

import 'dart:convert';

UserClient userClientFromJson(String str) =>
    UserClient.fromJson(json.decode(str));

String userClientToJson(UserClient data) => json.encode(data.toJson());

class UserClient {
  UserClient({
    this.id,
    this.username,
    this.email,
    this.provider,
    this.name,
    this.role,
    this.imageProfile,
  });

  int? id;
  String? username;
  String? email;
  String? provider;
  String? name;
  Role? role;
  ImageProfile? imageProfile;

  factory UserClient.fromJson(Map<String, dynamic> json) => UserClient(
        id: json["id"] == null ? null : json["id"],
        username: json["username"] == null ? null : json["username"],
        email: json["email"] == null ? null : json["email"],
        provider: json["provider"] == null ? null : json["provider"],
        name: json["name"] == null ? null : json["name"],
        role: json["role"] == null ? null : Role.fromJson(json["role"]),
        imageProfile: json["image_profile"] == null
            ? null
            : ImageProfile.fromJson(json["image_profile"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "username": username == null ? null : username,
        "email": email == null ? null : email,
        "provider": provider == null ? null : provider,
        "name": name == null ? null : name,
        "role": role == null ? null : role?.toJson(),
        "image_profile": imageProfile == null ? null : imageProfile?.toJson(),
      };
}

class ImageProfile {
  ImageProfile({
    this.id,
    this.name,
    this.size,
    this.url,
  });

  int? id;
  String? name;
  double? size;
  String? url;

  factory ImageProfile.fromJson(Map<String, dynamic> json) => ImageProfile(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        size: json["size"] == null ? null : json["size"].toDouble(),
        url: json["url"] == null ? null : json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "size": size == null ? null : size,
        "url": url == null ? null : url,
      };
}

class Role {
  Role({
    this.id,
    this.name,
    this.description,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  String? description;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Role.fromJson(Map<String, dynamic> json) => Role(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        description: json["description"] == null ? null : json["description"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "description": description == null ? null : description,
        "createdAt": createdAt == null ? null : createdAt?.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt?.toIso8601String(),
      };
}
