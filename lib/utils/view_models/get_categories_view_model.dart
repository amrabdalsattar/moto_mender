import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moto_mender/data_layer/models/responses/categories_response.dart';
import 'package:moto_mender/data_layer/repos/categories_repos/get_categories_repo_impl.dart';
import 'package:moto_mender/utils/base_states.dart';

class GetCategoriesViewModel extends Cubit<CategoriesStates>{
  GetCategoriesViewModel() : super(GetCategoriesLoadingState());
  void getCategories() async {
    emit(GetCategoriesLoadingState());
    try{
      CategoriesResponse? categoriesResponse = await CategoriesApiManager().getCategories();
      if (categoriesResponse != null &&
          categoriesResponse.categories?.isNotEmpty == true){
        emit(GetCategoriesSuccessState(categoriesResponse.categories!));
      }else {
        throw "Something Went Wrong";
      }
    }catch (e){
      emit(GetCategoriesErrorState(e.toString()));
    }
}
}
abstract class CategoriesStates{}

class GetCategoriesSuccessState extends CategoriesStates{
  List<CategoryData> categories;
  GetCategoriesSuccessState(this.categories);
}

class GetCategoriesErrorState extends CategoriesStates{
  String error;
  GetCategoriesErrorState(this.error);
}

class GetCategoriesLoadingState extends CategoriesStates{}

