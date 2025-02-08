import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/failures/failure.dart';
import 'package:e_commerce_app/data/dataSources/remoteDataSource/checkout_remote_ds.dart';
import 'package:e_commerce_app/domain/entity/payment_intent_input_entity.dart';
import 'package:e_commerce_app/domain/repo/checkout_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CheckoutRepo)
class CheckoutRepoImpl implements CheckoutRepo {
  CheckoutRepoImpl(this.checkoutRemoteDs);
  CheckoutRemoteDs checkoutRemoteDs;
  @override
  Future<Either<Failure, void>> makePayment(
      {required PaymentIntentInputEntitiy paymentIntentInputEntitiy}) async {
    var either = await checkoutRemoteDs.makePayment(
        paymentIntentInputEntitiy: paymentIntentInputEntitiy);
    return either;
  }
}
