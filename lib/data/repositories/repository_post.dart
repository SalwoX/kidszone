import 'dart:io';

import 'package:injectable/injectable.dart';

import '../../views/_init/models/post_model.dart';
import '../../views/_init/models/user_model.dart';
import '../../views/_init/repository/repository_base.dart';

@lazySingleton
class RepositoryPost  with RepositoryBase<PostModel> {
  Future<String> uploadImage(String ref, File file) async {
    /*  String ext = FileUtils.getFileExtension(file);
    Reference storageReference = ref.child("${uuid.v4()}.$ext");
    UploadTask uploadTask = storageReference.putFile(file);
    await uploadTask.whenComplete(() => null);
    String fileUrl = await storageReference.getDownloadURL();
    return fileUrl;*/
    return '';
  }

//uploads profile picture to the users collection
  uploadProfilePicture(File image, UserModel user) async {
    /*  String link = await uploadImage(profilePic, image);
    var ref = usersRef.doc(user.uid);
    ref.update({
      "photoUrl": link,
    });*/
  }

//uploads post to the post collection
  uploadPost(File image, String location, String description) async {
    /*  String link = await uploadImage(posts, image);
    DocumentSnapshot doc = await usersRef.doc(firebaseAuth.currentUser.uid).get();
    user = UserModel.fromJson(doc.data());
    var ref = postRef.doc();
    ref.set({
      "id": ref.id,
      "postId": ref.id,
      "username": user.username,
      "ownerId": firebaseAuth.currentUser.uid,
      "mediaUrl": link,
      "description": description ?? "",
      "location": location ?? "Wooble",
      "timestamp": Timestamp.now(),
    }).catchError((e) {
      print(e);
    });*/
  }

  //uploads story to the story collection
  uploadStory(File image, String description) async {
    /*  String link = await uploadImage(posts, image);
    DocumentSnapshot doc = await usersRef.doc(firebaseAuth.currentUser.uid).get();
    user = UserModel.fromJson(doc.data());
    var ref = storyRef.doc();
    ref.set({
      "id": ref.id,
      "postId": ref.id,
      "username": user.username,
      "ownerId": firebaseAuth.currentUser.uid,
      "mediaUrl": link,
      "description": description ?? "",
      "timestamp": Timestamp.now(),
    }).catchError((e) {
      print(e);
    });*/
  }

//upload a comment
  uploadComment(String currentUserId, String comment, int postId, int ownerId, String mediaUrl) async {
    /*  DocumentSnapshot doc = await usersRef.doc(currentUserId).get();
    user = UserModel.fromJson(doc.data());
    await commentRef.doc(postId).collection("comments").add({
      "username": user.username,
      "comment": comment,
      "timestamp": Timestamp.now(),
      "userDp": user.photoUrl,
      "userId": user.id,
    });
    bool isNotMe = ownerId != currentUserId;
    if (isNotMe) {
      addCommentToNotification("comment", comment, user.username, user.id, postId, mediaUrl, ownerId, user.photoUrl);
    }*/
  }

//add the comment to notification collection
  addCommentToNotification(String type, String commentData, String username, String userId, String postId, String mediaUrl, String ownerId, String userDp) async {
/*    await notificationRef.doc(ownerId).collection('notifications').add({
      "type": type,
      "commentData": commentData,
      "username": username,
      "userId": userId,
      "userDp": userDp,
      "postId": postId,
      "mediaUrl": mediaUrl,
      "timestamp": Timestamp.now(),
    });*/
  }

//add the likes to the notfication collection
  addLikesToNotification(String type, String username, String userId, String postId, String mediaUrl, String ownerId, String userDp) async {
    /*  await notificationRef.doc(ownerId).collection('notifications').doc(postId).set({
      "type": type,
      "username": username,
      "userId": firebaseAuth.currentUser.uid,
      "userDp": userDp,
      "postId": postId,
      "mediaUrl": mediaUrl,
      "timestamp": Timestamp.now(),
    });*/
  }

  //remove likes from notification
  removeLikeFromNotification(String ownerId, String postId, String currentUser) async {
    /*  bool isNotMe = currentUser != ownerId;

    if (isNotMe) {
      DocumentSnapshot doc = await usersRef.doc(currentUser).get();
      user = UserModel.fromJson(doc.data());
      notificationRef.doc(ownerId).collection('notifications').doc(postId).get().then((doc) => {
            if (doc.exists) {doc.reference.delete()}
          });
    }*/
  }
}
