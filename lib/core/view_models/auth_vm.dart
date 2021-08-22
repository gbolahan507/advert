import 'package:flutter/material.dart';
import 'package:jiji_clone/core/api/auth_api.dart';
import 'package:jiji_clone/core/model/edit_profile.dart';
import 'package:jiji_clone/core/model/profile_model.dart';
import 'package:jiji_clone/core/model/user_model.dart';
import 'package:jiji_clone/core/storage/local_storage.dart';
import 'package:jiji_clone/core/utils/custom_exception.dart';
import 'package:jiji_clone/locator.dart';
import 'package:jiji_clone/core/routes/routes.dart';
import 'package:jiji_clone/view/widgets/snackbar.dart';
import 'base_vm.dart';

class AuthViewModel extends BaseModel {
  final AuthApi _authApi = locator<AuthApi>();
  String error1;
  String error2;
  String error3;
  String token;

  UserModel userModel;
  ProfileModel profileModel;
  EditProfileModel editProfileModel;

  Future<void> createUsers(
      BuildContext context, Map<String, String> data) async {
    setBusy(true);
    try {
      userModel = await _authApi.createUser(data);
      dialog.showDialog(
          title: 'Success', description: 'Login into your account');
      setBusy(false);
      navigate.navigateToReplacing(LoginView);
      notifyListeners();
    } on CustomException catch (e) {
      error2 = e.message;
      setBusy(false);
      showSnackBar(context, 'Error', '${e.message}');
      showErrorDialog(e);
      notifyListeners();
    }
  }

  Future<void> loginUser(BuildContext context, Map<String, String> data) async {
    setBusy(true);
    try {
      userModel = await _authApi.loginUsers(data);
      AppCache.saveToken(userModel.token);
      AppCache.saveUser(userModel);
      navigate.navigateToReplacing(HomeScreenView);
      setBusy(false);
      notifyListeners();
    } on CustomException catch (e) {
      error2 = e.message;
      setBusy(false);
      showSnackBar(context, 'Error', '${e.message}');
      showErrorDialog(e);
      notifyListeners();
    }
  }

  Future<void> getMe() async {
    setBusy(true);
    try {
      profileModel = await _authApi.getMe();
      AppCache.saveToken(userModel.token);
      setBusy(false);
      notifyListeners();
      return profileModel;
    } on CustomException catch (e) {
      error1 = e.message;
      setBusy(false);
      showErrorDialog(e);
      notifyListeners();
    }
  }

  Future<void> editgetMe(Map<String, String> data) async {
    setBusy(true);
    try {
      editProfileModel = await _authApi.editgetMe(data);
      setBusy(false);
      notifyListeners();
      return profileModel;
    } on CustomException catch (e) {
      error1 = e.message;
      setBusy(false);
      showErrorDialog(e);
      notifyListeners();
    }
  }

  logout() {
    _authApi.logOut();
    navigate.navigateTo(LogOutView);
    // SystemNavigator.pop();
    notifyListeners();
  }

  void showErrorDialog(CustomException e) {
    dialog.showDialog(
        title: 'Error', description: e.message, buttonTitle: 'Close');
  }
}
