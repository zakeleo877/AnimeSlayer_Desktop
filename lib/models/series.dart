import 'package:json_annotation/json_annotation.dart';

part 'series.g.dart';

@JsonSerializable()
class Series {
  final int id;
  final String name;
  @JsonKey(name: 'name_ar')
  final String? nameAr;
  final String? image;
  final String? cover;
  final String? story;
  final double? rating;
  final String? status;
  final String? type; // TV, Movie, OVA
  final int? episodesCount;
  final String? season;
  final int? year;
  final List<String>? genres;
  final String? studio;

  Series({
    required this.id,
    required this.name,
    this.nameAr,
    this.image,
    this.cover,
    this.story,
    this.rating,
    this.status,
    this.type,
    this.episodesCount,
    this.season,
    this.year,
    this.genres,
    this.studio,
  });

  factory Series.fromJson(Map<String, dynamic> json) => _$SeriesFromJson(json);
  Map<String, dynamic> toJson() => _$SeriesToJson(this);
}

@JsonSerializable()
class Episode {
  final int id;
  @JsonKey(name: 'anime_id')
  final int animeId;
  final String name;
  final int? number;
  final String? image;
  final String? duration;
  final String? date;
  final double? rating;

  Episode({
    required this.id,
    required this.animeId,
    required this.name,
    this.number,
    this.image,
    this.duration,
    this.date,
    this.rating,
  });

  factory Episode.fromJson(Map<String, dynamic> json) => _$EpisodeFromJson(json);
  Map<String, dynamic> toJson() => _$EpisodeToJson(this);
}

@JsonSerializable()
class CharacterDetails {
  final int id;
  final String name;
  final String? image;
  final String? role;
  final String? description;

  CharacterDetails({
    required this.id,
    required this.name,
    this.image,
    this.role,
    this.description,
  });

  factory CharacterDetails.fromJson(Map<String, dynamic> json) => _$CharacterDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$CharacterDetailsToJson(this);
}
