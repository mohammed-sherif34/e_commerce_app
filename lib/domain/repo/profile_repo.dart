import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/failures/failure.dart';
import 'package:e_commerce_app/data/models/add_address_model.dart';
import 'package:e_commerce_app/data/models/get_logged_user_address_model.dart';
import 'package:e_commerce_app/domain/entity/user_addreese_entity.dart';

abstract class ProfileRipo {
  Future<Either<Failure, AddAddressModel>> addAddress(
      UserAddreeseEntity userAddreeseEntity);
  Future<Either<Failure, GetLoggedUserAddressModel>> getLoggedUserAddresse();
}
