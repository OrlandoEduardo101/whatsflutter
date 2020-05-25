import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:whatsflutter/res.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class Configs extends StatefulWidget {
  @override
  _ConfigsState createState() => _ConfigsState();
}

class _ConfigsState extends State<Configs> {

  TextEditingController _controllerNome = TextEditingController();
  File _img;
  String _idLog;
  bool _subindo = false;
  String _urlRec;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _recuperarDados();
  }

  Future _recuperarIMG(String origem)async{
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
      setState(() {
        _img = imagemSelecionada;
        if (_img != null) {
          _subindo = true;
          _uploadIMG();
        }
      });
  }

  Future _uploadIMG()async{
    FirebaseStorage storage = FirebaseStorage.instance;
    StorageReference raiz = storage.ref();
    StorageReference arq = raiz.child("perfil").child(_idLog+".jpg");
    //upload img
    StorageUploadTask task = arq.putFile(_img);
    //controle progresso
    task.events.listen((StorageTaskEvent event) { 
      if (event.type == StorageTaskEventType.progress) {
        setState(() {
          _subindo = true;
        });
      }  else if(event.type == StorageTaskEventType.success){
        setState(() {
          _subindo = false;
        });
      }
    });
    //recuperar url da img
    task.onComplete.then((StorageTaskSnapshot value){
      _recuperarURL(value);
    });
  }

  Future _recuperarURL(StorageTaskSnapshot snapshot) async{
    String url = await snapshot.ref.getDownloadURL();
    //print(url);
    _atualizarURL(url);
    setState(() {
      _urlRec = url;
    });
  }

  _atualizarURL(String url){
    Firestore db = Firestore.instance;
    Map<String, dynamic> dadosAtt = {
      "urlIMG" : url
    };
    db.collection("users").document(_idLog).updateData(dadosAtt);
  }

  _atualizarNome(){
    String nome = _controllerNome.text;
    Firestore db = Firestore.instance;
    Map<String, dynamic> dadosAtt = {
      "nome" : nome
    };
    db.collection("users").document(_idLog).updateData(dadosAtt);
  }

  _recuperarDados()async{
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseUser userLog = await auth.currentUser();
    _idLog = userLog.uid;
    Firestore db = Firestore.instance;
    DocumentSnapshot snapshot = await db.collection("users").document(_idLog).get();

    Map<String, dynamic> dados = snapshot.data;
    _controllerNome.text = dados["nome"];
    if (dados["urlIMG"] != null) {
      //_urlRec = dados["urlIMG"];
      setState(() {
        _urlRec = dados["urlIMG"];
      });
    }  
    
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Configurações"),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(16),
                  child: _subindo ? CircularProgressIndicator() : Container(),
                ),
                CircleAvatar(
                  radius: 100,
                  backgroundImage: _urlRec != null ? NetworkImage(_urlRec) : null,
                  backgroundColor: Colors.grey,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FlatButton(
                        onPressed: (){_recuperarIMG("cam");},
                        child: Text("Câmera")
                    ),
                    FlatButton(
                        onPressed: (){_recuperarIMG("galeria");},
                        child: Text("Galeria")
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: TextField(
                    autofocus: true,
                    keyboardType: TextInputType.text,
                    style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                        hintText: "Nome",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32))),
                    controller: _controllerNome,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16, bottom: 10),
                  child: RaisedButton(
                      child: Text(
                        "Salvar",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      color: Colors.green,
                      padding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32)
                      ),
                      onPressed: () {
                        _atualizarNome();
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
