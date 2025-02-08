import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/failures/failure.dart';
import 'package:e_commerce_app/core/utils/constants_manager.dart';
import 'package:e_commerce_app/core/utils/strip_services.dart';
import 'package:e_commerce_app/data/dataSources/remoteDataSource/checkout_remote_ds.dart';
import 'package:e_commerce_app/domain/entity/payment_intent_input_entity.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CheckoutRemoteDs)
class CheckoutRemoteDsImp implements CheckoutRemoteDs {
  CheckoutRemoteDsImp(this.stripServices);
  StripServices stripServices;
  @override
  Future<Either<Failure, void>> makePayment(
      {required PaymentIntentInputEntitiy paymentIntentInputEntitiy}) async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      try {
        await stripServices.makePayment(paymentIntentInputEntitiy);
        return const Right(null);
      } on Exception catch (e) {
        return Left(Failure(errMessage: e.toString()));
      }
    } else {
      return Left(NetworkErr(errMessage: Constants.checkInternet));
    }
  }
}
