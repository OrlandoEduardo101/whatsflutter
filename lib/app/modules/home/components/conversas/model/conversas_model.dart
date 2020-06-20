import 'package:cloud_firestore/cloud_firestore.dart';

class ConversasModel {
  ConversasModel({this.nome='', this.mensagem='', this.URLfoto='', this.reference});

  String nome;
  String mensagem;
  String URLfoto;
  DocumentReference reference;

  factory ConversasModel.fromDoc(DocumentSnapshot doc) {
    return ConversasModel(
      nome: doc['nome'],
      //nick : doc['nick'],
      mensagem: doc['email'],
      URLfoto: doc['urlIMG'],
      // uid : doc['uid'],
      // present : doc['present'],
      // isAdm : doc['isAdm'],
      reference: doc.reference,
    );
  }

  /*factory ConversasModel.fromJson(Map<String, dynamic> json) {
    return ConversasModel(
        //field: json[''],
        );
  }*/

  Map<String, dynamic> toJson() => {};
}
