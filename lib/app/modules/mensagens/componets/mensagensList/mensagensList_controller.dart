import 'package:mobx/mobx.dart';

part 'mensagensList_controller.g.dart';

class MensagensListController = _MensagensListControllerBase
    with _$MensagensListController;

abstract class _MensagensListControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
