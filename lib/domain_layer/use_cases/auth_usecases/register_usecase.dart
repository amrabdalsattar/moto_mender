import 'package:dartz/dartz.dart';
import 'package:moto_mender/data_layer/models/requests/register_request_data.dart';
import 'package:moto_mender/domain_layer/repos/auth_repo.dart';

import '../../../data_layer/models/failure.dart';

class RegisterUseCase{
  AuthRepo repo;
  RegisterUseCase(this.repo);

  Future<Either<Failure, bool>> executeRegister({required RegisterRequestData data}) {
    return repo.register(data: data);
  }
}