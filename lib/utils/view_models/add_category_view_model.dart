import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moto_mender/data_layer/repos/categories_repos/adding_category_repo_impl.dart';
import 'package:moto_mender/utils/base_states.dart';

import '../../data_layer/models/failure.dart';

class AddCategoryViewModel extends Cubit{
  AddCategoryViewModel() : super(BaseInitialState());
  TextEditingController name = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void addCategory() async {
    if (!formKey.currentState!.validate()) return;
    emit(BaseLoadingState());
    Either<Failure, bool> response = await AddCategoryRepoImpl().addCategory(name: name.text);

    response.fold((error) => emit(BaseErrorState(error.errorMessage)),
            (success) => emit(AddCategorySuccess("Category Added Successfully")));
}
}

class AddCategorySuccess{
  String message;
  AddCategorySuccess(this.message);
}