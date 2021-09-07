import 'dart:async';
import 'package:dio/dio.dart';
import 'package:jiji_clone/core/model/edit_profile.dart';
import 'package:jiji_clone/core/model/error_model.dart';
import 'package:jiji_clone/core/model/profile_model.dart';
import 'package:jiji_clone/core/model/user_model2.dart';
import 'package:jiji_clone/core/storage/local_storage.dart';
import 'package:jiji_clone/core/utils/custom_exception.dart';
import 'package:jiji_clone/core/utils/error_util.dart';
import 'package:jiji_clone/app/messages.dart';
import 'package:logger/logger.dart';
import 'base_api.dart';

class AuthApi extends BaseAPI {
  Logger log = Logger();

  UserModel userModel;

  Future<UserModel> createUser(Map<String, dynamic> data) async {
    try {
      var response = await Dio()
          .post("$baseUrl/signup", data: data, options: defaultOptions);
      switch (response.statusCode) {
        case SERVER_OKAY:
          return UserModel.fromJson(response.data);
          break;
        default:
          throw ErrorModel.fromJson(response.data).error;
          break;
      }
    } catch (e) {
      throw CustomException(DioErrorUtil.handleError(e));
    }
  }

  Future<UserModel> loginUsers(Map<String, dynamic> data) async {
    try {
      var response = await Dio()
          .post("$baseUrl/login", data: data, options: defaultOptions);
      // log.d(response.data);
      switch (response.statusCode) {
        case SERVER_OKAY:
          return UserModel.fromJson(response.data);
          break;
        default:
          throw ErrorModel.fromJson(response.data).error;
          break;
      }
    } catch (e) {
      throw CustomException(DioErrorUtil.handleError(e));
    }
  }

  Future<ProfileModel> getMe() async {
    try {
      var response = await Dio().get("$baseUrl/me",
          options: defaultOptions.copyWith(
            contentType: 'application/json',
            headers: {'Authorization': "Bearer ${AppCache.getToken()}"},
          ));
      // log.d(response.data);
      switch (response.statusCode) {
        case SERVER_OKAY:
          return ProfileModel.fromJson(response.data);
          break;
        default:
          throw ErrorModel.fromJson(response.data).error;
          break;
      }
    } catch (e) {
      throw CustomException(DioErrorUtil.handleError(e));
    }
  }

  Future<EditProfileModel> editgetMe(Map<String, String> data) async {
    try {
      var response = await Dio().put("$baseUrl/profile",
          options: defaultOptions.copyWith(
            contentType: 'application/json',
            headers: {'Authorization': "Bearer ${AppCache.getToken()}"},
          ));
      log.d(response.data);
      switch (response.data) {
        case SERVER_OKAY:
          return EditProfileModel.fromJson(response.data);
          break;
        default:
          throw ErrorModel.fromJson(response.data).error;
          break;
      }
    } catch (e) {
      throw CustomException(DioErrorUtil.handleError(e));
    }
  }

  logOut() {
    Future.delayed(const Duration(seconds: 2), () => AppCache.clear());
  }
}
