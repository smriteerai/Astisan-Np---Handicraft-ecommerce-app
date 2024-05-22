import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/dummy_helper.dart';
import '../../../data/models/product_model.dart';
import '../../base/controllers/base_controller.dart';
import '../../cart/controllers/cart_controller.dart';

class ProductDetailsController extends GetxController {
  // get product details from arguments
  ProductModel product = Get.arguments;

  // for the product size
  var selectedSize = 'M';

  /// when the user press on the favorite button
  onFavoriteButtonPressed() {
    Get.find<BaseController>().onFavoriteButtonPressed(productId: product.id!);
    update(['FavoriteButton']);
  }

  /// when the user press on add to cart button
  onAddToCartPressed() {
    var mProduct = DummyHelper.products.firstWhere((p) => p.id == product.id);
    mProduct.quantity = mProduct.quantity! + 1;
    mProduct.size = selectedSize;
    Get.find<CartController>().getCartProducts();
    Get.back();

    Get.snackbar(
      'Cart Updated', // Title
      'Product added to cart successfully!', // Message
      snackPosition: SnackPosition.TOP, // Position of the snackbar
      backgroundColor: Colors.green,
      colorText: Colors.white,
      borderRadius: 20,
      margin: EdgeInsets.all(15),
      duration: Duration(seconds: 2), // How long the snackbar will be shown
    );
  }

  /// change the selected size
  changeSelectedSize(String size) {
    if (size == selectedSize) return;
    selectedSize = size;
    update(['Size']);
  }
}
