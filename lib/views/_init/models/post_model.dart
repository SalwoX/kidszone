import 'package:json_annotation/json_annotation.dart';

part 'post_model.g.dart';

@JsonSerializable()
class PostModel {
  int? id;
  String? postId; //Hedef Kitledeki Seçili Idler
  int? ownerId; //
  String? phone;
  String? location;
  String? description;
  String? mediaUrl;
  DateTime? timeStamp;
  int? postType;

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return _$PostModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PostModelToJson(this);
  PostModel({
    this.id,
    this.postId,
    this.ownerId,
    this.location,
    this.description,
    this.mediaUrl,
    this.phone,
    this.timeStamp,
    this.postType,
  });
}
