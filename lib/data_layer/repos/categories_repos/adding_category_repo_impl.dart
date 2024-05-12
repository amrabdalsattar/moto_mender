import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:moto_mender/data_layer/models/responses/adding_categories_response.dart';

import '../../../utils/api/api_constants.dart';
import '../../models/failure.dart';

class AddCategoryRepoImpl {
  late Dio dio;

  AddCategoryRepoImpl() {
    BaseOptions options = BaseOptions(
        receiveDataWhenStatusError: true,
        receiveTimeout: const Duration(seconds: 20),
        connectTimeout: const Duration(seconds: 20),
        baseUrl: ApiConstants.baseUrl);
    dio = Dio(options);
    dio.interceptors.add(LogInterceptor(
        error: true,
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true));
  }
  Future<Either<Failure, bool>> addCategory({required String name}) async {
    final ConnectivityResult connectivityResult =
    await (Connectivity().checkConnectivity());
    if ((connectivityResult == ConnectivityResult.wifi ||
        connectivityResult == ConnectivityResult.mobile)) {
      try {
        Response serverResponse =
        await dio.post("/categories/", data: {"name": name});
        AddingCategoriesResponse categoriesResponse =
        AddingCategoriesResponse.fromJson(serverResponse.data);
        if (serverResponse.statusCode! >= 200 &&
            serverResponse.statusCode! < 300) {
          return const Right(true);
        } else {
          return Left(Failure(categoriesResponse.status.toString()));
        }
      } catch (e) {
        return (Left(Failure(e.toString())));
      }
    } else {
      return (Left(Failure(
          "Please check your internet connection and try again later")));
    }
  }
}
