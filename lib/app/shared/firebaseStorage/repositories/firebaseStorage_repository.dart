import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:whatsflutter/app/modules/login/model/user_model.dart';
import 'package:whatsflutter/app/shared/firebaseStorage/repositories/firebaseStorage_repository_interface.dart';

class FirebaseStorageRepository implements IFirebaseStorageRepository{

  final Firestore firestore;
  FirebaseStorageRepository(this.firestore);

  @override
  Stream<UserModel> getUserData(String id) {
    return firestore.collection('users').document('UDgDS7tlsHh12hEmi6B6Gz2fXvA2').snapshots().map((doc){
      return UserModel.fromDoc(doc);
    });
  }

}