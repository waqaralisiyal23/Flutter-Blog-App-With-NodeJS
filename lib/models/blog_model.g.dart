// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blog_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlogModel _$BlogModelFromJson(Map<String, dynamic> json) => BlogModel(
      id: json['_id'] as String,
      username: json['username'] as String,
      title: json['title'] as String,
      body: json['body'] as String,
      coverImage: json['coverImage'] as String,
      like: json['like'] as int,
      share: json['share'] as int,
      comment: json['comment'] as int,
    );

Map<String, dynamic> _$BlogModelToJson(BlogModel instance) => <String, dynamic>{
      '_id': instance.id,
      'username': instance.username,
      'title': instance.title,
      'body': instance.body,
      'coverImage': instance.coverImage,
      'like': instance.like,
      'share': instance.share,
      'comment': instance.comment,
    };
