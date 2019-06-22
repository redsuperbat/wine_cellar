import 'package:flutter/widgets.dart';
import 'package:wine_cellar/core/services/settings_service.dart';

class BaseModel extends ChangeNotifier {
  bool _busy = false;

  bool get busy => _busy;


  void setBusy(bool busy) {
    _busy = busy;
    notifyListeners();
  }
}