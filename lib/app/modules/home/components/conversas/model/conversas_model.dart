import 'package:cloud_firestore/cloud_firestore.dart';

class ConversasModel {
  ConversasModel({this.nome='', this.mensagem='', this.URLfoto='', this.reference, this.idRemet, this.idDest, this.tipo, this.data});

  String nome;
  String mensagem;
  String URLfoto;
  String idRemet;
  String idDest;
  String tipo;
  String data;

  DocumentReference reference;

  factory ConversasModel.fromDoc(DocumentSnapshot doc) {
    return ConversasModel(
      nome: doc['nome'],
      idRemet: doc['idRemet'],
      idDest: doc['idDest'],
      mensagem: doc['mensagem'],
      URLfoto: doc['URLfoto'],
      tipo: doc['tipo'],
      data: doc['data'],
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
