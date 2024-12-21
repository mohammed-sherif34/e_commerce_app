const baseUrl = 'https://ecommerce.routemisr.com';

abstract class EndPoints {
  static const login = '$baseUrl/api/v1/auth/signin';
  static const signup = '$baseUrl/api/v1/auth/signup';
  static const categories = '$baseUrl/api/v1/categories';
  static const brands = '$baseUrl/api/v1/brands';
  static const products = '$baseUrl/api/v1/products';
  static const cart = '$baseUrl/api/v1/cart';
  static const favourite = '$baseUrl/api/v1/wishlist';
  static const addressPost = '$baseUrl/api/v1/addresses';
  static const addressGet = '$baseUrl/api/v1/addresses';

}
