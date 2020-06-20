import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:whatsflutter/app/modules/login/model/user_model.dart';
import 'package:whatsflutter/app/shared/auth/auth_controller.dart';
import 'package:whatsflutter/app/shared/firebaseStorage/repositories/firebaseStorage_repository_interface.dart';
import 'package:whatsflutter/app/shared/services/imagePicker_service.dart';

part 'configuracoes_controller.g.dart';

class ConfiguracoesController = _ConfiguracoesControllerBase
    with _$ConfiguracoesController;

abstract class _ConfiguracoesControllerBase with Store {
  final IFirebaseStorageRepository repository;
  AuthController auth = Modular.get();
  UserModel user = UserModel();

  @observable
  String idLog = '';

  @action
  getIdLog(){
    idLog = auth.user.uid;
    return idLog;
  }

  @observable
  TextEditingController controllerNome = TextEditingController();

  @observable
  File img;
  @observable
  bool subindo = false;
  @observable
  String urlRec;
  @observable
  File imagemSelecionada;

  @observable
  ObservableStream<UserModel> dados;

  _ConfiguracoesControllerBase(this.repository){
    getIdLog();
    recuperarDados();
  }

  @action
  Future recuperarIMG(String origem)async{
    switch(origem) {
      case "cam":
        imagemSelecionada = await ImagePickerService().capturarImagemCamera();
        break;
      case "galeria":
        imagemSelecionada = await ImagePickerService().capturarImagemGaleria();
        break;
      default:
    }

    img = imagemSelecionada;

    if (img != null) {
      subindo = true;
      _uploadIMG();
    }

  }
  @action
  Future _uploadIMG()async{
    //upload img
    var task = repository.uploadIMG(idLog, img);
    //controle progresso
    task.events.listen((StorageTaskEvent event) {
      if (event.type == StorageTaskEventType.progress) {
        subindo = true;
      }  else if(event.type == StorageTaskEventType.success){
        subindo = false;
      }
    });
    //recuperar url da img
    task.onComplete.then((StorageTaskSnapshot value){
      _recuperarURL(value);
    });
  }

  @action
  Future _recuperarURL(StorageTaskSnapshot snapshot) async{
    String url = await snapshot.ref.getDownloadURL();
    _atualizarURL(url);
    urlRec = url;
  }

  @action
  _atualizarURL(String url){
    Map<String, dynamic> dadosAtt = {
      "urlIMG" : url
    };
    repository.updateData(idLog, dadosAtt);
  }

  @action
  atualizarNome(){
    String nome = controllerNome.text;
    Map<String, dynamic> dadosAtt = {
      "nome" : nome
    };
    repository.updateData(idLog, dadosAtt);
  }

  @action
  recuperarDados() {
    dados =  repository.getUserData(idLog).asObservable();
    print("id:" +idLog);
    print("dadoss: " + dados.data.toString());
  }

  }

