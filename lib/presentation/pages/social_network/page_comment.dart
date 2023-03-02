import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../common/infrastructure/work_context.dart';
import '../../../data/repositories/repository_post.dart';
import '../../../register.dart';
import '../../../views/_init/logger/logger_mixin.dart';
import '../../../views/_init/models/post_model.dart';
import '../../../views/_init/models/user_model.dart';

class PageComments extends StatefulWidget {
  final PostModel? post;

  PageComments({this.post});

  _PageCommentsState createState() => _PageCommentsState();
}

class _PageCommentsState extends State<PageComments> with LoggerMixin {
  UserModel? user;

  var services = resolve<RepositoryPost>();
  final DateTime timeStamp = DateTime.now();
  TextEditingController commentsTEC = TextEditingController();

  currentUserId() {
    return WorkContext.userModel!.id;
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
