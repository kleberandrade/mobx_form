import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  @observable
  double amount = 0.0;

  @action
  void setAmount(double value) {
    amount = value;
    result = 3.0 * value;
  }

  @observable
  double result = 0.0;

  @action
  void setResult(double value) {
    result = value;
    amount = value / 3.0;
  }
}
