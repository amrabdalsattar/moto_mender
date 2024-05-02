import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moto_mender/data_layer/models/failure.dart';
import 'package:moto_mender/utils/base_states.dart';

import '../../domain_layer/use_cases/auth_usecases/login_usecase.dart';

class LoginViewModel extends Cubit {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool passwordShowed = true;

  LoginUseCase loginUseCase;

  LoginViewModel(this.loginUseCase) : super(BaseInitialState());

  void login() async {
    if (!formKey.currentState!.validate()) return;
    emit(BaseLoadingState());

    Either<Failure, bool> response = await loginUseCase.executeLogin(
        email: email.text, password: password.text);

    response.fold((error) => emit(BaseErrorState(error.errorMessage)),
        (success) => emit(BaseSuccessState()));
  }
}
