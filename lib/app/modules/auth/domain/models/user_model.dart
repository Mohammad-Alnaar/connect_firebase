import 'dart:convert';

class UserModel {
  final String id;
  final String username;
  final String email;
  final String userLocation;
  final String photo;
  UserModel({
    required this.id,
    required this.username,
    required this.email,
    required this.userLocation,
    required this.photo,
  });

  UserModel copyWith({
    String? id,
    String? username,
    String? email,
    String? userLocation,
    String? photo,
  }) {
    return UserModel(
      id: id ?? this.id,
      username: username ?? this.username,
      email: email ?? this.email,
      userLocation: userLocation ?? this.userLocation,
      photo: photo ?? this.photo,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'username': username});
    result.addAll({'email': email});
    result.addAll({'userLocation': userLocation});
    result.addAll({'photo': photo});

    return result;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? '',
      username: map['username'] ?? '',
      email: map['email'] ?? '',
      userLocation: map['userLocation'] ?? '',
      photo: map['photo'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(id: $id, username: $username, email: $email, userLocation: $userLocation, photo: $photo)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.id == id &&
        other.username == username &&
        other.email == email &&
        other.userLocation == userLocation &&
        other.photo == photo;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        username.hashCode ^
        email.hashCode ^
        userLocation.hashCode ^
        photo.hashCode;
  }
}
