import 'package:flutter/foundation.dart';

@immutable
class UserModel {
  final String uid;
  final String email;
  final String name;
  final List<String> followers;
  final List<String> following;
  final String profilePicture;
  final String bannerPicture;
  final String bio;
  final bool isTwitterBlue;
  const UserModel({
    required this.uid,
    required this.email,
    required this.name,
    required this.followers,
    required this.following,
    required this.profilePicture,
    required this.bannerPicture,
    required this.bio,
    required this.isTwitterBlue,
  });

  UserModel copyWith({
    String? uid,
    String? email,
    String? name,
    List<String>? followers,
    List<String>? following,
    String? profilePicture,
    String? bannerPicture,
    String? bio,
    bool? isTwitterBlue,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      name: name ?? this.name,
      followers: followers ?? this.followers,
      following: following ?? this.following,
      profilePicture: profilePicture ?? this.profilePicture,
      bannerPicture: bannerPicture ?? this.bannerPicture,
      bio: bio ?? this.bio,
      isTwitterBlue: isTwitterBlue ?? this.isTwitterBlue,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'name': name,
      'followers': followers,
      'following': following,
      'profilePicture': profilePicture,
      'bannerPicture': bannerPicture,
      'bio': bio,
      'isTwitterBlue': isTwitterBlue,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['\$id'] as String,
      email: map['email'] as String,
      name: map['name'] as String,
      followers: List<String>.from((map['followers'] as List<String>)),
      following: List<String>.from((map['following'] as List<String>)),
      profilePicture: map['profilePicture'] as String,
      bannerPicture: map['bannerPicture'] as String,
      bio: map['bio'] as String,
      isTwitterBlue: map['isTwitterBlue'] as bool,
    );
  }

  @override
  String toString() {
    return 'UserModel(uid: $uid, email: $email, name: $name, followers: $followers, following: $following, profilePicture: $profilePicture, bannerPicture: $bannerPicture, bio: $bio, isTwitterBlue: $isTwitterBlue)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.uid == uid &&
        other.email == email &&
        other.name == name &&
        listEquals(other.followers, followers) &&
        listEquals(other.following, following) &&
        other.profilePicture == profilePicture &&
        other.bannerPicture == bannerPicture &&
        other.bio == bio &&
        other.isTwitterBlue == isTwitterBlue;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        email.hashCode ^
        name.hashCode ^
        followers.hashCode ^
        following.hashCode ^
        profilePicture.hashCode ^
        bannerPicture.hashCode ^
        bio.hashCode ^
        isTwitterBlue.hashCode;
  }

  static UserModel empty() {
    return const UserModel(
      uid: '',
      email: '',
      name: '',
      followers: [],
      following: [],
      profilePicture: '',
      bannerPicture: '',
      bio: '',
      isTwitterBlue: false,
    );
  }

}
