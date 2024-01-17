import 'dart:convert';

import 'package:flutter/foundation.dart';

class RestaurantsModel {
  String id;
  String restaurantId;
  String image;
  String createAt;
  String admin;
  List<String> members;
  RestaurantsModel({
    required this.id,
    required this.restaurantId,
    required this.image,
    required this.createAt,
    required this.admin,
    required this.members,
  });

  RestaurantsModel copyWith({
    String? id,
    String? restaurantId,
    String? image,
    String? createAt,
    String? admin,
    List<String>? members,
  }) {
    return RestaurantsModel(
      id: id ?? this.id,
      restaurantId: restaurantId ?? this.restaurantId,
      image: image ?? this.image,
      createAt: createAt ?? this.createAt,
      admin: admin ?? this.admin,
      members: members ?? this.members,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'restaurantId': restaurantId});
    result.addAll({'image': image});
    result.addAll({'createAt': createAt});
    result.addAll({'admin': admin});
    result.addAll({'members': members});

    return result;
  }

  factory RestaurantsModel.fromMap(Map<String, dynamic> map) {
    return RestaurantsModel(
      id: map['id'] ?? '',
      restaurantId: map['restaurantId'] ?? '',
      image: map['image'] ?? '',
      createAt: map['createAt'] ?? '',
      admin: map['admin'] ?? '',
      members: List<String>.from(map['members']),
    );
  }

  String toJson() => json.encode(toMap());

  factory RestaurantsModel.fromJson(String source) =>
      RestaurantsModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'RestaurantsModel(id: $id, restaurantId: $restaurantId, image: $image, createAt: $createAt, admin: $admin, members: $members)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RestaurantsModel &&
        other.id == id &&
        other.restaurantId == restaurantId &&
        other.image == image &&
        other.createAt == createAt &&
        other.admin == admin &&
        listEquals(other.members, members);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        restaurantId.hashCode ^
        image.hashCode ^
        createAt.hashCode ^
        admin.hashCode ^
        members.hashCode;
  }
}
