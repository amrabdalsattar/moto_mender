import 'package:dartz/dartz.dart';
import 'package:moto_mender/data_layer/models/failure.dart';
import 'package:moto_mender/domain_layer/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo{

  @override
  Either<Failure, bool> login(String email, String password){
    ///API Call here
    if(false){
      return Right(true);
    }else{
      return Left(Failure("Error"));
    }
  }
}