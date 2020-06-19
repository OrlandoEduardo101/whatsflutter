class MensagemModel {
  MensagemModel();

  String idUser;
  String msg;
  String urlIMG;
  String tipo;
  String time = DateTime.now().millisecondsSinceEpoch.toString();
  String data;

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


  factory MensagemModel.fromJson(Map<String, dynamic> json) {
    return MensagemModel(
        //field: json[''],
        );
  }

  Map<String, dynamic> toJson() => {};
}
