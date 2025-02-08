const baseUrl = 'https://ecommerce.routemisr.com/api/v1';
const stripBaseUrl = 'https://api.stripe.com/v1';

abstract class EndPoints {
  static const login = '$baseUrl/auth/signin';
  static const signup = '$baseUrl/auth/signup';
  static const categories = '$baseUrl/categories';
  static const brands = '$baseUrl/brands';
  static const products = '$baseUrl/products';
  static const cart = '$baseUrl/cart';
  static const favourite = '$baseUrl/wishlist';
  static const addressPost = '$baseUrl/addresses';
  static const addressGet = '$baseUrl/addresses';
  static const createPaymentIntent = '$stripBaseUrl/payment_intents';
    static const createEphemeralKey = '$stripBaseUrl/ephemeral_keys';

}
