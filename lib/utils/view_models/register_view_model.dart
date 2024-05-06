import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moto_mender/data_layer/models/failure.dart';
import 'package:moto_mender/domain_layer/use_cases/auth_usecases/register_usecase.dart';
import 'package:moto_mender/utils/base_states.dart';

class RegisterViewModel extends Cubit {
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController reEnterPassword = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController address = TextEditingController();

  RegisterUseCase registerUseCase;

  RegisterViewModel(this.registerUseCase) : super(BaseInitialState());

  void register() async {
    if (!formKey.currentState!.validate()) return;
    emit(BaseLoadingState());

    Either<Failure, bool> response = await registerUseCase.executeRegister(
        email: email.text,
        password: password.text,
        name: name.text,
        phone: phone.text,
        address: address.text);

    response.fold((error) => emit(BaseErrorState(error.errorMessage)),
        (success) => emit(BaseSuccessState()));
  }

  bool isPasswordStrong(String password) {
    return
        password.contains(RegExp(r'[A-Z]')) &&
        password.contains(RegExp(r'[a-z]')) &&
        password.contains(RegExp(r'[0-9]'));
  }
}
