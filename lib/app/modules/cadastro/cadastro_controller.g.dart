// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cadastro_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CadastroController on _CadastroControllerBase, Store {
  final _$msgErrorAtom = Atom(name: '_CadastroControllerBase.msgError');

  @override
  String get msgError {
    _$msgErrorAtom.reportRead();
    return super.msgError;
  }

  @override
  set msgError(String value) {
    _$msgErrorAtom.reportWrite(value, super.msgError, () {
      super.msgError = value;
    });
  }

  final _$errorAtom = Atom(name: '_CadastroControllerBase.error');

  @override
  String get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  final _$nomeAtom = Atom(name: '_CadastroControllerBase.nome');

  @override
  String get nome {
    _$nomeAtom.reportRead();
    return super.nome;
  }

  @override
  set nome(String value) {
    _$nomeAtom.reportWrite(value, super.nome, () {
      super.nome = value;
    });
  }

  final _$emailAtom = Atom(name: '_CadastroControllerBase.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$senhaAtom = Atom(name: '_CadastroControllerBase.senha');

  @override
  String get senha {
    _$senhaAtom.reportRead();
    return super.senha;
  }

  @override
  set senha(String value) {
    _$senhaAtom.reportWrite(value, super.senha, () {
      super.senha = value;
    });
  }

  final _$validarCamposAsyncAction =
      AsyncAction('_CadastroControllerBase.validarCampos');

  @override
  Future<dynamic> validarCampos() {
    return _$validarCamposAsyncAction.run(() => super.validarCampos());
  }

  final _$cadastrarUserAsyncAction =
      AsyncAction('_CadastroControllerBase.cadastrarUser');

  @override
  Future<dynamic> cadastrarUser(UserModel usuario) {
    return _$cadastrarUserAsyncAction.run(() => super.cadastrarUser(usuario));
  }

  final _$_CadastroControllerBaseActionController =
      ActionController(name: '_CadastroControllerBase');

  @override
  dynamic setNome(dynamic value) {
    final _$actionInfo = _$_CadastroControllerBaseActionController.startAction(
        name: '_CadastroControllerBase.setNome');
    try {
      return super.setNome(value);
    } finally {
      _$_CadastroControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setEmail(dynamic value) {
    final _$actionInfo = _$_CadastroControllerBaseActionController.startAction(
        name: '_CadastroControllerBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_CadastroControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSenha(dynamic value) {
    final _$actionInfo = _$_CadastroControllerBaseActionController.startAction(
        name: '_CadastroControllerBase.setSenha');
    try {
      return super.setSenha(value);
    } finally {
      _$_CadastroControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<dynamic> setUserData(UserModel usuario, String id) {
    final _$actionInfo = _$_CadastroControllerBaseActionController.startAction(
        name: '_CadastroControllerBase.setUserData');
    try {
      return super.setUserData(usuario, id);
    } finally {
      _$_CadastroControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
msgError: ${msgError},
error: ${error},
nome: ${nome},
email: ${email},
senha: ${senha}
    ''';
  }
}
