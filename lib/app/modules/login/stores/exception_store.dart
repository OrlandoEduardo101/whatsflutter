import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';
import 'package:whatsflutter/app/shared/utils/constants.dart';

part 'exception_store.g.dart';

class ExceptionStore = _ExceptionStoreBase with _$ExceptionStore;

abstract class _ExceptionStoreBase with Store {

  @observable
  String error = '';

  @action
  setError(String value) => textError = value;

  @observable
  String textError = '';

  @action
  getError(String error){
    if(error == ERROR_LOGIN[0]){
      textError = 'Email inválido';
      print("textError");
      return textError;
    }else if(error == ERROR_LOGIN[1]){
      textError = 'Usuário não encontrado';
      print("textError");
      return textError;
    }else if(error == ERROR_LOGIN[2]){
      textError = 'Senha incorreta';
      print("textError");
      return textError;
    } else if(error == ERROR_LOGIN[3]){
      textError = 'Sem conexão';
      print("textError");
      return textError;
    } else{
      textError = '';
      return textError;
    }
  }

}
