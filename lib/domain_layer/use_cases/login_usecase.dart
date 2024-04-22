import 'package:dartz/dartz.dart';

import '../../data_layer/models/failure.dart';
import '../repos/auth_repo.dart';

class LoginUseCase {
  AuthRepo repo;

  LoginUseCase(this.repo);

  Either<Failure, bool>  execute(String email, String password) {
    return repo.login(email, password);
  }
}
