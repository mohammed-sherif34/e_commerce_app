import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/failures/failure.dart';
import 'package:e_commerce_app/domain/entity/payment_intent_input_entity.dart';
import 'package:e_commerce_app/domain/repo/checkout_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class MakePaymentUseCase {
  MakePaymentUseCase(this.checkoutRepo);
  CheckoutRepo checkoutRepo;
  Future<Either<Failure, void>> call(
          PaymentIntentInputEntitiy paymentIntentInputEntitiy) =>
      checkoutRepo.makePayment(
          paymentIntentInputEntitiy: paymentIntentInputEntitiy);
}
