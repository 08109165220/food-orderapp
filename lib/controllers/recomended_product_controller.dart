import 'package:foodorder_m/data/repository/popular_product_repo.dart';
import 'package:get/get.dart';

import '../data/repository/recommended_product_repo.dart';
import '../models/products_models.dart';

class RecommendedProductController extends GetxController{
  final RecommendedProductRepo recommendedProductRepo;
  RecommendedProductController( {
    required this.recommendedProductRepo,
  });
  List<ProductModel> _recommendedProductList=[];
  List<ProductModel> get recommendedProductList=>_recommendedProductList;

  bool _isLoaded=false;
  bool get isLoaded=>_isLoaded;

  Future<void>getRecomendedProductList()async {
    Response response=await recommendedProductRepo.getRecommendedProductList();
    if(response.statusCode==200){
      print('got product Recommended');
      _recommendedProductList=[];
      _recommendedProductList.addAll(Product.fromJson(response.body).products );
      //print(_popularProductList);
      _isLoaded=true;
      update();
    }else{
      print('could not got product Recommended');
    }
  }
}