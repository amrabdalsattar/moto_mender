import 'package:dartz/dartz.dart';
import 'package:moto_mender/domain_layer/repos/product_services_repo.dart';

import '../../../data_layer/models/failure.dart';
import '../../../data_layer/models/requests/add_produt_request.dart';

class AddProductUseCase {
  ProductServicesRepo repo;

  AddProductUseCase(this.repo);

  Future<Either<Failure, bool>> execute(
      {required AddProductRequest data}) {
    return repo.addProduct(data: data);
  }
}
