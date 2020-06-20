// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversas_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ConversasController on _ConversasControllerBase, Store {
  final _$listaConversaAtom =
      Atom(name: '_ConversasControllerBase.listaConversa');

  @override
  ObservableStream<List<ConversasModel>> get listaConversa {
    _$listaConversaAtom.reportRead();
    return super.listaConversa;
  }

  @override
  set listaConversa(ObservableStream<List<ConversasModel>> value) {
    _$listaConversaAtom.reportWrite(value, super.listaConversa, () {
      super.listaConversa = value;
    });
  }

  final _$idLogAtom = Atom(name: '_ConversasControllerBase.idLog');

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

  final _$_ConversasControllerBaseActionController =
      ActionController(name: '_ConversasControllerBase');

  @override
  Stream<List<ConversasModel>> recuperarConversas() {
    final _$actionInfo = _$_ConversasControllerBaseActionController.startAction(
        name: '_ConversasControllerBase.recuperarConversas');
    try {
      return super.recuperarConversas();
    } finally {
      _$_ConversasControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listaConversa: ${listaConversa},
idLog: ${idLog}
    ''';
  }
}
