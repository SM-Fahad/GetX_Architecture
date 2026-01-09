import 'dart:io';

import 'package:getx_mvvm/data/app_exceptions.dart';
import 'package:getx_mvvm/data/network/base_api_services.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseApiServices {

  @override
  Future<dynamic> getApi(String url) async{
    dynamic responseJson;
    try {
      final response = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 20));
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException("No Internet Connection");
    }

    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = response.body;
        return responseJson;
      case 400:
        throw InternetException("Check your internet connection");
      case 401:
      case 403:
        throw UnauthorizeException();
      case 500:
      default:
        throw ServerException(
            "Error occurred with StatusCode : ${response.statusCode}");
    }
  }
}