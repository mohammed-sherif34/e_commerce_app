import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/api/api_manager.dart';
import 'package:e_commerce_app/core/api/end_points.dart';
import 'package:e_commerce_app/core/utils/api_keys.dart';
import 'package:e_commerce_app/data/models/ephemeral_key_model.dart';
import 'package:e_commerce_app/data/models/payment_intent_model.dart';
import 'package:e_commerce_app/domain/entity/payment_intent_input_entity.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:injectable/injectable.dart';

@injectable
class StripServices {
  StripServices(this._apiManager);

  final ApiManager _apiManager;

  Future<PaymentIntentModel> createPaymentIntents(
      PaymentIntentInputEntitiy paymentIntentInputEntitiy) async {
    var response = await _apiManager.post(
        endPoint: EndPoints.createPaymentIntent,
        body: paymentIntentInputEntitiy.toJson(),
        contentType: Headers.formUrlEncodedContentType,
        headers: {"Authorization": "Bearer ${ApiKeys.secretKey}"});
    return PaymentIntentModel.fromJson(response.data);
  }

  Future<EphemeralKeyModel> createEphemeralKey(
      {required String customerId}) async {
    var response = await _apiManager.post(
        endPoint: EndPoints.createEphemeralKey,
        body: {'customer': customerId},
        contentType: Headers.formUrlEncodedContentType,
        headers: {
          "Authorization": "Bearer ${ApiKeys.secretKey}",
          "Stripe-Version": "2024-12-18.acacia",
        });
    return EphemeralKeyModel.fromJson(response.data);
  }

  Future initePaymentSheet(
      InitePaymentSheetInputModel initePaymentSheetInputModel) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret:
            initePaymentSheetInputModel.paymentIntentClientSecret,
        merchantDisplayName: initePaymentSheetInputModel.merchantDisplayName,
        customerId: initePaymentSheetInputModel.customerId,
        customerEphemeralKeySecret:
            initePaymentSheetInputModel.customerEphemeralKeySecret,
      ),
    );
  }

  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future makePayment(
      PaymentIntentInputEntitiy paymentIntentInputEntitiy) async {
    var paymentIntentModel =
        await createPaymentIntents(paymentIntentInputEntitiy);
    var ephemeralKeyModel = await createEphemeralKey(
        customerId: paymentIntentInputEntitiy.customerId);
    InitePaymentSheetInputModel initePaymentSheetInputModel =
        InitePaymentSheetInputModel(
            paymentIntentClientSecret: paymentIntentModel.clientSecret!,
            merchantDisplayName: 'Route',
            customerId: paymentIntentInputEntitiy.customerId,
            customerEphemeralKeySecret: ephemeralKeyModel.secret!);
    await initePaymentSheet(initePaymentSheetInputModel);
    await displayPaymentSheet();
  }
}

/*
 Future initePaymentSheet(String paymentIntentClientSecret) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: paymentIntentClientSecret,
        merchantDisplayName: 'Route',
        customerId:'' ,
        customerEphemeralKeySecret: '',
      ),
    );
  }

*/
class InitePaymentSheetInputModel {
  final String merchantDisplayName;
  final String customerId;
  final String customerEphemeralKeySecret;
  final String paymentIntentClientSecret;
  InitePaymentSheetInputModel(
      {required this.paymentIntentClientSecret,
      required this.merchantDisplayName,
      required this.customerId,
      required this.customerEphemeralKeySecret});
}
