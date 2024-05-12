import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:moto_mender/data_layer/models/responses/categories_response.dart';
import 'package:moto_mender/utils/api/api_constants.dart';

class CategoriesApiManager{
  late Dio dio;
  CategoriesApiManager(){
    BaseOptions options = BaseOptions(
      receiveDataWhenStatusError: true,
      receiveTimeout: const Duration(seconds: 20),
      connectTimeout: const Duration(seconds: 20),
      baseUrl: ApiConstants.baseUrl
    );
    dio = Dio(options);
    dio.interceptors.add(LogInterceptor(
        error: true,
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true));
  }

  Future<CategoriesResponse?> getCategories() async {
    final ConnectivityResult connectivityResult =
    await (Connectivity().checkConnectivity());
    if ((connectivityResult == ConnectivityResult.wifi ||
        connectivityResult == ConnectivityResult.mobile)) {
        Response serverResponse = await dio.get("/categories/");
        Map json = serverResponse.data;
        CategoriesResponse categoriesResponse = CategoriesResponse.fromJson(json);
        if (serverResponse.statusCode! >= 200 &&
            serverResponse.statusCode! < 300) {
          return categoriesResponse;
        } else {
          throw Exception("Something Went Wrong, Please Try Again");
      }
    }
    return null;
  }

}