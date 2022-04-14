import 'package:blogapp/models/blog_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'blog_list_model.g.dart';

@JsonSerializable()
class BlogListModel {
  late List<BlogModel> data;
  BlogListModel({required this.data});

  factory BlogListModel.fromJson(Map<String, dynamic> json) =>
      _$BlogListModelFromJson(json);
  Map<String, dynamic> toJson() => _$BlogListModelToJson(this);
}
