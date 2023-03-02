import 'package:json_annotation/json_annotation.dart';

part 'social_network_model.g.dart';

@JsonSerializable()
class SocialNetworkModel {
  int? id;
  int? schoolId;
  int? termId;
  int? branchId;
  String? registrant;
  int? registrantId;
  DateTime? registrationDate;
  String? modifier;
  int? modifierId;
  DateTime? modifiedDate;
  bool? active;
  String? insertedBy;
  DateTime? addingDate;
  String? content;
  @JsonKey(name: 'uploadDate')
  DateTime? uploadDate;
  String? url;
  String? imgUrl;
  String? videoUrl;
  int? postType;
  String? postId;
  List<SocialFileModel>? filesUrl;

  SocialNetworkModel({
    this.id,
    this.schoolId,
    this.termId,
    this.branchId,
    this.registrant,
    this.registrantId,
    this.registrationDate,
    this.modifier,
    this.modifierId,
    this.modifiedDate,
    this.active,
    this.insertedBy,
    this.addingDate,
    this.content,
    this.uploadDate,
    this.url,
    this.imgUrl,
    this.videoUrl,
    this.postType,
    this.postId,
  });

  factory SocialNetworkModel.fromJson(Map<String, dynamic> json) {
    return _$SocialNetworkModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SocialNetworkModelToJson(this);
}

@JsonSerializable()
class SocialFileModel {
  int? fileId;
  String? fileUrl;

  SocialFileModel({
    this.fileId,
    this.fileUrl,
  });

  factory SocialFileModel.fromJson(Map<String, dynamic> json) {
    return _$SocialFileModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SocialFileModelToJson(this);
}
