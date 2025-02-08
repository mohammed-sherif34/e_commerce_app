class PaymentIntentInputEntitiy {
  final String amount;
  final String currency;
  final String customerId;

  PaymentIntentInputEntitiy({required this.amount, required this.currency,required this.customerId});
  toJson() {
    return {
      "amount": amount,
      "currency": currency,
      "customer":customerId,
    };
  }
}
