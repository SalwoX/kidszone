import 'package:json_annotation/json_annotation.dart';

part 'activity_model.g.dart';

@JsonSerializable()
class ActivityModel {
  String? type;
  String? username;
  int? userId;
  String? userDp;
  int? postId;
  String? mediaUrl;
  String? commentData;
  DateTime? timeStamp;
  ActivityModel(this.type, this.username, this.userId, this.userDp, this.postId, this.commentData, this.mediaUrl, this.timeStamp);

  factory ActivityModel.fromJson(Map<String, dynamic> json) {
    return _$ActivityModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ActivityModelToJson(this);
}
