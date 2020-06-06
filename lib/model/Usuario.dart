
class user{
  String _nome;
  String _email;
  String _senha;
  String _urlIMG;

  user();

  Map<String, dynamic> toMap(){
    Map<String, dynamic> map = {
      "nome" : this.nome,
      "email" : this.email
    };
    return map;
  }


  String get urlIMG => _urlIMG;

  set urlIMG(String value) {
    _urlIMG = value;
  }

  String get senha => _senha;

  set senha(String value) {
    _senha = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  String get nome => _nome;

  set nome(String value) {
    _nome = value;
  }
}