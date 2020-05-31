import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {

  String name;
  String nick;
  String urlIMG;
  String email;
  String uid;
  String token;
  String password;
  bool present = false;
  bool isAdm = false;
  String location;
  final DocumentReference reference;

  UserModel({this.name, this.nick, this.email, this.uid, this.present, this.isAdm, this.reference, this.urlIMG});

  Map<String, dynamic> toMap(){
    Map<String, dynamic> map = {
      "name" : this.name,
      //"nick" : this.nick,
      "email" : this.email,
      "urlIMG" : this.urlIMG,
      //"uid" : this.uid,
      //"present" : this.present,
      //"isAdm" : this.isAdm
    };
    return map;
  }

  Map<String, dynamic> fromSnapshot(data){
    Map<String, dynamic> map = {
      "name" : data['name'],
      //"nick" : data['nick'],
      "email" : data['email'],
      "urlIMG" : data['urlIMG'],
      //"uid" : data['uid'],
      //"present" : data['present'],
      //"isAdm" : data['isAdm']
    };
    return map;
  }

  factory UserModel.fromDoc(DocumentSnapshot doc) {
    return UserModel(
          name: doc['name'],
          //nick : doc['nick'],
          email : doc['email'],
          urlIMG : doc['urlIMG'],
         // uid : doc['uid'],
         // present : doc['present'],
         // isAdm : doc['isAdm'],
          reference: doc.reference,
        );
  }

}
