class ConversaModel {

  ConversaModel([this.nome, this.mensagem, this.URLfoto, this.idRemet]);

  String nome;
  String mensagem;
  String URLfoto;
  String idRemet;
  String idDest;
  String tipo;
  String data;


  Map<String, dynamic> toMap(){
    Map<String, dynamic> map = {
      "idRemet" : this.idRemet,
      "idDest" : this.idDest,
      "nome" : this.nome,
      "mensagem" : this.mensagem,
      "URLfoto" : this.URLfoto,
      "tipo" : this.tipo,
      "data" : this.data,
    };
    return map;
  }

  factory ConversaModel.fromJson(Map<String, dynamic> json) {
    return ConversaModel(
        //field: json[''],
        );
  }

  Map<String, dynamic> toJson() => {};
}
