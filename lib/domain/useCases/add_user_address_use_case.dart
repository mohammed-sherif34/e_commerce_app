import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/failures/failure.dart';
import 'package:e_commerce_app/data/models/add_address_model.dart';
import 'package:e_commerce_app/domain/entity/user_addreese_entity.dart';
import 'package:e_commerce_app/domain/repo/profile_repo.dart';
import 'package:injectable/injectable.dart';
@injectable
class AddUserAddressUseCase {
  AddUserAddressUseCase(this.profileRipo);
  ProfileRipo profileRipo;
  Future<Either<Failure, AddAddressModel>> call(
          UserAddreeseEntity userAddreeseEntity) =>
      profileRipo.addAddress(userAddreeseEntity);
}
