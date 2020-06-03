import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:whatsflutter/app/modules/login/model/user_model.dart';

abstract class IFirebaseStorageRepository{
      Stream<UserModel> getUserData(String id);
      setUserData(String id, Map<String, dynamic> Map);
      StorageUploadTask uploadIMG(String id, File img);
      updateURL(String url, Map<String, dynamic> dadosAtt);
      updateName(String nome, Map<String, dynamic> dadosAtt);
      updateData(String nome, Map<String, dynamic> dadosAtt);
      Future<Map<String, dynamic>> verifyUserData(String id);

}