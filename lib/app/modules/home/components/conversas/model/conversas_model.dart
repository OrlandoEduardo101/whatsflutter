class ConversasModel {
  ConversasModel(this._nome, this._mensagem, this._URLfoto);

  String _nome;
  String _mensagem;
  String _URLfoto;

  String get nome => _nome;

  set nome(String value) {
    _nome = value;
  }

  String get mensagem => _mensagem;

  String get URLfoto => _URLfoto;

  set URLfoto(String value) {
    _URLfoto = value;
  }

  set mensagem(String value) {
    _mensagem = value;
  }

  /*factory ConversasModel.fromJson(Map<String, dynamic> json) {
    return ConversasModel(
        //field: json[''],
        );
  }*/

  Map<String, dynamic> toJson() => {};
}
