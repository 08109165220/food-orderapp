import 'package:foodorder_m/controllers/cart_controller.dart';
import 'package:foodorder_m/controllers/popular_product_controller.dart';
import 'package:foodorder_m/data/api/api_client.dart';
import 'package:foodorder_m/data/repository/cart_repo.dart';
import 'package:foodorder_m/data/repository/popular_product_repo.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controllers/recomended_product_controller.dart';
import '../data/repository/recommended_product_repo.dart';
import '../utils/app_constants.dart';

Future<void>init()async {
  //api client
Get.lazyPut(()=>ApiClient(appBaseUrl:AppConstants.BASE_URL));
//repository
Get.lazyPut(() => PopularProductRepo(apiClient:Get.find()));
Get.lazyPut(() => RecommendedProductRepo(apiClient:Get.find()));
Get.lazyPut(()=>CartRepo());
//controller
Get.lazyPut(() => RecommendedProductController(recommendedProductRepo:Get.find(),));
Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find(),));
Get.lazyPut(() => CartController(cartRepo: Get.find()));
}