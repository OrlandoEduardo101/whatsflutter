import 'package:cloud_firestore/cloud_firestore.dart';

class Conversa{
  String _nome;
  String _mensagem;
  String _URLfoto;
  String _idRemet;
  String _idDest;
  String _tipo;

  Conversa([this._nome, this._mensagem, this._URLfoto]);

  Salvar() async {
    Firestore db = Firestore.instance;
    await db.collection(("conversas")).document(this.idRemet).collection("ultima").document(this.idDest).setData(this.toMap());
  }

  Map<String, dynamic> toMap(){
    Map<String, dynamic> map = {
      "idRemet" : this.idRemet,
      "idDest" : this.idDest,
      "nome" : this.nome,
      "mensagem" : this.mensagem,
      "URLfoto" : this.URLfoto,
      "tipo" : this.tipo,
    };
    return map;
  }

  String get nome => _nome;

  set nome(String value) {
    _nome = value;
  }

  String get idRemet => _idRemet;

  set idRemet(String value) {
    _idRemet = value;
  }

  String get mensagem => _mensagem;

  String get URLfoto => _URLfoto;

  set URLfoto(String value) {
    _URLfoto = value;
  }

  set mensagem(String value) {
    _mensagem = value;
  }

  String get idDest => _idDest;

  set idDest(String value) {
    _idDest = value;
  }

  String get tipo => _tipo;

  set tipo(String value) {
    _tipo = value;
  }
}