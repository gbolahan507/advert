// import 'package:flutter/cupertino.dart';
// import 'package:jiji_clone/core/api/profile_api.dart';
// import 'package:jiji_clone/core/model/profile_model.dart';
// import 'package:jiji_clone/core/view_models/base_vm.dart';
// import 'package:jiji_clone/core/utils/custom_exception.dart';
// import 'package:jiji_clone/locator.dart';

// ProfileModel profileModel;

// class ProfileViewModel extends BaseModel {
//   final ProfileApi _profileApi = locator<ProfileApi>();

//   String error1;
//   String error2;
//   String error3;
//   ProfileModel profileModel;

//   Future<ProfileModel> getMe(BuildContext context) async {
//     setBusy(true);
//     try {
//      final profileModel = await _profileApi.getMe();
//       setBusy(false);
//       notifyListeners();
//       return profileModel;
//     } on CustomException catch (e) {
//       error1 = e.message;
//       setBusy(false);
//       showErrorDialog(e);
//       notifyListeners();
//       return profileModel;
//     }
//   }

//   void showErrorDialog(CustomException e) {
//     dialog.showDialog(
//         title: 'Error', description: e.message, buttonTitle: 'Close');
//   }
// }
