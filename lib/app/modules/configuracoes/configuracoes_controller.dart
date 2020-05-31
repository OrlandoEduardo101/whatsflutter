import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:whatsflutter/app/modules/login/model/user_model.dart';
import 'package:whatsflutter/app/shared/auth/auth_controller.dart';
import 'package:whatsflutter/app/shared/firebaseStorage/repositories/firebaseStorage_repository_interface.dart';

part 'configuracoes_controller.g.dart';

class ConfiguracoesController = _ConfiguracoesControllerBase
    with _$ConfiguracoesController;

abstract class _ConfiguracoesControllerBase with Store {
  final IFirebaseStorageRepository repository;
  AuthController auth = Modular.get();
  UserModel user = UserModel();
  var userData;

  @observable
  String idLog = '';

  @action
  getIdLog(){
    idLog = auth.user.uid;
    return idLog;
  }

  @observable
  var dados;

  @observable
  TextEditingController controllerNome = TextEditingController();

  @observable
  File _img;
  @observable
  bool subindo = false;
  @observable
  String urlRec;

  _ConfiguracoesControllerBase(this.repository){
    getIdLog();
    recuperarDados();
  }

  @action
  Future recuperarIMG(String origem)async{
    File imagemSelecionada;
    switch(origem) {
      case "cam":
        imagemSelecionada = await ImagePicker.pickImage(source: ImageSource.camera);
        break;
      case "galeria":
        imagemSelecionada = await ImagePicker.pickImage(source: ImageSource.gallery);
        break;
      default:
    }

      _img = imagemSelecionada;
      if (_img != null) {
        subindo = true;
        _uploadIMG();
      }

  }
  @action
  Future _uploadIMG()async{
    FirebaseStorage storage = FirebaseStorage.instance;
    StorageReference raiz = storage.ref();
    StorageReference arq = raiz.child("perfil").child(idLog+".jpg");
    //upload img
    StorageUploadTask task = arq.putFile(_img);
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
    //print(url);
    _atualizarURL(url);
    urlRec = url;
  }
  @action
  _atualizarURL(String url){
    Firestore db = Firestore.instance;
    Map<String, dynamic> dadosAtt = {
      "urlIMG" : url
    };
    db.collection("users").document(getIdLog()).updateData(dadosAtt);
  }
  @action
   atualizarNome(){
    String nome = controllerNome.text;
    Firestore db = Firestore.instance;
    Map<String, dynamic> dadosAtt = {
      "nome" : nome
    };
    db.collection("users").document(idLog).updateData(dadosAtt);
  }

  @action
  recuperarDados() async {
    dados = await repository.getUserData(idLog);
    print("id:" +idLog);
    //userData = user.fromSnapshot(dados);
    controllerNome.text = dados['nome'];
    print("dadoss: " + dados);
  }

    /*FirebaseUser userLog = await auth.getUser();
    _idLog = userLog.uid;
    Firestore db = Firestore.instance;
    DocumentSnapshot snapshot = await db.collection("users").document(_idLog).get();

    Map<String, dynamic> dados = snapshot.data;
    controllerNome.text = dados["nome"];
    if (dados["urlIMG"] != null) {
      //_urlRec = dados["urlIMG"];
        urlRec = dados["urlIMG"];
    }

  }*/

  }
