import 'package:dartz/dartz.dart';

import '../../data_layer/models/failure.dart';

abstract class ProductServicesRepo {
  Future<Either<Failure, bool>> addProduct(
      {required String name,
      required String description,
      required num price,
      required String category,
      required String imagePath});
}
