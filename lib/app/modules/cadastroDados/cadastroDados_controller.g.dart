// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cadastroDados_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CadastroDadosController on _CadastroDadosControllerBase, Store {
  final _$msgErrorAtom = Atom(name: '_CadastroDadosControllerBase.msgError');

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

  final _$errorAtom = Atom(name: '_CadastroDadosControllerBase.error');

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

  final _$nomeAtom = Atom(name: '_CadastroDadosControllerBase.nome');

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

  final _$validarCamposAsyncAction =
      AsyncAction('_CadastroDadosControllerBase.validarCampos');

  @override
  Future<dynamic> validarCampos() {
    return _$validarCamposAsyncAction.run(() => super.validarCampos());
  }

  final _$_CadastroDadosControllerBaseActionController =
      ActionController(name: '_CadastroDadosControllerBase');

  @override
  dynamic setNome(dynamic value) {
    final _$actionInfo = _$_CadastroDadosControllerBaseActionController
        .startAction(name: '_CadastroDadosControllerBase.setNome');
    try {
      return super.setNome(value);
    } finally {
      _$_CadastroDadosControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<dynamic> setUserData(UserModel usuario, String id) {
    final _$actionInfo = _$_CadastroDadosControllerBaseActionController
        .startAction(name: '_CadastroDadosControllerBase.setUserData');
    try {
      return super.setUserData(usuario, id);
    } finally {
      _$_CadastroDadosControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
msgError: ${msgError},
error: ${error},
nome: ${nome}
    ''';
  }
}
