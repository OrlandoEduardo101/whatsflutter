class CompanyModel {

  String _name;
  String _cnpj;
  String _userCode;
  String _admCode;
  String _nick;
  String _email;
  String _uid;
  String _token;
  bool _isAdm;


  CompanyModel();

  factory CompanyModel.fromJson(Map<String, dynamic> json) {
    return CompanyModel(
        //field: json[''],
        );
  }

  Map<String, dynamic> toJson() => {
    "name" : _name,
    "nick" : _nick,
    "email" : _email,
    "uid" : _uid,
    "cnpj" : _cnpj,
    "userCode" : _userCode
  };

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String get nick => _nick;

  set nick(String value) {
    _nick = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  String get uid => _uid;

  set uid(String value) {
    _uid = value;
  }

  String get token => _token;

  set token(String value) {
    _token = value;
  }

  String get userCode => _userCode;

  set userCode(String value) {
    _userCode = value;
  }

  String get cnpj => _cnpj;

  set cnpj(String value) {
    _cnpj = value;
  }
}
