import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ui_ecommerce/CBC/controllers/CardController.dart';
import '../../res/colors.dart';
class CardView extends StatelessWidget {
   CardView({super.key});
   final CardController controller = Get.put(CardController());
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TabsPages(),
            PagesTabs(),
          ],
        ),
      ),
    );
  }
   TabsPages(){
     return Padding(padding: EdgeInsetsDirectional.only(top: Get.width * 0.04 , start: Get.width * 0.05 , end: Get.width * 0.05),
       child: TabBar(
         indicatorColor: Colors.white,
         indicatorSize: TabBarIndicatorSize.tab,
         isScrollable: false,
         labelColor: Colors.white,
         unselectedLabelColor: Colors.black,
         indicator: BoxDecoration(
           borderRadius: BorderRadius.circular(5),
           color: AppColors.cbcColor,
         ),
         indicatorWeight: 0.0, // تعيين الوزن إلى 0.0 لإزالة الخط
         labelStyle: const TextStyle(
             fontSize: 12.0,
             fontWeight: FontWeight.bold,
             color: Colors.white,
             fontFamily: 'Tajawal'
         ),
         unselectedLabelStyle: const TextStyle(
             fontSize: 12.0,
             fontWeight: FontWeight.bold,
             color: Colors.black,
             fontFamily: 'Tajawal'
         ),
         controller: controller.tabController,
         tabs: [
           Tab(text: '106'.tr),
           Tab(text: '107'.tr),
           Tab(text: '108'.tr),
         ],
       ),
     );
   }
   PagesTabs(){
     return Expanded(
       child: GetBuilder<CardController>(builder: (builder){
         return TabBarView(
           controller: controller.tabController,
           children: [
             aboutCard(),
             aboutCard(),
             aboutCard(),
           ],
         );
       },),
     );
   }
   aboutCard(){
     if(controller.cardAbout!.about.isNotEmpty){
       return  Padding(padding: EdgeInsetsDirectional.only(start: Get.width * 0.05 , end: Get.width * 0.05 , top: Get.width * 0.05),
        child: ListView(
          shrinkWrap: true,
     physics: PageScrollPhysics(),
     children: [
     Text(controller.cardAbout!.about[0].title,
     style: TextStyle(
       color: Colors.black,
       fontWeight: FontWeight.bold,
       fontSize: Get.width * 0.035

         ),
     ),
       Text(controller.cardAbout!.about[0].des,
         style: TextStyle(
           color: Colors.black,
           fontWeight: FontWeight.bold,
             fontSize: Get.width * 0.025
         ),
       ),
       SizedBox(
         height: Get.width * 0.10,
       ),
       Text('109'.tr,
         style: TextStyle(
             color: AppColors.cbcRed,
             fontWeight: FontWeight.bold,
             fontSize: Get.width * 0.035
         ),
       ),
       SizedBox(
         height: Get.width * 0.03,
       ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15))
                ),
                height: Get.height * 0.10,
                width: Get.height * 0.15,
                child: CachedNetworkImage(
                  imageUrl: controller.cardAbout!.about[0].imageBack,
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  placeholder: (context, url) => const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              SizedBox(
                height: Get.width * 0.03,
              ),
              Text('تصميم 2024',
                style: TextStyle(
                    color: AppColors.cbcColor,
                    fontWeight: FontWeight.bold,
                    fontSize: Get.width * 0.025
                ),
              ),
            ],
          ),
          Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15))
                ),
                height: Get.height * 0.10,
                width: Get.height * 0.15,
                child: CachedNetworkImage(
                  imageUrl: controller.cardAbout!.about[0].imageFront,
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  placeholder: (context, url) => const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              SizedBox(
                height: Get.width * 0.03,
              ),
              Text('تصميم 2023',
                style: TextStyle(
                    color: AppColors.cbcColor,
                    fontWeight: FontWeight.bold,
                    fontSize: Get.width * 0.025
                ),
              ),
            ],
          )
        ],
      ),
       SizedBox(
         height: Get.width * 0.1,
       ),
       Text('110'.tr,
         style: TextStyle(
             color: AppColors.cbcRed,
             fontWeight: FontWeight.bold,
             fontSize: Get.width * 0.04
         ),
       ),
       SizedBox(
         height: Get.width * 0.35,
         child: ListView.builder(
           shrinkWrap: false,
           physics: NeverScrollableScrollPhysics(),
           padding: EdgeInsetsDirectional.only(start: Get.width * 0.02,end: Get.width * 0.02),
           itemCount: controller.cardAbout!.features.length, // عدد العناصر في القائمة
           itemBuilder: (BuildContext context, int index) {
             return  Padding(padding: EdgeInsets.only(top: Get.width * 0.008),
             child: Row(
               children: [
                 Container(
                   width: Get.height * 0.002,
                   height: Get.height * 0.01,
                   color: AppColors.cbcRed,
                 ),
                 SizedBox(
                   width: Get.height * 0.01,
                 ),
                 Text(controller.cardAbout!.features[0].title , style: TextStyle(
                     fontSize: Get.height * 0.0115,
                     fontWeight: FontWeight.bold
                 ),)
               ],
             ),

             );
           },
         ),
       ),
       Text('111'.tr,
         style: TextStyle(
             color: AppColors.cbcRed,
             fontWeight: FontWeight.bold,
             fontSize: Get.width * 0.04
         ),
       ),

       SizedBox(
         height: Get.width * 0.35,
         child: ListView.builder(
           shrinkWrap: false,
           physics: NeverScrollableScrollPhysics(),
           padding: EdgeInsetsDirectional.only(start: Get.width * 0.02,end: Get.width * 0.02),
           itemCount: controller.cardAbout!.doing.length, // عدد العناصر في القائمة
           itemBuilder: (BuildContext context, int index) {
             return  Padding(padding: EdgeInsets.only(top: Get.width * 0.008),
               child: Row(
                 children: [
                   Container(
                     width: Get.height * 0.002,
                     height: Get.height * 0.01,
                     color: AppColors.cbcRed,
                   ),
                   SizedBox(
                     width: Get.height * 0.01,
                   ),
                   Text(controller.cardAbout!.doing[0].title , style: TextStyle(
                       fontSize: Get.height * 0.0115,
                       fontWeight: FontWeight.bold
                   ),)
                 ],
               ),

             );
           },
         ),
       )




     ]),


       );
     }else{
       return Center(child: Row(
         mainAxisAlignment: MainAxisAlignment.center,
         crossAxisAlignment: CrossAxisAlignment.center,
         children: [
           Text('102'.tr),
           SizedBox(width: Get.width * 0.02,),
           FaIcon(FontAwesomeIcons.faceSadTear)
         ],
       ),);
     }
   }
}
