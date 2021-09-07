import 'dart:io';
import 'package:dio/dio.dart';
import 'package:jiji_clone/app/messages.dart';
import 'package:jiji_clone/core/api/base_api.dart';
import 'package:jiji_clone/core/model/error_model.dart';
import 'package:jiji_clone/core/model/post_service.dart';
import 'package:jiji_clone/core/model/service_model.dart';
import 'package:jiji_clone/core/model/skills_model.dart';
import 'package:jiji_clone/core/model/uploadimg.dart';
import 'package:jiji_clone/core/storage/local_storage.dart';
import 'package:jiji_clone/core/utils/custom_exception.dart';
import 'package:jiji_clone/core/utils/error_util.dart';
import 'package:logger/logger.dart';

class SkillsApi extends BaseAPI {
  Logger log = Logger();
  List<SkillsModel> data = <SkillsModel>[];

  Future<List<SkillsModel>> getAllSkills() async {
    try {
      var response = await Dio().get("$baseUrl/skills-category",
          options: defaultOptions.copyWith(
            headers: {'Authorization': "Bearer ${AppCache.getToken()}"},
          ));
      switch (response.statusCode) {
        case SERVER_OKAY:
          data = (response.data as List)
              .map((e) => SkillsModel.fromJson(e))
              .toList();
          return data;
          break;
        default:
          throw ErrorModel.fromJson(response.data).error;
          break;
      }
    } catch (e) {
      throw CustomException(DioErrorUtil.handleError(e));
    }
  }

  Future<List<Datum>> getService(String serviceId) async {
    try {
      var response = await Dio().get("$baseUrl/services/$serviceId",
          options: defaultOptions.copyWith(
            headers: {'Authorization': "Bearer ${AppCache.getToken()}"},
          ));
      log.d(response.data);
      switch (response.statusCode) {
        case SERVER_OKAY:
          return ServiceModel.fromJson(response.data).data;
          break;
        default:
          throw ErrorModel.fromJson(response.data).error;
          break;
      }
    } catch (e) {
      log.d(e);
      throw CustomException(DioErrorUtil.handleError(e));
    }
  }

  Future<PostServiceModel> postService(
      Map<String, dynamic> data, List<File> images) async {
    final FormData formData = FormData.fromMap(data);

    for (final File image in images) {
      formData.files.add(MapEntry<String, MultipartFile>(
          "images",
          MultipartFile.fromFileSync(image.path,
              filename: image.path.split('/').last)));

      print(image.path);
    }
    try {
      var response = await Dio().post("$baseUrl/offer-service",
          data: data,
          options: defaultOptions.copyWith(
            contentType: 'multipart/form-data',
            headers: {'Authorization': "Bearer ${AppCache.getToken()}"},
          ));
      log.d(response.data);
      switch (response.statusCode) {
        case SERVER_OKAY:
          return PostServiceModel.fromJson(response.data);
          break;
        default:
          throw ErrorModel.fromJson(response.data).error;
          break;
      }
    } catch (e) {
      throw CustomException(DioErrorUtil.handleError(e));
    }
  }

  

  Future<String> uploadImage2(List<File> images) async {
    final FormData formData = FormData();
    for (final File image in images) {
      formData.files.add(MapEntry<String, MultipartFile>(
          'file',
          MultipartFile.fromFileSync(image.path,
              filename: image.path.split('/').last)));
    }
    try {
      var response = await dio.post<dynamic>(
        '$baseUrl/image-upload',
        data: formData,
        options: defaultOptions.copyWith(
            contentType: 'multipart/form-data',
            headers: {'Authorization': "Bearer ${AppCache.getToken()}"}),
        onSendProgress: (int sent, int total) {
          final double progress = (sent * 100) / total;
          print('progress: $progress ($sent/$total)');
        },
      );
      log.d(response.data);
      switch (response.statusCode) {
        case SERVER_OKAY:
          return UploadImageModel.fromJson(response.data).url;
          break;
        default:
          throw ErrorModel.fromJson(response.data).error;
      }
    } catch (e) {
      log.d(e);
      throw CustomException(DioErrorUtil.handleError(e));
    }
  }
}
