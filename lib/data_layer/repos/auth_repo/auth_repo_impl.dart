import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart';
import 'package:moto_mender/data_layer/models/failure.dart';
import 'package:moto_mender/domain_layer/repos/auth_repo.dart';

import '../../models/responses/auth_response.dart';

class AuthRepoImpl extends AuthRepo {
  @override
  Future<Either<Failure, bool>> login(
      {required String email, required String password}) async {
    final ConnectivityResult connectivityResult =
        await (Connectivity().checkConnectivity());

    if ((connectivityResult == ConnectivityResult.wifi ||
        connectivityResult == ConnectivityResult.mobile)) {
      Uri url = Uri.http("10.0.2.2:800", "/user/login");
      Response serverResponse =
          await post(url, body: {"email": email, "password": password});
      AuthResponse loginResponse =
          AuthResponse.fromJson(jsonDecode(serverResponse.body));
      if (serverResponse.statusCode >= 200 && serverResponse.statusCode < 300) {
        print(loginResponse.message);
        return const Right(true);
      } else {
        print("$email, $password");
        print(serverResponse.statusCode);
        print(loginResponse.message);
        return Left(Failure(loginResponse.message ??
            "Something went wrong, please try again later"));
      }
    } else {
      return Left(NetworkFailure(
          "Please check your internet connection and try again later"));
    }
  }

  @override
  Future<Either<Failure, bool>> register(
      {required String email,
      required String password,
      required String name,
      required String phone,
      required String address}) async {
    final ConnectivityResult connectivityResult =
        await (Connectivity().checkConnectivity());

    if ((connectivityResult == ConnectivityResult.wifi ||
        connectivityResult == ConnectivityResult.mobile)) {

      Uri url = Uri.http("10.0.2.2:800", "/user/register");
      Response serverResponse = await post(url, body: {
        "name" : name,
        "email" : email,
        "password" : password,
        "phone" : phone,
        "address" : address
      });

      AuthResponse loginResponse =
          AuthResponse.fromJson(jsonDecode(serverResponse.body));
      if (serverResponse.statusCode >= 200 && serverResponse.statusCode < 300) {
        print(loginResponse.message);
        return const Right(true);
      } else {
        print("$email, $password");
        print(serverResponse.statusCode);
        print(loginResponse.message);
        return Left(Failure(loginResponse.message ??
            "Something went wrong, please try again later"));
      }
    } else {
      return Left(NetworkFailure(
          "Please check your internet connection and try again later"));
    }
  }
}
