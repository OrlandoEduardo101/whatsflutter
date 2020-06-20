import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:whatsflutter/app/modules/login/model/user_model.dart';
import 'package:whatsflutter/app/modules/mensagens/model/conversa_model.dart';
import 'package:whatsflutter/app/shared/auth/auth_controller.dart';
import 'package:whatsflutter/app/shared/firebaseStorage/repositories/firebaseStorage_repository_interface.dart';
import 'package:whatsflutter/app/shared/services/imagePicker_service.dart';

import 'model/mensagem_model.dart';

part 'mensagens_controller.g.dart';

class MensagensController = _MensagensControllerBase with _$MensagensController;

abstract class _MensagensControllerBase with Store {
  final IFirebaseStorageRepository repository;
  AuthController auth = Modular.get();

  @observable
  int value = 0;

  @observable
  String idLog;

  @observable
  UserModel contato;

  @action
  setContato(value) => contato = value;

  @observable
  String idDest;

  @action
  setIdDest(value) => idDest = value;

  @observable
  File img;
  @observable
  bool subindo = false;
  @observable
  UserModel logado = UserModel();
  @observable
  TextEditingController controllerMsg = TextEditingController();
  @observable
  ScrollController scrollController = ScrollController();
  @observable
  var controllerStream = StreamController<QuerySnapshot>.broadcast();



  @observable
  String teste;

  @action
  setContatoTeste(value) => teste = value;


  _MensagensControllerBase(this.repository){
    recuperarDadosMensagens();

  }

  @action
  enviarMsg() {
    String msg = controllerMsg.text;
    if (msg.isNotEmpty) {
      MensagemModel msgm = MensagemModel();
      msgm.idUser = idLog;
      msgm.msg = msg;
      msgm.urlIMG = "";
      msgm.data = Timestamp.now().toString();
      msgm.tipo = "text";
      salvarMsg(idLog, idDest, msgm);
      salvarMsg(idDest, idLog, msgm);
      salvarConversa(msgm);
    }
  }

  @action
  salvarMsg(String idRemet, String idDest, MensagemModel msg) async {
    repository.salvarMensagem(idRemet, idDest, msg.toMap());
    controllerMsg.clear();
  }

  @action
  salvarConversa(MensagemModel msg){
    //recuperarDadosMensagens();
    ConversaModel cRemet = ConversaModel();
    cRemet.idRemet = idLog;
    cRemet.idDest = idDest;
    cRemet.mensagem = msg.msg;
    cRemet.nome = contato.nome;
    cRemet.URLfoto = contato.urlIMG;
    cRemet.tipo = msg.tipo;
    cRemet.data = Timestamp.now().toString();
    repository.salvarConversa(cRemet.idRemet, cRemet.idDest, cRemet.toMap());

    ConversaModel cDest = ConversaModel();

    cDest.idRemet = idDest;
    cDest.idDest = idLog;
    cDest.mensagem = msg.msg;
    cDest.nome = logado.nome;
    print("LOGADO "+logado.nome);
    cDest.URLfoto = logado.urlIMG;
    cDest.tipo = msg.tipo;
    cDest.data = Timestamp.now().toString();
    print("IDDEST "+ cDest.idDest);
    repository.salvarConversa(cDest.idRemet, cDest.idDest, cDest.toMap());

  }
  @observable
  DocumentSnapshot snapshot;

  @action
  recuperarDadosMensagens() async {
    idLog = auth.user.uid;
    //print("contato id " + contato.uid);
    snapshot =  await repository.recuperarDadosMensagens(idLog) ;

    print("idlog:" +idLog);

    Map<String, dynamic> dados = snapshot.data;
    print("LOGAAADOO: "+dados.toString());

    logado.nome = dados['nome'];
    print("LOGAAADOO: "+logado.nome);

    if (dados["urlIMG"] != null) {
      logado.urlIMG = dados["urlIMG"];
    }

     ListenerMsgs(auth.user.uid, contato.uid);

  }


  @observable
  ObservableStream<List<MensagemModel>> mensagens;

  @action
  Stream<QuerySnapshot> ListenerMsgs(String idLog, String idDest){
    mensagens = repository.listenerMensagens(idLog, idDest).asObservable();
    print("Stream:  " + mensagens.toString());
    mensagens.listen((event) {
      Timer(
          Duration(seconds: 1), (){
        scrollController.jumpTo(scrollController.position.maxScrollExtent);
      });
    });

  }

  @action
  Future enviarFoto() async {
    String nome = DateTime.now().millisecondsSinceEpoch.toString();

    img = await ImagePickerService().capturarImagemGaleria();


    var task = repository.salvarImagemConversa(idLog, nome, img);

    //controle progresso
    task.events.listen((StorageTaskEvent event) {
      if (event.type == StorageTaskEventType.progress) {

          subindo = true;
        }
       else if(event.type == StorageTaskEventType.success){

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
    MensagemModel msgm = MensagemModel();
    msgm.idUser = idLog;
    msgm.msg = "";
    msgm.urlIMG = url;
    msgm.data = Timestamp.now().toString();
    msgm.tipo = "img";

    salvarMsg(idLog, idDest, msgm);
    salvarMsg(idDest, idLog, msgm);
    salvarConversa(msgm);
  }


}
