import 'package:flutter/material.dart';
import 'package:foodorder_m/controllers/popular_product_controller.dart';
import 'package:foodorder_m/pages/Food/popular_food_details.dart';
import 'package:foodorder_m/pages/Food/recomended_food_details.dart';
import 'package:foodorder_m/pages/cart/cart_page.dart';
import 'package:foodorder_m/pages/home/Food_page_body.dart';
import 'package:foodorder_m/pages/home/main_food_page.dart';
import 'package:foodorder_m/routes/routes_helper.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'controllers/recomended_product_controller.dart';
import 'helper/dependencies.dart' as dep;


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getpopularProductList();
    Get.find<RecommendedProductController>().getRecomendedProductList();
    return GetMaterialApp(debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:MainFoodPage(),
      initialRoute: RoutesHelper.initial,
      getPages: RoutesHelper.routes,
    );
  }
}


