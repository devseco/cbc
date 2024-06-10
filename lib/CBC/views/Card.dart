import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ui_ecommerce/CBC/controllers/CardController.dart';
import 'package:ui_ecommerce/CBC/views/CardAbout.dart';
import 'package:ui_ecommerce/CBC/views/CardSales.dart';
import 'package:ui_ecommerce/CBC/views/CardType.dart';
import '../../res/colors.dart';
class CardView extends StatelessWidget {
   CardView({super.key});
   final CardController controller = Get.put(CardController());
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        color: Colors.white,
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
         labelStyle:  TextStyle(
             fontSize: Get.width * 0.023,
             fontWeight: FontWeight.bold,
             color: Colors.white,
             fontFamily: 'Tajawal'
         ),
         unselectedLabelStyle:  TextStyle(
             fontSize: Get.width * 0.023,
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
             cardAbout(),
             CardType(),
             cardSales(),

           ],
         );
       },),
     );
   }
}
