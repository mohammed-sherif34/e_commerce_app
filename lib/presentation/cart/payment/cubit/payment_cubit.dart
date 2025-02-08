import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/domain/entity/payment_intent_input_entity.dart';
import 'package:e_commerce_app/domain/useCases/make_payment_use_case.dart';
import 'package:e_commerce_app/presentation/cart/payment/cubit/payment_state.dart';
import 'package:injectable/injectable.dart';
@injectable
class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit(this._makePaymentUseCase) : super(PaymentInitial());
  final MakePaymentUseCase _makePaymentUseCase;
  makePayment(PaymentIntentInputEntitiy paymentIntentInputEntitiy) async {
    emit(PaymentLoading());
    var either = await _makePaymentUseCase.call(paymentIntentInputEntitiy);
    either.fold(
      (failure) => emit(PaymentErr(errMsg: failure.errMessage)),
      (success) => emit(PaymentSuccess()),
    );
  }
}
