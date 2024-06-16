import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_ecommerce/AQS/controllers/Category_controller.dart';
import 'package:ui_ecommerce/res/colors.dart';

class Categories extends StatelessWidget {
   Categories({super.key});
   final Category_controller controller = Get.put(Category_controller());
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: bestproductslist(),
    );
  }
   bestproductslist() {
     return ListView.builder(
       padding: EdgeInsets.only(top: Get.width * 0.05),
       shrinkWrap: true, // You won't see infinite size error
       itemCount: controller.categoriesList.length,
       itemBuilder: (BuildContext context, int index) {
         final Category = controller.categoriesList[index];
         return CategoryItem(
             Category.image,
             Category.title,
             Category.id
         );
       },
     );
   }
   CategoryItem(String url , String title  , int index){
     return Container(
       margin: EdgeInsets.only(bottom: Get.width * 0.01 , left: Get.width * 0.03 ),
       padding: EdgeInsets.all(Get.width * 0.005),
       decoration: BoxDecoration(
         color: Colors.white,
         borderRadius: BorderRadius.all(Radius.circular(10)),
         boxShadow: [
           BoxShadow(
             color: Colors.grey.withOpacity(0.2),
             spreadRadius: 5,
             blurRadius: 7,
             offset: Offset(0, 3), // changes position of shadow
           ),
         ],
       ),

       child: Row(
         children: [
           CachedNetworkImage(
             height: Get.height * 0.08,
             width: Get.height * 0.05,
             imageUrl: url,
             imageBuilder: (context, imageProvider) => Container(
               decoration: BoxDecoration(
                 image: DecorationImage(
                   image: imageProvider,
                   fit: BoxFit.scaleDown,
                 ),
               ),
             ),
             placeholder: (context, url) => const CircularProgressIndicator(),
             errorWidget: (context, url, error) => const Icon(Icons.error),
           ),
           spaceW(Get.width * 0.05),
           Text(
             title,
             style: TextStyle(
               color: AppColors.aqsfullGreen,
               fontSize: Get.width * 0.05,
               fontWeight: FontWeight.bold
             ),
           )
         ],
       ),
     );
   }
   SizedBox spaceH(double size) {
     return SizedBox(
       height: size,
     );
   }
   SizedBox spaceW(double size) {
     return SizedBox(
       width: size,
     );
   }
   Padding filtersIcon (){
     return Padding(padding: EdgeInsetsDirectional.only(start: Get.height * 0.009 , end: Get.height * 0.009),
       child: const Icon(Icons.tune),
     );
   }
   Padding searchTextInput() {
     return Padding(padding: EdgeInsetsDirectional.only(start: Get.height * 0.02 , end: Get.height * 0.002),
       child: SizedBox(
           width: Get.width * 0.83,
           child: TextField(
             decoration:  InputDecoration(
               fillColor: const Color(0xfff1ebf1),
               filled: true,
               prefixIcon: const Icon(Icons.search),
               hintText: '27'.tr,
               enabledBorder: const OutlineInputBorder(
                 borderRadius: BorderRadius.all(Radius.circular(20.0)),
                 borderSide:  BorderSide(
                   color: Color(0xfff1ebf1),
                 ),
               ),
               focusedBorder: const OutlineInputBorder(
                 borderRadius: BorderRadius.all(Radius.circular(20.0)),
                 borderSide: BorderSide(color:Color(0xfff1ebf1),),
               ),
             ),
           )),
     );
   }
}
