// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'series.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Series _$SeriesFromJson(Map<String, dynamic> json) => Series(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      nameAr: json['name_ar'] as String?,
      image: json['image'] as String?,
      cover: json['cover'] as String?,
      story: json['story'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
      status: json['status'] as String?,
      type: json['type'] as String?,
      episodesCount: (json['episodesCount'] as num?)?.toInt(),
      season: json['season'] as String?,
      year: (json['year'] as num?)?.toInt(),
      genres:
          (json['genres'] as List<dynamic>?)?.map((e) => e as String).toList(),
      studio: json['studio'] as String?,
    );

Map<String, dynamic> _$SeriesToJson(Series instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'name_ar': instance.nameAr,
      'image': instance.image,
      'cover': instance.cover,
      'story': instance.story,
      'rating': instance.rating,
      'status': instance.status,
      'type': instance.type,
      'episodesCount': instance.episodesCount,
      'season': instance.season,
      'year': instance.year,
      'genres': instance.genres,
      'studio': instance.studio,
    };

Episode _$EpisodeFromJson(Map<String, dynamic> json) => Episode(
      id: (json['id'] as num).toInt(),
      animeId: (json['anime_id'] as num).toInt(),
      name: json['name'] as String,
      number: (json['number'] as num?)?.toInt(),
      image: json['image'] as String?,
      duration: json['duration'] as String?,
      date: json['date'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$EpisodeToJson(Episode instance) => <String, dynamic>{
      'id': instance.id,
      'anime_id': instance.animeId,
      'name': instance.name,
      'number': instance.number,
      'image': instance.image,
      'duration': instance.duration,
      'date': instance.date,
      'rating': instance.rating,
    };

CharacterDetails _$CharacterDetailsFromJson(Map<String, dynamic> json) =>
    CharacterDetails(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      image: json['image'] as String?,
      role: json['role'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$CharacterDetailsToJson(CharacterDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'role': instance.role,
      'description': instance.description,
    };
