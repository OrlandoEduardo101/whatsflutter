class  Mensagem{
  String _idUser;
  String _msg;
  String _urlIMG;
  String _tipo;
  Mensagem();

   Map<String, dynamic> toMap(){
    Map<String, dynamic> map = {
      "idUser" : this.idUser,
      "msg" : this.msg,
      "urlIMG" : this.urlIMG,
      "tipo" : this.tipo
    };
    return map;
  }

 String get idUser => _idUser;

 set idUser(String value) => _idUser = value;

 String get msg => _msg;

 set msg(String value) => _msg = value;

 String get urlIMG => _urlIMG;

 set urlIMG(String value) => _urlIMG = value;

 String get tipo => _tipo;

 set tipo(String value) => _tipo = value;

}