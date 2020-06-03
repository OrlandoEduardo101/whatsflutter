import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {

  String nome;
  String nick;
  String urlIMG = '0';
  String email;
  String uid;
  String token;
  String password;
  bool present = false;
  bool isAdm = false;
  String location;
  final DocumentReference reference;

  UserModel({this.nome, this.nick, this.email, this.uid, this.present, this.isAdm, this.reference, this.urlIMG});

  Map<String, dynamic> toMap(){
    Map<String, dynamic> map = {
      "name" : this.nome,
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
      "nome" : data['nome'],
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
          nome: doc['nome'],
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
