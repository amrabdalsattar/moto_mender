import 'package:dartz/dartz.dart';
import 'package:moto_mender/data_layer/models/requests/add_produt_request.dart';

import '../../data_layer/models/failure.dart';

abstract class ProductServicesRepo {
  Future<Either<Failure, bool>> addProduct(
      {required AddProductRequest data});
}
