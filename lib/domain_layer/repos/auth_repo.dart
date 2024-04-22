import 'package:dartz/dartz.dart';

import '../../data_layer/models/failure.dart';

abstract class AuthRepo{
  Either<Failure, bool>  login(String email, String password);
}