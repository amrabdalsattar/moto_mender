import 'package:dartz/dartz.dart';

import '../../data_layer/models/failure.dart';
import '../../data_layer/models/requests/register_request_data.dart';

abstract class AuthRepo {
  Future<Either<Failure, bool>> login(
      {required String email, required String password});

  Future<Either<Failure, bool>> register(
      {required RegisterRequestData data});
}
