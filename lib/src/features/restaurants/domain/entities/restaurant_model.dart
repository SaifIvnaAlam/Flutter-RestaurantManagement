import 'dart:convert';
import 'package:flutter/foundation.dart';

class RestaurantsModel {
  String id;

  String image;
  String createAt;
  String admin;
  Map<String, String>? members;
  RestaurantsModel({
    required this.id,
    required this.image,
    required this.createAt,
    required this.admin,
    this.members,
  });

  RestaurantsModel copyWith({
    String? id,
    String? image,
    String? createAt,
    String? admin,
    Map<String, String>? members,
  }) {
    return RestaurantsModel(
      id: id ?? this.id,
      image: image ?? this.image,
      createAt: createAt ?? this.createAt,
      admin: admin ?? this.admin,
      members: members ?? this.members,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'image': image});
    result.addAll({'createAt': createAt});
    result.addAll({'admin': admin});
    if (members != null) {
      result.addAll({'members': members});
    }

    return result;
  }

  factory RestaurantsModel.fromMap(Map<String, dynamic> map) {
    return RestaurantsModel(
      id: map['id'] ?? '',
      image: map['image'] ?? '',
      createAt: map['createAt'] ?? '',
      admin: map['admin'] ?? '',
      members: Map<String, String>.from(map['members']),
    );
  }

  String toJson() => json.encode(toMap());

  factory RestaurantsModel.fromJson(String source) =>
      RestaurantsModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'RestaurantsModel(id: $id, image: $image, createAt: $createAt, admin: $admin, members: $members)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RestaurantsModel &&
        other.id == id &&
        other.image == image &&
        other.createAt == createAt &&
        other.admin == admin &&
        mapEquals(other.members, members);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        image.hashCode ^
        createAt.hashCode ^
        admin.hashCode ^
        members.hashCode;
  }
}
