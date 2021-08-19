import 'package:dio/dio.dart';
import 'package:jiji_clone/core/storage/local_storage.dart';
import 'package:jiji_clone/locator.dart';
import 'package:jiji_clone/app/messages.dart';
import 'package:jiji_clone/core/routes/navigator.dart';
import 'package:jiji_clone/core/utils/dialog_helper.dart';


class BaseAPI {
  var dio = Dio();
  String baseUrl = kBaseUrl;
  Options defaultOptions = Options(
      sendTimeout: 20000, // 20 seconds
      receiveTimeout: 20000, // 20 seconds
      contentType: 'application/json',
      headers: {'Authorization': "Bearer ${AppCache.getToken()}"},
      validateStatus: (status) => status < 500);

    // Options profileOptions = Options(
    //   sendTimeout: 20000, // 20 seconds
    //   receiveTimeout: 20000, // 20 seconds
    //   contentType: 'application/json',
    //   headers: {'Authorization': "Bearer ${AppCache.getToken()}"},
    //   validateStatus: (status) => status < 500);


  NavigationService navigate = locator<NavigationService>();

   void  handleError(error) {
    if (error == 400) {
      var message = error.message;
      DialogHelper.showErroDialog(description: message);

    } else if(error == 401){
         var message = error.message;
      DialogHelper.showErroDialog(description: message);

    }else if(error == 201){
         var message = error.message;
      DialogHelper.showErroDialog(description: message);

    }else if(error == 403){
         var message = error.message;
      DialogHelper.showErroDialog(description: message);

    }
  }


}


