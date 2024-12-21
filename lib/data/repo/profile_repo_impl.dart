import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/failures/failure.dart';
import 'package:e_commerce_app/data/dataSources/remoteDataSource/profile_remote_data_source.dart';
import 'package:e_commerce_app/data/models/add_address_model.dart';
import 'package:e_commerce_app/data/models/get_logged_user_address_model.dart';
import 'package:e_commerce_app/domain/entity/user_addreese_entity.dart';
import 'package:e_commerce_app/domain/repo/profile_repo.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: ProfileRipo)
class ProfileRepoImpl implements ProfileRipo {
  ProfileRepoImpl(this.profileRemoteDs);
  ProfileRemoteDs profileRemoteDs;
  @override
  Future<Either<Failure, AddAddressModel>> addAddress(
      UserAddreeseEntity userAddreeseEntity) async{
    var either = await profileRemoteDs.addAddress(userAddreeseEntity);
    return either.fold(
        (failure) => Left(failure), (response) => Right(response));
  }

  @override
  Future<Either<Failure, GetLoggedUserAddressModel>> getLoggedUserAddresse() async{
     var either = await profileRemoteDs.getLoggedUserAddresse();
    return either.fold(
        (failure) => Left(failure), (response) => Right(response));
  }
}
