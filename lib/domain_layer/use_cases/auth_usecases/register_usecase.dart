import 'package:dartz/dartz.dart';
import 'package:moto_mender/domain_layer/repos/auth_repo.dart';

import '../../../data_layer/models/failure.dart';

class RegisterUseCase{
  AuthRepo repo;
  RegisterUseCase(this.repo);

  Future<Either<Failure, bool>> executeRegister({required String email, required String password,
      required String name, required String phone, required String address}) {
    return repo.register(email: email,
        password: password,
        name: name,
        phone: phone,
        address: address);
  }
}