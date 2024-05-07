import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:moto_mender/data_layer/models/failure.dart';
import 'package:moto_mender/data_layer/models/requests/register_request_data.dart';
import 'package:moto_mender/domain_layer/repos/auth_repo.dart';
import 'package:moto_mender/utils/api/api_constants.dart';

import '../../models/responses/auth_response.dart';

class AuthRepoImpl extends AuthRepo {
  late Dio dio;

  AuthRepoImpl(this.connectivity) {
    final options = BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: const Duration(seconds: 50),
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
  Connectivity connectivity;
  @override
  Future<Either<Failure, bool>> login(
      {required String email, required String password}) async {
    final ConnectivityResult connectivityResult =
        await (connectivity.checkConnectivity());

    if ((connectivityResult == ConnectivityResult.wifi ||
        connectivityResult == ConnectivityResult.mobile)) {
      try {
        Response serverResponse = await dio
            .post("/auth/login", data: {"email": email, "password": password});
        AuthResponse loginResponse = AuthResponse.fromJson(serverResponse.data);
        if (serverResponse.statusCode! >= 200 &&
            serverResponse.statusCode! < 300) {
          return const Right(true);
        } else {
          return Left(Failure(loginResponse.message ??
              "Something went wrong, please try again later"));
        }
      } catch (e) {
        return (Left(Failure(e.toString())));
      }
    } else {
      return (Left(NetworkFailure(
          "Please check your internet connection and try again later")));
    }
  }

  @override
  Future<Either<Failure, bool>> register(
      {required RegisterRequestData data}) async {
    final ConnectivityResult connectivityResult =
        await (connectivity.checkConnectivity());

    if ((connectivityResult == ConnectivityResult.wifi ||
        connectivityResult == ConnectivityResult.mobile)) {
      try {
        Response serverResponse = await dio.post("/auth/register", data: data.toJson());

        AuthResponse authResponse = AuthResponse.fromJson(serverResponse.data);

        if (serverResponse.statusCode! >= 200 &&
            serverResponse.statusCode! < 300) {

          return const Right(true);
        } else {
          return Left(Failure(authResponse.message ??
              "Something went wrong, please try again later"));
        }
      } catch (e) {
        return Left(Failure(e.toString()));
      }
    } else {
      return Left(NetworkFailure(
          "Please check your internet connection and try again later"));
    }
  }
}
