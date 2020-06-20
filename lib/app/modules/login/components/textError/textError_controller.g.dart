// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'textError_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TextErrorController on _TextErrorControllerBase, Store {
  final _$colorAtom = Atom(name: '_TextErrorControllerBase.color');

  @override
  Color get color {
    _$colorAtom.reportRead();
    return super.color;
  }

  @override
  set color(Color value) {
    _$colorAtom.reportWrite(value, super.color, () {
      super.color = value;
    });
  }

  final _$_TextErrorControllerBaseActionController =
      ActionController(name: '_TextErrorControllerBase');

  @override
  Color setColor(dynamic value) {
    final _$actionInfo = _$_TextErrorControllerBaseActionController.startAction(
        name: '_TextErrorControllerBase.setColor');
    try {
      return super.setColor(value);
    } finally {
      _$_TextErrorControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
color: ${color}
    ''';
  }
}
