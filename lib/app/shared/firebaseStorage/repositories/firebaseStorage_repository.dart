import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:whatsflutter/app/modules/login/model/user_model.dart';
import 'package:whatsflutter/app/shared/firebaseStorage/repositories/firebaseStorage_repository_interface.dart';

class FirebaseStorageRepository implements IFirebaseStorageRepository{

  final Firestore firestore;
  FirebaseStorageRepository(this.firestore);

  @override
  Future<Map<String, dynamic>> getUserData(String id) async {
    print("firestore: "+firestore.toString()+id);
    DocumentSnapshot snapshot = await firestore.collection('users').document(id).get();
      print("userDatas: " +  snapshot.data.toString());
      return snapshot.data;
    }
  }
