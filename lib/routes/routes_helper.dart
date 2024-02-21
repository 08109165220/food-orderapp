import 'package:foodorder_m/pages/Food/popular_food_details.dart';
import 'package:foodorder_m/pages/Food/recomended_food_details.dart';
import 'package:foodorder_m/pages/cart/cart_page.dart';
import 'package:foodorder_m/pages/home/main_food_page.dart';
import 'package:get/get.dart';

class RoutesHelper{
  static const String initial="/";
  static const String popularFood="/popular_food";
  static const String recommendedFood="/recommended_food";
  static const String cartPage="/cart_page";

  static String getInitial()=>"$initial";
  static String getPopularFood(int pageId)=>"$popularFood?pageId=$pageId";
  static String getRecommendedFood(int pageId)=>"$recommendedFood?pageId=$pageId";
  static String getCartPage()=>"$cartPage";

  static List<GetPage> routes=[
    GetPage(name: initial, page:()=>MainFoodPage()),

    GetPage(name: popularFood, page:() {
      print('popular food get called');
   var pageId=Get.parameters["pageId"];
        return PopularFoodDetails( pageId: int.parse(pageId!),);
    },
    transition: Transition.fadeIn,
    ),
    GetPage(name: recommendedFood, page:() {
      print('recommended food get called');
      var pageId=Get.parameters["pageId"];
      return RecomendedFoodDetails(pageId: int.parse(pageId!),);
    },
      transition: Transition.fadeIn,
    ),
    GetPage(name: cartPage, page: () {
      return CartPage();
    },
    transition: Transition.fadeIn,
    )
  ];
}