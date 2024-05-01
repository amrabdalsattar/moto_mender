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
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController address = TextEditingController();

  RegisterUseCase registerUseCase;

  RegisterViewModel(this.registerUseCase) : super(BaseInitialState());

  void register(String email, String password, String name, String phone,
      String address) async {
    if (!formKey.currentState!.validate()) return;
    emit(BaseLoadingState());

    Either<Failure, bool> response = await registerUseCase.executeRegister(
        email: email,
        password: password,
        name: name,
        phone: phone,
        address: address);

    response.fold((error) => emit(BaseErrorState(error.errorMessage)),
        (success) => emit(BaseSuccessState()));
  }
}
