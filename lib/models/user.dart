import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class AppUser {
  final int id;
  final String username;
  final String email;
  @JsonKey(name: 'profile_image")
  final String? profileImage;
  final String? bio;
  final int? points;
  @JsonKey(name: 'anime_count')
  final int? animeCount;

  AppUser({
    required this.id,
    required this.username,
    required this.email,
    this.profileImage,
    this.bio,
    this.points,
    this.animeCount,
  });

  factory AppUser.fromJson(Map<String, dynamic> json) => _$AppUserFromJson(json);
  Map<String, dynamic> toJson() => _$AppUserToJson(this);
}

@JsonSerializable()
class UserStatus {
  final int watching;
  final int completed;
  @JsonKey(name: 'on_hold')
  final int onHold;
  final int dropped;
  @JsonKey(name: 'plan_to_watch')
  final int planToWatch;
  final int favorites;

  UserStatus({
    required this.watching,
    required this.completed,
    required this.onHold,
    required this.dropped,
    required this.planToWatch,
    required this.favorites,
  });

  factory UserStatus.fromJson(Map<String, dynamic> json) => _$UserStatusFromJson(json);
  Map<String, dynamic> toJson() => _$UserStatusToJson(this);
}
