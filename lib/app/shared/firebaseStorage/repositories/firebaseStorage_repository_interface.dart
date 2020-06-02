import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:whatsflutter/app/modules/login/model/user_model.dart';

abstract class IFirebaseStorageRepository{
      Future<Map<String, dynamic>> getUserData(String id);
      Future<Map<String, dynamic>> setUserData(String id, Map<String, dynamic> );
      StorageUploadTask uploadIMG(String id, File img);
      updateURL(String url, Map<String, dynamic> dadosAtt);
      updateName(String nome, Map<String, dynamic> dadosAtt);
      updateData(String nome, Map<String, dynamic> dadosAtt);

}