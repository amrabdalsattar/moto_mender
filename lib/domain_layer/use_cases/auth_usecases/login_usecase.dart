import 'package:dartz/dartz.dart';

import '../../../data_layer/models/failure.dart';
import '../../repos/auth_repo.dart';

class LoginUseCase {
  AuthRepo repo;

  LoginUseCase(this.repo);

  Future<Either<Failure, bool>> executeLogin({required String email, required String password}) {
    return repo.login(email: email, password: password);
  }
}
