// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blog_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlogListModel _$BlogListModelFromJson(Map<String, dynamic> json) =>
    BlogListModel(
      data: (json['data'] as List<dynamic>)
          .map((e) => BlogModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BlogListModelToJson(BlogListModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
