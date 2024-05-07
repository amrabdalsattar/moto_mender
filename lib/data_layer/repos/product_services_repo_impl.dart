import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:moto_mender/data_layer/models/failure.dart';
import 'package:moto_mender/domain_layer/repos/product_services_repo.dart';
import 'package:moto_mender/utils/api/api_constants.dart';

import '../models/requests/add_produt_request.dart';

class ProductServicesRepoImpl extends ProductServicesRepo {
  late Dio dio;

  ProductServicesRepoImpl() {
    final options = BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 50),
      receiveDataWhenStatusError: true,
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

  @override
  Future<Either<Failure, bool>> addProduct(
      {required AddProductRequest data}) async {
    final ConnectivityResult connectivityResult =
        await (Connectivity().checkConnectivity());

    if ((connectivityResult == ConnectivityResult.wifi ||
        connectivityResult == ConnectivityResult.mobile)) {
      try{
        Response serverResponse = await dio.post("/products", data: data.toJson());
        // AddProductResponse addProductResponse = AddProductResponse.fromJson(serverResponse.data);
          if (serverResponse.statusCode! >= 200 &&
              serverResponse.statusCode! < 300) {
            return const Right(true);
          } else {
            return Left(Failure("Error Message"));
          }
      }catch (e){
        return left(Failure(e.toString()));
      }

    } else {
      return left(NetworkFailure(
          "Please check your internet connection and try again later"));
    }
  }
}
