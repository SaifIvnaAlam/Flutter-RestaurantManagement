import 'dart:convert';

class RestaurantsModel {
  String id;

  String image;
  String createAt;
  String admin;
  RestaurantsModel({
    required this.id,
    required this.image,
    required this.createAt,
    required this.admin,
  });

  factory RestaurantsModel.empty() {
    return RestaurantsModel(
      id: '',
      image: '',
      createAt: '',
      admin: '',
    );
  }
  RestaurantsModel copyWith({
    String? id,
    String? image,
    String? createAt,
    String? admin,
  }) {
    return RestaurantsModel(
      id: id ?? this.id,
      image: image ?? this.image,
      createAt: createAt ?? this.createAt,
      admin: admin ?? this.admin,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'image': image});
    result.addAll({'createAt': createAt});
    result.addAll({'admin': admin});

    return result;
  }

  factory RestaurantsModel.fromMap(Map<String, dynamic> map) {
    return RestaurantsModel(
      id: map['id'] ?? '',
      image: map['image'] ?? '',
      createAt: map['createAt'] ?? '',
      admin: map['admin'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory RestaurantsModel.fromJson(String source) =>
      RestaurantsModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'RestaurantsModel(id: $id, image: $image, createAt: $createAt, admin: $admin)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RestaurantsModel &&
        other.id == id &&
        other.image == image &&
        other.createAt == createAt &&
        other.admin == admin;
  }

  @override
  int get hashCode {
    return id.hashCode ^ image.hashCode ^ createAt.hashCode ^ admin.hashCode;
  }
}
