import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moto_mender/data_layer/models/requests/add_produt_request.dart';
import 'package:moto_mender/utils/base_states.dart';

import '../../data_layer/models/failure.dart';
import '../../domain_layer/use_cases/product_services_use_cases/add_product_use_case.dart';

class AddProductViewModel extends Cubit {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController category = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController price = TextEditingController();
  String imagePath = "";

  AddProductUseCase useCase;

  AddProductViewModel(this.useCase) : super(BaseInitialState());

  void addProduct() async {
    if (!formKey.currentState!.validate()) return;
    emit(BaseLoadingState());

    Either<Failure, bool> response = await useCase.execute(
        data: AddProductRequest(
            category: category.text,
            description: description.text,
            imagePath: imagePath,
            name: name.text,
            price: double.parse(price.text)));

    response.fold((error) => emit(BaseErrorState(error.errorMessage)),
        (success) => emit(AddProductSuccessState("Product Added Successfully")));
  }
}

class AddProductSuccessState{
  String message;
  AddProductSuccessState(this.message);
}
