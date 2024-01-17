import 'dart:convert';

class UserModel {
  final String id;
  final String uid;
  final String displayName;
  final String email;
  final String photoURL;
  UserModel({
    required this.id,
    required this.uid,
    required this.displayName,
    required this.email,
    required this.photoURL,
  });

  UserModel copyWith({
    String? id,
    String? uid,
    String? displayName,
    String? email,
    String? photoURL,
  }) {
    return UserModel(
      id: id ?? this.id,
      uid: uid ?? this.uid,
      displayName: displayName ?? this.displayName,
      email: email ?? this.email,
      photoURL: photoURL ?? this.photoURL,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'uid': uid});
    result.addAll({'displayName': displayName});
    result.addAll({'email': email});
    result.addAll({'photoURL': photoURL});

    return result;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? '',
      uid: map['uid'] ?? '',
      displayName: map['displayName'] ?? '',
      email: map['email'] ?? '',
      photoURL: map['photoURL'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(id: $id, uid: $uid, displayName: $displayName, email: $email, photoURL: $photoURL)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.id == id &&
        other.uid == uid &&
        other.displayName == displayName &&
        other.email == email &&
        other.photoURL == photoURL;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        uid.hashCode ^
        displayName.hashCode ^
        email.hashCode ^
        photoURL.hashCode;
  }
}
