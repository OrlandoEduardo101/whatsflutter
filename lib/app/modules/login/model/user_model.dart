class UserModel {

  String _name;
  String _nick;
  String _email;
  String _uid;
  String _token;
  bool _present;
  bool _isAdm;

  UserModel();



  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        //field: json[''],
        );
  }

  Map<String, dynamic> toJson() => {
    "name" : _name,
    "nick" : _nick,
    "email" : _email,
    "uid" : _uid,
    "present" : _present
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

  bool get present => _present;

  set present(bool value) {
    _present = value;
  }
}
