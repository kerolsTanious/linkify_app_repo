abstract class EndPoints {
  static const String signup = "auth/signup";
  static const String confirmEmail = "auth/confirm-email";
  static const String login = "auth/login";
  static const String forgetPassword = "auth/forget-password";
  static const String resetPassword = "auth/reset-password";
  static const String getAllCategories = "category/brands/categories";
  static const String getAllBrands = "Brands/";

  static String getAllProductsByCategory({required String categoryId}) {
    return "subCategory/categories/$categoryId/subcategories";
  }

  static String getCategoriesByBrandId({required String brandId}) {
    return "category/brands/$brandId/categories";
  }

  static const String addProductToCart = "cart/";
  static const String getAllProductsInCart = "cart/";

  static String deleteItemsFromCart({required String itemId}) {
    return "cart/items/$itemId";
  }

  static String updateCartItems({required String itemId}) {
    return "cart/items/$itemId";
  }

  static const String saveAddress = "address/";
  static const String createOrder = "order";
  static const String clearCart = "cart/clear";
  static const String createPaymentIntent = "payment_intents";
  static const String createNewCustomer = "customers";
  static const String ephemeralKeys = "ephemeral_keys";

  static String getOrderDetails({required String orderId}) {
    return "order/$orderId";
  }
}
