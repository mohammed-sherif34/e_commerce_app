abstract class PaymentState {}

final class PaymentInitial extends PaymentState {}

final class PaymentErr extends PaymentState {
  final String errMsg;

  PaymentErr({required this.errMsg});
}

final class PaymentLoading extends PaymentState {}

final class PaymentSuccess extends PaymentState {}
