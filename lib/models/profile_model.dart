import 'package:json_annotation/json_annotation.dart';
part 'profile_model.g.dart';

@JsonSerializable()
class ProfileModel {
  // Fields name shoulb be same as in api
  late String name;
  late String username;
  late String profession;
  @JsonKey(name: 'DOB')
  late String dob;
  late String titleline;
  late String about;

  ProfileModel({
    required this.dob,
    required this.about,
    required this.name,
    required this.profession,
    required this.titleline,
    required this.username,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileModelToJson(this);
}
