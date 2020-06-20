import 'package:mobx/mobx.dart';

part 'caixaMsg_controller.g.dart';

class CaixaMsgController = _CaixaMsgControllerBase with _$CaixaMsgController;

abstract class _CaixaMsgControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
