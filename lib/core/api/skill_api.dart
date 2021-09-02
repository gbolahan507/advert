import 'package:dio/dio.dart';
import 'package:jiji_clone/app/messages.dart';
import 'package:jiji_clone/core/api/base_api.dart';
import 'package:jiji_clone/core/model/error_model.dart';
import 'package:jiji_clone/core/model/service_model.dart';
import 'package:jiji_clone/core/model/skills_model.dart';
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
}
