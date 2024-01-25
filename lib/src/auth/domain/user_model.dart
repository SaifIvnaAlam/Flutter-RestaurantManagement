import 'dart:convert';

class UserModel {
  final String id;
  final String uid;
  final String displayName;
  final String email;
  final String photoURL;
  final String? restaurant;
  UserModel({
    required this.id,
    required this.uid,
    required this.displayName,
    required this.email,
    required this.photoURL,
    this.restaurant,
  });

  UserModel copyWith({
    String? id,
    String? uid,
    String? displayName,
    String? email,
    String? photoURL,
    String? restaurant,
  }) {
    return UserModel(
      id: id ?? this.id,
      uid: uid ?? this.uid,
      displayName: displayName ?? this.displayName,
      email: email ?? this.email,
      photoURL: photoURL ?? this.photoURL,
      restaurant: restaurant ?? this.restaurant,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'uid': uid});
    result.addAll({'displayName': displayName});
    result.addAll({'email': email});
    result.addAll({'photoURL': photoURL});
    if (restaurant != null) {
      result.addAll({'restaurant': restaurant});
    }

    return result;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? '',
      uid: map['uid'] ?? '',
      displayName: map['displayName'] ?? '',
      email: map['email'] ?? '',
      photoURL: map['photoURL'] ?? '',
      restaurant: map['restaurant'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(id: $id, uid: $uid, displayName: $displayName, email: $email, photoURL: $photoURL, restaurant: $restaurant)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.id == id &&
        other.uid == uid &&
        other.displayName == displayName &&
        other.email == email &&
        other.photoURL == photoURL &&
        other.restaurant == restaurant;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        uid.hashCode ^
        displayName.hashCode ^
        email.hashCode ^
        photoURL.hashCode ^
        restaurant.hashCode;
  }
}
