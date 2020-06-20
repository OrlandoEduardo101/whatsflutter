// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exception_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ExceptionStore on _ExceptionStoreBase, Store {
  final _$errorAtom = Atom(name: '_ExceptionStoreBase.error');

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

  final _$textErrorAtom = Atom(name: '_ExceptionStoreBase.textError');

  @override
  String get textError {
    _$textErrorAtom.reportRead();
    return super.textError;
  }

  @override
  set textError(String value) {
    _$textErrorAtom.reportWrite(value, super.textError, () {
      super.textError = value;
    });
  }

  final _$_ExceptionStoreBaseActionController =
      ActionController(name: '_ExceptionStoreBase');

  @override
  dynamic setError(String value) {
    final _$actionInfo = _$_ExceptionStoreBaseActionController.startAction(
        name: '_ExceptionStoreBase.setError');
    try {
      return super.setError(value);
    } finally {
      _$_ExceptionStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getError(String error) {
    final _$actionInfo = _$_ExceptionStoreBaseActionController.startAction(
        name: '_ExceptionStoreBase.getError');
    try {
      return super.getError(error);
    } finally {
      _$_ExceptionStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
error: ${error},
textError: ${textError}
    ''';
  }
}
