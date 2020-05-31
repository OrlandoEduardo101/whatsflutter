// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'configuracoes_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ConfiguracoesController on _ConfiguracoesControllerBase, Store {
  final _$idLogAtom = Atom(name: '_ConfiguracoesControllerBase.idLog');

  @override
  String get idLog {
    _$idLogAtom.reportRead();
    return super.idLog;
  }

  @override
  set idLog(String value) {
    _$idLogAtom.reportWrite(value, super.idLog, () {
      super.idLog = value;
    });
  }

  final _$dadosAtom = Atom(name: '_ConfiguracoesControllerBase.dados');

  @override
  dynamic get dados {
    _$dadosAtom.reportRead();
    return super.dados;
  }

  @override
  set dados(dynamic value) {
    _$dadosAtom.reportWrite(value, super.dados, () {
      super.dados = value;
    });
  }

  final _$controllerNomeAtom =
      Atom(name: '_ConfiguracoesControllerBase.controllerNome');

  @override
  TextEditingController get controllerNome {
    _$controllerNomeAtom.reportRead();
    return super.controllerNome;
  }

  @override
  set controllerNome(TextEditingController value) {
    _$controllerNomeAtom.reportWrite(value, super.controllerNome, () {
      super.controllerNome = value;
    });
  }

  final _$_imgAtom = Atom(name: '_ConfiguracoesControllerBase._img');

  @override
  File get _img {
    _$_imgAtom.reportRead();
    return super._img;
  }

  @override
  set _img(File value) {
    _$_imgAtom.reportWrite(value, super._img, () {
      super._img = value;
    });
  }

  final _$subindoAtom = Atom(name: '_ConfiguracoesControllerBase.subindo');

  @override
  bool get subindo {
    _$subindoAtom.reportRead();
    return super.subindo;
  }

  @override
  set subindo(bool value) {
    _$subindoAtom.reportWrite(value, super.subindo, () {
      super.subindo = value;
    });
  }

  final _$urlRecAtom = Atom(name: '_ConfiguracoesControllerBase.urlRec');

  @override
  String get urlRec {
    _$urlRecAtom.reportRead();
    return super.urlRec;
  }

  @override
  set urlRec(String value) {
    _$urlRecAtom.reportWrite(value, super.urlRec, () {
      super.urlRec = value;
    });
  }

  final _$recuperarIMGAsyncAction =
      AsyncAction('_ConfiguracoesControllerBase.recuperarIMG');

  @override
  Future<dynamic> recuperarIMG(String origem) {
    return _$recuperarIMGAsyncAction.run(() => super.recuperarIMG(origem));
  }

  final _$_uploadIMGAsyncAction =
      AsyncAction('_ConfiguracoesControllerBase._uploadIMG');

  @override
  Future<dynamic> _uploadIMG() {
    return _$_uploadIMGAsyncAction.run(() => super._uploadIMG());
  }

  final _$_recuperarURLAsyncAction =
      AsyncAction('_ConfiguracoesControllerBase._recuperarURL');

  @override
  Future<dynamic> _recuperarURL(StorageTaskSnapshot snapshot) {
    return _$_recuperarURLAsyncAction.run(() => super._recuperarURL(snapshot));
  }

  final _$recuperarDadosAsyncAction =
      AsyncAction('_ConfiguracoesControllerBase.recuperarDados');

  @override
  Future recuperarDados() {
    return _$recuperarDadosAsyncAction.run(() => super.recuperarDados());
  }

  final _$_ConfiguracoesControllerBaseActionController =
      ActionController(name: '_ConfiguracoesControllerBase');

  @override
  dynamic getIdLog() {
    final _$actionInfo = _$_ConfiguracoesControllerBaseActionController
        .startAction(name: '_ConfiguracoesControllerBase.getIdLog');
    try {
      return super.getIdLog();
    } finally {
      _$_ConfiguracoesControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic _atualizarURL(String url) {
    final _$actionInfo = _$_ConfiguracoesControllerBaseActionController
        .startAction(name: '_ConfiguracoesControllerBase._atualizarURL');
    try {
      return super._atualizarURL(url);
    } finally {
      _$_ConfiguracoesControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic atualizarNome() {
    final _$actionInfo = _$_ConfiguracoesControllerBaseActionController
        .startAction(name: '_ConfiguracoesControllerBase.atualizarNome');
    try {
      return super.atualizarNome();
    } finally {
      _$_ConfiguracoesControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
idLog: ${idLog},
dados: ${dados},
controllerNome: ${controllerNome},
subindo: ${subindo},
urlRec: ${urlRec}
    ''';
  }
}
