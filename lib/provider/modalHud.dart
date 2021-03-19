import 'package:flutter/foundation.dart';

class ModalHud extends ChangeNotifier {
  bool isLoading = false;
  changeIsLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }
}
