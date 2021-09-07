import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jiji_clone/core/api/skill_api.dart';
import 'package:jiji_clone/core/model/post_service.dart';
import 'package:jiji_clone/core/model/service_model.dart';
import 'package:jiji_clone/core/model/skills_model.dart';
import 'package:jiji_clone/core/model/uploadimg.dart';
import 'package:jiji_clone/core/routes/router.dart';
import 'package:jiji_clone/core/utils/auth_exception.dart';
import 'package:jiji_clone/core/utils/custom_exception.dart';
import 'package:jiji_clone/core/view_models/base_vm.dart';
import 'package:jiji_clone/locator.dart';
import 'package:jiji_clone/view/screen/Admin/post_service.dart';
import 'package:jiji_clone/view/widgets/export.dart';

class SkillsViewModel extends BaseModel {
  final SkillsApi _skillsApi = locator<SkillsApi>();

  String error;

  //get all skills
  List<SkillsModel> allSkills;
  List<Datum> allServices;
  PostServiceModel postServiceModel;
  String url;
  UploadImageModel uploadImageModel;

  Future<void> getAllSkills() async {
    setBusy(true);
    try {
      allSkills = await _skillsApi.getAllSkills();
      setBusy(false);
    } on AuthException catch (e) {
      setBusy(false);
      await dialog.showDialog(
          title: 'Error!', description: e.message, buttonTitle: 'Close');
      notifyListeners();
    }
  }

  Future<void> getService(String serviceName) async {
    setBusy(true);
    try {
      allServices = await _skillsApi.getService(serviceName);
      setBusy(false);
    } on AuthException catch (e) {
      setBusy(false);
      await dialog.showDialog(
          title: 'Error!', description: e.message, buttonTitle: 'Close');
      notifyListeners();
    }
  }

  Future<void> postService(BuildContext context, Map<String, dynamic> data,
      List<File> images) async {
    setBusy(true);
    try {
      postServiceModel = await _skillsApi.postService(data, images);
      dialog.showDialog(
          title: 'Success', description: 'Service Uploaded Successfully');
      setBusy(false);
      // routeTo(context, LoginScreen(userModel: userModel));
      notifyListeners();
    } on CustomException catch (e) {
      error = e.message;
      setBusy(false);
      showSnackBar(context, 'Error', '${e.message}');
      showErrorDialog(e);
      notifyListeners();
    }
  }

  Future<void> uploadImage2(BuildContext context, File images) async {
    setBusy(true);
    try {
      url = await _skillsApi.uploadImage2([images]);
      dialog.showDialog(
          title: 'Success',
          description: 'Profile Picture updated successfully',
          buttonTitle: 'Close');
      setBusy(false);
    } on CustomException catch (e) {
      error = e.message;
      setBusy(false);
      showErrorDialog(e);
    }
  }

  //   Future<void> postService(
  //    BuildContext context, dynamic data,) async {
  //   setBusy(true);
  //   try {
  //     postServiceModel = await _skillsApi.postService(context, data);
  //     dialog.showDialog(
  //         title: 'Success', description: 'Service Uploaded Successfully');
  //     setBusy(false);
  //     // routeTo(context, LoginScreen(userModel: userModel));
  //     notifyListeners();
  //   } on CustomException catch (e) {
  //     error = e.message;
  //     setBusy(false);
  //     showSnackBar(context, 'Error', '${e.message}');
  //     showErrorDialog(e);
  //     notifyListeners();
  //   }
  // }

  void showErrorDialog(CustomException e) {
    dialog.showDialog(
        title: 'Error', description: e.message, buttonTitle: 'Close');
  }
}
