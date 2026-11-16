// GENERATED CODE - DO NOT MODIFY BY HAND
part of 'comment.dart';

Comment _$CommentFromJson(Map<String, dynamic> json) => Comment(
      id: (json['id'] as num).toInt(),
      userId: (json['user_id'] as num).toInt(),
      username: json['username'] as String,
      userImage: json['user_image'] as String?,
      content: json['content'] as String,
      createdAt: json['created_at'] as String,
      likes: (json['likes'] as num?)?.toInt() ?? 0,
      dislikes: (json['dislikes'] as num?)?.toInt() ?? 0,
      replies: (json['replies'] as List<dynamic>?)
          ?.map((e) => Comment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CommentToJson(Comment instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'username': instance.username,
      'user_image': instance.userImage,
      'content': instance.content,
      'created_at': instance.createdAt,
      'likes': instance.likes,
      'dislikes': instance.dislikes,
      'replies': instance.replies,
    };
