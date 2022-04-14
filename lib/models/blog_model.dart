import 'package:json_annotation/json_annotation.dart';

part 'blog_model.g.dart';

@JsonSerializable()
class BlogModel {
  @JsonKey(name: '_id')
  late String id;
  late String username;
  late String title;
  late String body;
  late String coverImage;
  late int like;
  late int share;
  late int comment;

  BlogModel({
    required this.id,
    required this.username,
    required this.title,
    required this.body,
    required this.coverImage,
    required this.like,
    required this.share,
    required this.comment,
  });

  factory BlogModel.fromJson(Map<String, dynamic> json) =>
      _$BlogModelFromJson(json);
  Map<String, dynamic> toJson() => _$BlogModelToJson(this);
}
