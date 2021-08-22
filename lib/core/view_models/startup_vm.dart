import 'package:jiji_clone/core/storage/local_storage.dart';
import 'package:jiji_clone/core/routes/routes.dart';
import 'base_vm.dart';





class StartUpViewModel extends BaseModel {
  bool hasLoggedIn = false;

  Future<void> isLoggedIn() async {
    final String token = AppCache.getToken();
    if (token != null ) {
      hasLoggedIn = true;
      Future<void>.delayed(const Duration(seconds: 2), () {
        navigate.navigateToReplacing(HomeScreenView);
      });
    } else
      Future<void>.delayed(const Duration(seconds: 2), () {
        navigate.navigateToReplacing(SignupView);
      });

    notifyListeners();
  }
}
