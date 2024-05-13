import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_ecommerce/CBC/controllers/Home_controller.dart';
import 'package:ui_ecommerce/CBC/controllers/StoreController.dart';
import 'package:ui_ecommerce/CBC/views/StorePage.dart';
import '../../Togather/views/landing.dart';
import '../../res/colors.dart';
class Stories extends StatelessWidget {
   Stories({super.key});
  final StoreController controller = Get.put(StoreController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(padding: EdgeInsetsDirectional.only(end: 20),
            child:  GetBuilder<Chome_controller>(builder: (builder){
              return GestureDetector(
                onTap: (){
                  builder.onItemTapped(0);
                  Get.off(()=>Landing_togather());
                },
                child: Icon(Icons.home),
              );
            },),
          )
        ],
        iconTheme: IconThemeData(
          color: Colors.white
        ),
        backgroundColor: AppColors.cbcColor,
        centerTitle: true,
        title: Text('${controller.city_name} - ${controller.cate_name}' ,style: TextStyle(
            color: Colors.white,
            fontSize: Get.width * 0.04,
            fontWeight: FontWeight.bold
        ),),
      ),
      body: Container(
          height: Get.height,
          width: Get.width,
          margin: EdgeInsets.only(bottom: Get.height * 0.02),
          color: Colors.white,
          child: Column(
            children: [
              Center(
                child: Container(
                  height: Get.width * 0.13,
                  width: Get.width ,
                  child: Row(
                    children: [
                      //---------
                      Container(
                        child: Center(child: Text(
                          'الاحدث',
                          style: TextStyle(
                              color: AppColors.cbcColor,
                              fontWeight: FontWeight.bold,
                              fontSize: Get.width * 0.03
                          ),
                        ),),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueAccent),
                          color: Colors.white,
                        ),
                        padding: EdgeInsets.all(5),
                        margin: EdgeInsets.only(top: 20 , right: 20),
                        width: Get.width * 0.23,
                      ),
                      //---------
                      Container(
                        child: Center(child: Text(
                          'ترتيب',
                          style: TextStyle(
                              color: AppColors.cbcColor,
                              fontWeight: FontWeight.bold,
                              fontSize: Get.width * 0.035
                          ),
                        ),),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueAccent),
                          color: Colors.white,
                        ),
                        padding: EdgeInsets.all(5),
                        margin: EdgeInsets.only(top: 20 , right: 20),
                        width: Get.width * 0.23,
                      ),
                      // ----------
                      Container(
                        child: Center(child: Text(
                          'من  - الى',
                          style:  TextStyle(
                              color: AppColors.cbcColor,
                              fontWeight: FontWeight.bold,
                              fontSize: Get.width * 0.03
                          ),
                        ),),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueAccent),
                          color: Colors.white,
                        ),
                        padding: EdgeInsets.all(5),
                        margin: EdgeInsets.only(top: 20 , right: 20),
                        width: Get.width * 0.23,
                      ),
                      Container(
                        child: Center(child: Icon(Icons.tune , color: AppColors.cbcColor,),),

                        padding: EdgeInsets.all(5),
                        margin: EdgeInsets.only(top: 20 , right: 20),
                      ),
                    ],
                  ),
                ),
              ),
              GetBuilder<StoreController>(builder: (builder){
                if(!builder.isLoadingStories.value){
                  if(builder.storiesList.isNotEmpty){
                    return stories();
                  }else{
                    return Center(
                      child: Text(
                          '${'20'.tr}'
                      ),
                    );
                  }

                }else{
                  return Center(child: CircularProgressIndicator(),);
                }
              }
                ,)
            ],
          )
      ),
    );
  }
   stories(){
     return GridView.builder(
       padding: EdgeInsets.only(left: Get.height * 0.01, right: Get.height * 0.01, top: Get.height * 0.01 ),
       shrinkWrap: true,
       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
         crossAxisCount: 2,
         crossAxisSpacing: 5.0,
         mainAxisSpacing: 5.0,
         childAspectRatio: 0.8,
       ),
       itemCount: controller.storiesList.length,
       itemBuilder: (BuildContext context, int index) {
         final Item = controller.storiesList[index];
         return StoreItem(Item.logo, Item.name, Item.id, Item.active , Item.discountCount);
       },
     );
   }
   StoreItem(String url , String title , int id , int active , int count) {
     if (id != -1) { // تحقق من أن الـ ID ليس يساوي -1 قبل عرض المحافظة
       return GestureDetector(
         onTap: () {
           Get.to(()=>StorePage());


         },
         child: Container(
           margin: EdgeInsets.all(8),
           padding: EdgeInsets.all(Get.height * 0.01),
           width: Get.height * 0.25,
           decoration: BoxDecoration(
               color: (active == 0) ? AppColors.cbcColor : Colors.white,
               border: Border.all(color: Colors.black12),
               borderRadius: BorderRadius.all(Radius.circular(15))
           ),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             mainAxisAlignment: MainAxisAlignment.center,
             children: <Widget>[
               (active == 1) ? Center(
                 child:  CachedNetworkImage(
                   height: Get.height * 0.15,
                   width: Get.height * 0.2,
                   imageUrl: url,
                   imageBuilder: (context, imageProvider) => Container(
                     decoration: BoxDecoration(
                       shape: BoxShape.circle, // جعل الصورة دائرية
                       image: DecorationImage(
                         image: imageProvider,
                         fit: BoxFit.cover, // استخدام BoxFit.cover لتغطية الصورة بالكامل
                       ),
                     ),
                   ),
                   placeholder: (context, url) => CircularProgressIndicator(),
                   errorWidget: (context, url, error) => Icon(Icons.error),
                 ),

               ) : SizedBox(),
               SizedBox(height: Get.height * 0.01,),
               Center(
                 child: Text(title , textAlign: TextAlign.center,
                   overflow: TextOverflow.ellipsis,
                   style: TextStyle(
                       fontSize: Get.width * 0.04,
                       fontWeight: FontWeight.bold,
                       color: AppColors.cbcColor

                   ),
                 ),
               ),
               SizedBox(height: Get.height * 0.007,),
              Center(
                child:  Text('${'95'.tr} ${count}٪' , textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: Get.width * 0.04,
                      fontWeight: FontWeight.w800,
                      color: AppColors.cbcRed
                  ),
                ),
              )
             ],
           ),
         ),
       );
     } else {
       return SizedBox.shrink(); // إذا كان الـ ID يساوي -1، لا تعرض أي شيء باستخدام SizedBox.shrink()
     }
   }


}
