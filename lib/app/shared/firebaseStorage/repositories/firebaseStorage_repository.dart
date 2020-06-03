import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:whatsflutter/app/modules/login/model/user_model.dart';
import 'package:whatsflutter/app/shared/firebaseStorage/repositories/firebaseStorage_repository_interface.dart';

class FirebaseStorageRepository implements IFirebaseStorageRepository{

  final Firestore firestore;
  FirebaseStorageRepository(this.firestore);
  FirebaseStorage storage = FirebaseStorage.instance;

  @override
  Stream<UserModel> getUserData(String id) {
    print("firestore: "+firestore.toString()+id);
    return firestore.collection('users').document(id).snapshots().map((event){
      print("userDatas: " +  event.data.toString());
      return UserModel.fromDoc(event);
    });

    }

  @override
  Future<Map<String, dynamic>> verifyUserData(String id) async {
    print("firestore: "+firestore.toString()+id);
    DocumentSnapshot snapshot = await firestore.collection('users').document(id).get();
    print("userDatas: " +  snapshot.data.toString());
    return snapshot.data;
  }

  @override
  setUserData(String id, Map<String, dynamic> Map) {
    print('nome'+Map['nome']);
    print('uid3'+id);
    firestore.document(id)
        .setData(Map);
  }

  @override
  StorageUploadTask uploadIMG(String id, File img) {
    StorageReference raiz = storage.ref();
    StorageReference arq = raiz.child("perfil").child(id+".jpg");
    //upload img
    StorageUploadTask task = arq.putFile(img);
    return task;
  }

  @override
  updateURL(String id, Map<String, dynamic> dadosAtt) {
    firestore.collection("users").document(id).updateData(dadosAtt);
  }

  @override
  updateName(String id, Map<String, dynamic> dadosAtt) {
    firestore.collection("users").document(id).updateData(dadosAtt);
  }

  @override
  updateData(String id, Map<String, dynamic> dadosAtt) {
    firestore.collection("users").document(id).updateData(dadosAtt);
  }

  }
