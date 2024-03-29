import 'package:flutter/material.dart';
import 'package:foodorder_m/controllers/cart_controller.dart';
import 'package:foodorder_m/data/repository/popular_product_repo.dart';
import 'package:foodorder_m/utils/colors.dart';
import 'package:get/get.dart';

import '../models/products_models.dart';

class PopularProductController extends GetxController{
  final PopularProductRepo popularProductRepo;
  PopularProductController( {
    required this.popularProductRepo,
});
  List<ProductModel> _popularProductList=[];
  List<ProductModel> get popularProductList=>_popularProductList;
  late CartController _cart;

  bool _isLoaded=false;
  bool get isLoaded=>_isLoaded;

  int _quantity=0;
  int get quantity=>_quantity;
  int _inCartItems=0;
  int get inCartItems=>_inCartItems+quantity;

  Future<void>getpopularProductList()async {
    Response response=await popularProductRepo.getPopulaProductList();
    if(response.statusCode==200){
      print('got product');
      _popularProductList=[];
      _popularProductList.addAll(Product.fromJson(response.body).products );
      //print(_popularProductList);
      _isLoaded=true;
      update();
    }else{

    }
  }

  void setQuantity(bool isIncrement){
   if(isIncrement){
     //print('increments'+_quantity.toString());
      _quantity=checkQuantity(_quantity+1);
   }else{
     _quantity=checkQuantity(_quantity-1);
     //print('decrements'+_quantity.toString());
   }
   update();
  }

  //_inCartItem=2;
  //_quantity=0;
  //quantity=-2;
  int checkQuantity(int quantity){
   if((_inCartItems+quantity)<0){
     Get.snackbar("item count", "you can't reduce more !",
      backgroundColor: AppColors.mainColor,
       colorText: Colors.white,
     );
     if(_inCartItems>0){
       _quantity=-_inCartItems;
       return _quantity;
     }
     return 0;
   }else if((_inCartItems+quantity)>20){
     Get.snackbar("item count", "you can't add more !",
       backgroundColor: AppColors.mainColor,
       colorText: Colors.white,
     );
     return 20;
   }else{
     return quantity;
   }
  }


  void initProduct(ProductModel product,CartController cart){
    _quantity=0;
    _inCartItems=0;
    _cart=cart;
    var exist=false;
    exist=_cart.existInCart(product);
    //if exit
    //get from storage _inCartItems=3
    print('exist or not'+exist.toString());

    if(exist){
      _inCartItems=_cart.getQuantity(product);
    }
    print("the quantity in the cart is"+_inCartItems.toString());
  }


  void addItem(ProductModel product) {
    _cart.addItem(product, _quantity);

    _quantity = 0;
    _inCartItems = _cart.getQuantity(product);

    _cart.items.forEach((key, value) {
      print("The id is " + value.id.toString() + "the quantity is" +
          value.quantity.toString());
    });

    update();
  }

  int get totalItems{
    return _cart.totalItems;
  }
}