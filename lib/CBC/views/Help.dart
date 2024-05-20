import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_ecommerce/CBC/controllers/Help.dart';

import '../../res/colors.dart';
import 'CallCenterView.dart';
class Help extends StatelessWidget {
   Help({super.key});
   final HelpController controller = Get.put(HelpController());
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
           Tab(text: '131'.tr),
           Tab(text: '132'.tr),
           Tab(text: '133'.tr),
         ],
       ),
     );
   }
   PagesTabs(){
     return Expanded(
       child: GetBuilder<HelpController>(builder: (builder){
         return TabBarView(
           controller: controller.tabController,
           children: [
             CallCenterView(),
             CallCenterView(),
             CallCenterView(),

           ],
         );
       },),
     );
   }
}
