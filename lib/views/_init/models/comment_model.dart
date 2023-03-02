import 'package:json_annotation/json_annotation.dart';

part 'comment_model.g.dart';

@JsonSerializable()
class CommentModel {
  String? phone;
  String? comment;
  DateTime? timeStamp;
  String? userDp;
  int? userId;

  CommentModel({
    this.phone,
    this.comment,
    this.timeStamp,
    this.userDp,
    this.userId,
  });
  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return _$CommentModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CommentModelToJson(this);
}
