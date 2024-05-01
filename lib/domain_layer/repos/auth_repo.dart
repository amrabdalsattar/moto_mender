import 'package:dartz/dartz.dart';

import '../../data_layer/models/failure.dart';

abstract class AuthRepo {
  Future<Either<Failure, bool>> login(
      {required String email, required String password});

  Future<Either<Failure, bool>> register(
      {required String email,
      required String password,
      required String name,
      required String phone,
      required String address});
}
