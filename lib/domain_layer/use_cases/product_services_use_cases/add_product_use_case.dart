import 'package:dartz/dartz.dart';
import 'package:moto_mender/domain_layer/repos/product_services_repo.dart';

import '../../../data_layer/models/failure.dart';

class AddProductUseCase {
  ProductServicesRepo repo;

  AddProductUseCase(this.repo);

  Future<Either<Failure, bool>> execute(
      {required String name,
      required String description,
      required num price,
      required String category,
      required String imagePath}) {
    return repo.addProduct(
        name: name,
        description: description,
        price: price,
        category: category,
        imagePath: imagePath);
  }
}
