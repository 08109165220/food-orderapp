import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodorder_m/utils/dimensions.dart';
import 'package:foodorder_m/widgets/small_text.dart';


import '../../utils/colors.dart';
import '../../widgets/Big_text.dart';
import 'Food_page_body.dart';
class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    print("Current height is "+MediaQuery.of(context).size.height.toString());
    return  Scaffold(
      body: Column(
        children: [
          Container(
            child: Container(
              margin: EdgeInsets.only(top: Dimensions.height45,bottom: Dimensions.height15),
              padding: EdgeInsets.only(right: Dimensions.width20,left: Dimensions.width20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(text: 'Bangladesh',color: AppColors.mainColor,),
                      Row(
                        children: [
                          SmallText(text: "Narsingdi",color: Colors.black54),
                          Icon(Icons.arrow_drop_down_rounded)
                        ],
                      ),
                    ],
                  ),


                  Center(
                    child: Container(
                      height: Dimensions.height45,
                      width: Dimensions.height45,
                      child: Icon(Icons.search,color: Colors.white,size: Dimensions.iconSize24,),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.radius15),
                        color: AppColors.mainColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
                child: Foodpagebody()),
          )
        ],
      ),
    );
  }
}
