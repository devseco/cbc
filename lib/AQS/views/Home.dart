import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:easy_autocomplete/easy_autocomplete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:ui_ecommerce/AQS/controllers/Home_controller.dart';
import 'package:ui_ecommerce/AQS/controllers/Landing_controller.dart';
import 'package:ui_ecommerce/AQS/views/Categories_home.dart';
import 'package:ui_ecommerce/main.dart';

import '../../res/colors.dart';
class Home_AQS extends StatelessWidget {
  Home_AQS({super.key});
  final Home_controller controller = Get.put(Home_controller());
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      resizeToAvoidBottomInset: false,
      body: RefreshIndicator(
        onRefresh: () async{
          controller.fetchProducts();
          controller.fetchCategories();
          controller.fetchSliders();
        },
        child: Column(
          children: [
            Obx(() {
              if(!controller.isLoadingSliders.value){
                return (controller.slidersList.length > 0)? sliders() : placholder404();
              }else{
                return placholderSlider();
              }
            }),
            Row(
              children: [
                searchTextInput(),
              ],
            ),
            spaceH(Get.height * 0.01),
            Expanded(child: ListView(
              children: [
                categorieslabels(),
                spaceH(Get.height * 0.010),
                Container(
                  height: Get.height * 0.25,
                  child: Obx((){
                    if(!controller.isLoadingCategories.value){
                      return (controller.categoriesList.length > 0 ) ? categories() : Center(child: Text("20".tr),);
                    }else{
                      return Center(child: CircularProgressIndicator(),);
                    }
                  }),
                ),
                spaceH(Get.height * 0.01),
                bestproductslabels(),
                spaceH(Get.height * 0.02),
                Obx(() {
                  if(!controller.isLoadingProductes.value){
                    if ((controller.productsList.isNotEmpty)) {
                      return SizedBox(
                        height: Get.width * 0.47,
                        child: recentlyproductslist(),
                      );
                    } else {
                      return Center(child: Text('20'.tr),);
                    }
                  }else{
                    return Center(child: CircularProgressIndicator(),);
                  }
                }),
                spaceH(Get.height * 0.02),
              ],
            ))

          ],
        ),
      )
    );
  }
   recentlyproductslist() {
     return ListView.builder(
       scrollDirection: Axis.horizontal,
       itemCount: (controller.productsList.length > 4 )?  4 : controller.productsList.length,
       itemBuilder: (BuildContext context, int index) {
         final product = controller.productsList[index];
         return BestProductItem(
           product.image,
           product.title,
           product.price,
           product.id
         );
       },
     );
   }
   BestProductItem(String url , String title , int price , int id ){
     return GestureDetector(
       onTap: (){
         Get.toNamed('product' , arguments:[{"id": id}],);
       },
       child: Container(

         margin: EdgeInsets.all(Get.width * 0.02),
         width: Get.height * 0.15,
         decoration: BoxDecoration(
           color: AppColors.aqssubgreen,
             border: Border.all(color: Colors.black12),
             borderRadius: BorderRadius.all(Radius.circular(15))
         ),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: <Widget>[
             Container(
               color: Colors.white,
               margin: EdgeInsets.all(3),
               child: Center(
                 child:  CachedNetworkImage(
                   height: Get.height * 0.1,
                   width: Get.height * 0.5,
                   imageUrl: url,
                   imageBuilder: (context, imageProvider) => Container(
                     decoration: BoxDecoration(
                       color: Colors.white,
                       border: Border.all(color: Colors.black12),
                       borderRadius: BorderRadius.all(Radius.circular(10)),
                       image: DecorationImage(
                         image: imageProvider,
                         fit: BoxFit.contain,
                       ),
                     ),
                   ),
                   placeholder: (context, url) => CircularProgressIndicator(),
                   errorWidget: (context, url, error) => const Icon(Icons.error),
                 ),
               ),
             ),
             spaceH(Get.height * 0.01),
            Container(
              color: AppColors.aqssubgreen,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Center(
                    child:Text(title , textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: AppColors.aqsfullGreen,
                        fontSize: Get.width * 0.025,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  spaceH(Get.height * 0.004),
                  Container(
                    color: AppColors.aqsyallow,
                    height: Get.width * 0.004,
                    width: Get.width,
                  ),
                  spaceH(Get.height * 0.004),
                  Center(
                    child: Text(formatter.format(price).toString() + ' ' + '18'.tr , textAlign: TextAlign.start,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: Get.height * 0.0135,
                          fontWeight: FontWeight.w600,
                          color: AppColors.aqsfullGreen
                      ),
                    ),
                  ),
                  GestureDetector(
                    child: Container(
                      width: Get.width,
                      padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: AppColors.aqsyallow,
                            border: Border.all(color: Colors.black12),
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ),

                      child: Center(
                        child: Text(
                            '19'.tr,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: Get.width * 0.025
                          ),
                        ),
                      )
                    ),
                  ),
                ],
              ),
            )
           ],
         ),
       ),
     );
   }
   bestproductslabels() {
     return Padding(padding: EdgeInsetsDirectional.only(start: Get.height * 0.02 , end: Get.height * 0.02),
       child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
           Text("12".tr , style: TextStyle(
               fontSize: Get.height * 0.02,
               fontWeight: FontWeight.bold
           ),),
           GestureDetector(
             onTap: (){
               Get.toNamed('bestProducts');

             },
             child: Text("11".tr , style: TextStyle(
                 fontSize: Get.height * 0.016,
                 fontWeight: FontWeight.w600
             ),),
           )
         ],
       ),
     );
   }

   CategoryIcon(String url , String label  , int id){
    if(id > 0){
      return GestureDetector(
        onTap: (){
          Get.toNamed('/products' , arguments: [{'id':id}]);
        },
        child: Padding(padding: EdgeInsetsDirectional.only(start: Get.height * 0.01,end: Get.height * 0.01),
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(Get.height * 0.005),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(45))
                ),
                height: Get.height * 0.07,
                width: Get.height * 0.08,
                child: CachedNetworkImage(
                  imageUrl: url,
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              spaceH(Get.height * 0.01),
              Text(label),
            ],
          ),
        ),
      );
    }else{
      return GestureDetector(
        onTap: (){
          Get.to(()=> Categories_home());
        },
        child: Padding(padding: EdgeInsetsDirectional.only(start: Get.height * 0.01,end: Get.height * 0.01),
          child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(45))
                ),
                height: Get.height * 0.07,
                width: Get.height * 0.08,
                child: CachedNetworkImage(
                  imageUrl: url,
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              spaceH(Get.height * 0.01),
              Text(label),
            ],
          ),
        ),
      );
    }
   }
  categories(){
    return GridView.builder(
      padding: EdgeInsets.only(left: Get.height * 0.01,right: Get.height * 0.01),
      physics: const PageScrollPhysics(), // to disable GridView's scrolling
      shrinkWrap: true, // You won't see infinite size error
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 5.0,
        mainAxisSpacing: 5.0,
        childAspectRatio: 1,
      ),
      itemCount: (controller.categoriesList.length > 8 )?  8 : controller.categoriesList.length, // or slidersList.length, depends on your requirement
      itemBuilder: (context, index) {
        var cat = controller.categoriesList[index];
        return CategoryIcon(cat.image,cat.title , cat.id);
      },
    );
  }
  categorieslabels() {
    return Padding(padding: EdgeInsetsDirectional.only(start: Get.height * 0.02 , end: Get.height * 0.02 , top: Get.width * 0.02),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("153".tr , style: TextStyle(
          fontSize: Get.height * 0.015,
          color: AppColors.cbcGreen,
          fontWeight: FontWeight.bold
        ),),

      ],
    ),
    );
  }
  sliders() {
    return SizedBox(
      height: Get.width * 0.58,
      child: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                controller.changeindex(index);
              },
            ),
            items: controller.slidersList
                .map((item) => Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20) , bottomRight: Radius.circular(20)),
                  border: Border.all(color: Colors.white60)
              ),
              child: Center(
                  child:
                  ClipRRect(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20) , bottomRight: Radius.circular(20)),
                    child: CachedNetworkImage(
                      imageUrl: item.image,
                      imageBuilder: (context, imageProvider) => Container(

                        height: Get.width * 0.57,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20) , bottomRight: Radius.circular(20)),
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      placeholder: (context, url) => Center(child: CircularProgressIndicator(),),
                      errorWidget: (context, url, error) => const Icon(Icons.error),
                    ),
                  )
              ),
            ))
                .toList(),
          ),
        ],
      ),
    );
  }
  placholderSlider(){
    return Container(
      height: Get.height * 0.3,
      width: Get.width * 0.97,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.white60)
      ),
      margin: EdgeInsets.all(Get.height * 0.004),
      child: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: CircularProgressIndicator(),
          )
      ),
    );
  }
   placholder404(){
     return Container(
       height: Get.height * 0.3,
       width: Get.width * 0.97,
       decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(30),
           border: Border.all(color: Colors.white60)
       ),
       margin: EdgeInsets.all(Get.height * 0.004),
       child: Center(
           child: ClipRRect(
             borderRadius: BorderRadius.circular(10.0),
             child: Image.asset('assets/images/comingsoon.jpg' , fit: BoxFit.fill,),
           )
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
    child: const Icon(Icons.search),
    );
  }
  Padding searchTextInput() {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        start: Get.height * 0.02,
        end: Get.height * 0.02,
      ),
      child: SizedBox(
        width: Get.width * 0.9,
        height: Get.height * 0.05,
        child: TextField(
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            hintText: '152'.tr,
            hintStyle: TextStyle(
              fontSize: Get.height * 0.015,
            ),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(
                color: AppColors.aqsatColor,
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(10) , bottomLeft: Radius.circular(10)),
              borderSide: BorderSide(color: AppColors.aqsatColor,),
            ),
            prefixIcon: Icon(Icons.search, color: Colors.grey, size: Get.height * 0.03)
          ),
        ),
      ),
    );
  }
}

