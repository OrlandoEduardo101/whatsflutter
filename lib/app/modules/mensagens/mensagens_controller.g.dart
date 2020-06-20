// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mensagens_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MensagensController on _MensagensControllerBase, Store {
  final _$valueAtom = Atom(name: '_MensagensControllerBase.value');

  @override
  int get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  final _$idLogAtom = Atom(name: '_MensagensControllerBase.idLog');

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

  final _$contatoAtom = Atom(name: '_MensagensControllerBase.contato');

  @override
  UserModel get contato {
    _$contatoAtom.reportRead();
    return super.contato;
  }

  @override
  set contato(UserModel value) {
    _$contatoAtom.reportWrite(value, super.contato, () {
      super.contato = value;
    });
  }

  final _$idDestAtom = Atom(name: '_MensagensControllerBase.idDest');

  @override
  String get idDest {
    _$idDestAtom.reportRead();
    return super.idDest;
  }

  @override
  set idDest(String value) {
    _$idDestAtom.reportWrite(value, super.idDest, () {
      super.idDest = value;
    });
  }

  final _$imgAtom = Atom(name: '_MensagensControllerBase.img');

  @override
  File get img {
    _$imgAtom.reportRead();
    return super.img;
  }

  @override
  set img(File value) {
    _$imgAtom.reportWrite(value, super.img, () {
      super.img = value;
    });
  }

  final _$subindoAtom = Atom(name: '_MensagensControllerBase.subindo');

  @override
  bool get subindo {
    _$subindoAtom.reportRead();
    return super.subindo;
  }

  @override
  set subindo(bool value) {
    _$subindoAtom.reportWrite(value, super.subindo, () {
      super.subindo = value;
    });
  }

  final _$logadoAtom = Atom(name: '_MensagensControllerBase.logado');

  @override
  UserModel get logado {
    _$logadoAtom.reportRead();
    return super.logado;
  }

  @override
  set logado(UserModel value) {
    _$logadoAtom.reportWrite(value, super.logado, () {
      super.logado = value;
    });
  }

  final _$controllerMsgAtom =
      Atom(name: '_MensagensControllerBase.controllerMsg');

  @override
  TextEditingController get controllerMsg {
    _$controllerMsgAtom.reportRead();
    return super.controllerMsg;
  }

  @override
  set controllerMsg(TextEditingController value) {
    _$controllerMsgAtom.reportWrite(value, super.controllerMsg, () {
      super.controllerMsg = value;
    });
  }

  final _$scrollControllerAtom =
      Atom(name: '_MensagensControllerBase.scrollController');

  @override
  ScrollController get scrollController {
    _$scrollControllerAtom.reportRead();
    return super.scrollController;
  }

  @override
  set scrollController(ScrollController value) {
    _$scrollControllerAtom.reportWrite(value, super.scrollController, () {
      super.scrollController = value;
    });
  }

  final _$controllerStreamAtom =
      Atom(name: '_MensagensControllerBase.controllerStream');

  @override
  StreamController<QuerySnapshot> get controllerStream {
    _$controllerStreamAtom.reportRead();
    return super.controllerStream;
  }

  @override
  set controllerStream(StreamController<QuerySnapshot> value) {
    _$controllerStreamAtom.reportWrite(value, super.controllerStream, () {
      super.controllerStream = value;
    });
  }

  final _$testeAtom = Atom(name: '_MensagensControllerBase.teste');

  @override
  String get teste {
    _$testeAtom.reportRead();
    return super.teste;
  }

  @override
  set teste(String value) {
    _$testeAtom.reportWrite(value, super.teste, () {
      super.teste = value;
    });
  }

  final _$snapshotAtom = Atom(name: '_MensagensControllerBase.snapshot');

  @override
  DocumentSnapshot get snapshot {
    _$snapshotAtom.reportRead();
    return super.snapshot;
  }

  @override
  set snapshot(DocumentSnapshot value) {
    _$snapshotAtom.reportWrite(value, super.snapshot, () {
      super.snapshot = value;
    });
  }

  final _$mensagensAtom = Atom(name: '_MensagensControllerBase.mensagens');

  @override
  ObservableStream<List<MensagemModel>> get mensagens {
    _$mensagensAtom.reportRead();
    return super.mensagens;
  }

  @override
  set mensagens(ObservableStream<List<MensagemModel>> value) {
    _$mensagensAtom.reportWrite(value, super.mensagens, () {
      super.mensagens = value;
    });
  }

  final _$salvarMsgAsyncAction =
      AsyncAction('_MensagensControllerBase.salvarMsg');

  @override
  Future salvarMsg(String idRemet, String idDest, MensagemModel msg) {
    return _$salvarMsgAsyncAction
        .run(() => super.salvarMsg(idRemet, idDest, msg));
  }

  final _$recuperarDadosMensagensAsyncAction =
      AsyncAction('_MensagensControllerBase.recuperarDadosMensagens');

  @override
  Future recuperarDadosMensagens() {
    return _$recuperarDadosMensagensAsyncAction
        .run(() => super.recuperarDadosMensagens());
  }

  final _$enviarFotoAsyncAction =
      AsyncAction('_MensagensControllerBase.enviarFoto');

  @override
  Future<dynamic> enviarFoto() {
    return _$enviarFotoAsyncAction.run(() => super.enviarFoto());
  }

  final _$_recuperarURLAsyncAction =
      AsyncAction('_MensagensControllerBase._recuperarURL');

  @override
  Future<dynamic> _recuperarURL(StorageTaskSnapshot snapshot) {
    return _$_recuperarURLAsyncAction.run(() => super._recuperarURL(snapshot));
  }

  final _$_MensagensControllerBaseActionController =
      ActionController(name: '_MensagensControllerBase');

  @override
  dynamic setContato(dynamic value) {
    final _$actionInfo = _$_MensagensControllerBaseActionController.startAction(
        name: '_MensagensControllerBase.setContato');
    try {
      return super.setContato(value);
    } finally {
      _$_MensagensControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setIdDest(dynamic value) {
    final _$actionInfo = _$_MensagensControllerBaseActionController.startAction(
        name: '_MensagensControllerBase.setIdDest');
    try {
      return super.setIdDest(value);
    } finally {
      _$_MensagensControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setContatoTeste(dynamic value) {
    final _$actionInfo = _$_MensagensControllerBaseActionController.startAction(
        name: '_MensagensControllerBase.setContatoTeste');
    try {
      return super.setContatoTeste(value);
    } finally {
      _$_MensagensControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic enviarMsg() {
    final _$actionInfo = _$_MensagensControllerBaseActionController.startAction(
        name: '_MensagensControllerBase.enviarMsg');
    try {
      return super.enviarMsg();
    } finally {
      _$_MensagensControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic salvarConversa(MensagemModel msg) {
    final _$actionInfo = _$_MensagensControllerBaseActionController.startAction(
        name: '_MensagensControllerBase.salvarConversa');
    try {
      return super.salvarConversa(msg);
    } finally {
      _$_MensagensControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Stream<QuerySnapshot> ListenerMsgs(String idLog, String idDest) {
    final _$actionInfo = _$_MensagensControllerBaseActionController.startAction(
        name: '_MensagensControllerBase.ListenerMsgs');
    try {
      return super.ListenerMsgs(idLog, idDest);
    } finally {
      _$_MensagensControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value},
idLog: ${idLog},
contato: ${contato},
idDest: ${idDest},
img: ${img},
subindo: ${subindo},
logado: ${logado},
controllerMsg: ${controllerMsg},
scrollController: ${scrollController},
controllerStream: ${controllerStream},
teste: ${teste},
snapshot: ${snapshot},
mensagens: ${mensagens}
    ''';
  }
}
