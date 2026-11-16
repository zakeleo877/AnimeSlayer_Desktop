// GENERATED CODE - DO NOT MODIFY BY HAND
part of 'user.dart';

AppUser _$AppUserFromJson(Map<String, dynamic> json) => AppUser(
      id: (json['id'] as num).toInt(),
      username: json['username'] as String,
      email: json['email'] as String,
      profileImage: json['profile_image'] as String?,
      bio: json['bio'] as String?,
      points: (json['points'] as num?)?.toInt(),
      animeCount: (json['anime_count'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AppUserToJson(AppUser instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'profile_image': instance.profileImage,
      'bio': instance.bio,
      'points': instance.points,
      'anime_count': instance.animeCount,
    };

UserStatus _$UserStatusFromJson(Map<String, dynamic> json) => UserStatus(
      watching: (json['watching'] as num).toInt(),
      completed: (json['completed'] as num).toInt(),
      onHold: (json['on_hold'] as num).toInt(),
      dropped: (json['dropped'] as num).toInt(),
      planToWatch: (json['plan_to_watch'] as num).toInt(),
      favorites: (json['favorites'] as num).toInt(),
    );

Map<String, dynamic> _$UserStatusToJson(UserStatus instance) => <String, dynamic>{
      'watching': instance.watching,
      'completed': instance.completed,
      'on_hold': instance.onHold,
      'dropped': instance.dropped,
      'plan_to_watch': instance.planToWatch,
      'favorites': instance.favorites,
    };
