import 'package:json_annotation/json_annotation.dart';

part 'comment.g.dart';

@JsonSerializable()
class Comment {
  final int id;
  @JsonKey(name: 'user_id')
  final int userId;
  final String username;
  @JsonKey(name: 'user_image')
  final String? userImage;
  final String content;
  @JsonKey(name: 'created_at')
  final String createdAt;
  final int likes;
  final int dislikes;
  final List<Comment>? replies;

  Comment({
    required this.id,
    required this.userId,
    required this.username,
    this.userImage,
    required this.content,
    required this.createdAt,
    this.likes = 0,
    this.dislikes = 0,
    this.replies,
  });

  factory Comment.fromJson(Map<String, dynamic> json) => _$CommentFromJson(json);
  Map<String, dynamic> toJson() => _$CommentToJson(this);
}
