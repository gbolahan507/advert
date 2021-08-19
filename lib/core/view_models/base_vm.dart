import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:jiji_clone/core/utils/dialog_service.dart';
import 'package:jiji_clone/locator.dart';
import 'package:jiji_clone/core/routes/navigator.dart';



class BaseModel extends ChangeNotifier {
  bool _busy = false;
  bool get busy => _busy;
  Connectivity connectivity = Connectivity();
  bool isOnline;
  bool isConnected;
  bool get isOnlined => isOnline;

  DialogService dialog = locator<DialogService>();
  NavigationService navigate = locator<NavigationService>();

  void setBusy(bool value) {
    _busy = value;
    notifyListeners();
  }
}
