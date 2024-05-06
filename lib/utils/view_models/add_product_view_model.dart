import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moto_mender/utils/base_states.dart';

import '../../data_layer/models/failure.dart';
import '../../domain_layer/use_cases/product_services_use_cases/add_product_use_case.dart';

class AddProductViewModel extends Cubit {
  TextEditingController name = TextEditingController();
  TextEditingController category = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController imagePath = TextEditingController();

  AddProductUseCase useCase;

  AddProductViewModel(this.useCase) : super(BaseLoadingState());

  void addProduct() async {
    emit(BaseLoadingState());

    Either<Failure, bool> response = await useCase.execute(
        name: name.text,
        description: description.text,
        price: num.parse(price.text),
        category: category.text,
        imagePath: imagePath.text);
    response.fold((error) => emit(BaseErrorState(error.errorMessage)),
        (success) => emit(BaseSuccessState()));
  }
}
