import 'package:cloud_firestore/cloud_firestore.dart';

class MensagemModel {
  MensagemModel({this.idUser, this.msg, this.urlIMG, this.reference, this.tipo, this.data});

  String idUser;
  String msg;
  String urlIMG;
  String tipo;
  String time = DateTime.now().millisecondsSinceEpoch.toString();
  String data;
  final DocumentReference reference;
  Map<String, dynamic> toMap(){
    Map<String, dynamic> map = {
      "idUser" : this.idUser,
      "msg" : this.msg,
      "urlIMG" : this.urlIMG,
      "tipo" : this.tipo,
      "time" : this.time,
      "data" : this.data
    };
    return map;
  }

  factory MensagemModel.fromDoc(DocumentSnapshot doc) {
    return MensagemModel(
      idUser : doc['idUser'],
      msg : doc['msg'],
      urlIMG : doc['urlIMG'],
      tipo : doc['tipo'],
      data : doc['data'],
      reference: doc.reference,
    );
  }


  factory MensagemModel.fromJson(Map<String, dynamic> json) {
    return MensagemModel(
        //field: json[''],
        );
  }

  Map<String, dynamic> toJson() => {};
}
