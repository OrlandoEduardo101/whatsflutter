import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:whatsflutter/app/modules/home/components/conversas/model/conversas_model.dart';
import 'package:whatsflutter/app/modules/login/model/user_model.dart';
import 'package:whatsflutter/app/modules/mensagens/model/mensagem_model.dart';

abstract class IFirebaseStorageRepository{
      Stream<UserModel> getUserData(String id);
      setUserData(String id, Map<String, dynamic> map);
      StorageUploadTask uploadIMG(String id, File img);
      updateURL(String url, Map<String, dynamic> dadosAtt);
      updateName(String nome, Map<String, dynamic> dadosAtt);
      updateData(String nome, Map<String, dynamic> dadosAtt);
      Stream<List<UserModel>> recuperarContatos();
      Stream<List<ConversasModel>> recuperarConversas(String idLog);
      Future<Map<String, dynamic>> verifyUserData(String id);
      salvarMensagem(String idRemet, String idDest, Map<String, dynamic> msg);
      salvarConversa(String idRemet, String idDest, Map<String, dynamic> msg);
      Future<DocumentSnapshot> recuperarDadosMensagens(String idLog);
      Stream<List<MensagemModel>> listenerMensagens(String idLog, String idDest);
      StorageUploadTask salvarImagemConversa(String idRemet,String nome, File img);
}