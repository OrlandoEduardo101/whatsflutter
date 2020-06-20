// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contatos_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ContatosController on _ContatosControllerBase, Store {
  final _$listaConversaAtom =
      Atom(name: '_ContatosControllerBase.listaConversa');

  @override
  ObservableStream<List<UserModel>> get listaConversa {
    _$listaConversaAtom.reportRead();
    return super.listaConversa;
  }

  @override
  set listaConversa(ObservableStream<List<UserModel>> value) {
    _$listaConversaAtom.reportWrite(value, super.listaConversa, () {
      super.listaConversa = value;
    });
  }

  final _$_ContatosControllerBaseActionController =
      ActionController(name: '_ContatosControllerBase');

  @override
  Stream<List<UserModel>> recuperarContatos() {
    final _$actionInfo = _$_ContatosControllerBaseActionController.startAction(
        name: '_ContatosControllerBase.recuperarContatos');
    try {
      return super.recuperarContatos();
    } finally {
      _$_ContatosControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listaConversa: ${listaConversa}
    ''';
  }
}
