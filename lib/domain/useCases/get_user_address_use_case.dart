import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/failures/failure.dart';
import 'package:e_commerce_app/data/models/get_logged_user_address_model.dart';
import 'package:e_commerce_app/domain/repo/profile_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetLoggedUserAddresseUseCase {
  GetLoggedUserAddresseUseCase(this.profileRipo);
  ProfileRipo profileRipo;
  Future<Either<Failure, GetLoggedUserAddressModel>> call() =>
      profileRipo.getLoggedUserAddresse();
}
