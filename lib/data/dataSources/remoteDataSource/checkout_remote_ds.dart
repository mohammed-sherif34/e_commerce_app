import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/failures/failure.dart';
import 'package:e_commerce_app/domain/entity/payment_intent_input_entity.dart';

abstract class CheckoutRemoteDs {
  Future<Either<Failure, void>> makePayment(
      {required PaymentIntentInputEntitiy paymentIntentInputEntitiy});
}
