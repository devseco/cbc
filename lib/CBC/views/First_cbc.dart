import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_ecommerce/CBC/controllers/Landing_controller.dart';

import '../../res/colors.dart';
class First_cbc extends StatelessWidget {
  const First_cbc({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Image.asset(
            'assets/images/panel_cbc.png',
            width: Get.height * 0.35,
            height: Get.height * 0.25,
            fit: BoxFit.contain,
          ),
          SizedBox(
            height: Get.height * 0.01,
          ),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: '81'.tr,
                  style: TextStyle(
                    fontSize: Get.height * 0.04,
                    color: AppColors.cbcColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: '82'.tr,
                  style: TextStyle(
                    fontSize: Get.height * 0.04,
                    color: AppColors.cbcRed, // تحديد اللون المختلف هنا
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: '83'.tr,
                  style: TextStyle(
                    fontSize: Get.height * 0.04,
                    color: AppColors.cbcColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: Get.height * 0.01,
          ),
          Container(
            margin: EdgeInsetsDirectional.only(end: Get.height * 0.12),
            alignment: Alignment.centerRight,
            padding: EdgeInsetsDirectional.only(start: Get.height * 0.06 , top: Get.height * 0.02 , bottom: Get.height * 0.02  ),
            decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.cbcColor,
                ),
                borderRadius: BorderRadius.horizontal(left: Radius.circular(20)),
                color: AppColors.cbcColor
            ),
            child: Text(
              '84'.tr,
              style: TextStyle(
                fontSize: Get.height * 0.015,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: Get.height * 0.06 , left:  Get.height * 0.13 , right:  Get.height * 0.13),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: Get.height * 0.04,
                    width: Get.height * 0.08,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.cbcColor,
                        ),
                        borderRadius: BorderRadius.all( Radius.circular(10)),
                        color: AppColors.cbcColor
                    ),
                    child: Center(
                      child: Text(
                        '85'.tr,
                        style: TextStyle(
                          fontSize: Get.height * 0.012,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: Get.height * 0.04,
                    width: Get.height * 0.08,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.cbcColor,
                        ),
                        borderRadius: BorderRadius.all( Radius.circular(10)),
                        color: AppColors.cbcColor
                    ),
                    child: Center(
                      child: Text(
                        '86'.tr,
                        style: TextStyle(
                          fontSize: Get.height * 0.012,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: Get.height * 0.06 , left:  Get.height * 0.15 , right:  Get.height * 0.15),
              child: GetBuilder<Clanding_controller>(builder: (c){
                return GestureDetector(
                  onTap: (){
                    c.onItemTapped(1);
                  },
                  child: Center(
                    child:  Container(
                      height: Get.height * 0.03,
                      width: Get.height ,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.cbcColor,
                          ),
                          borderRadius: BorderRadius.all( Radius.circular(10)),
                          color: AppColors.cbcColor
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.arrow_back_ios , color: Colors.white,size: Get.height * 0.018,),
                            Text(
                              '87'.tr,
                              style: TextStyle(
                                fontSize: Get.height * 0.012,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },)
          ),
          SizedBox(
            height: Get.height * 0.01,
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            alignment: Alignment.bottomCenter,
            child: Text(
              'الاصدار : 1.0.0',
              style: TextStyle(
                fontSize: Get.height * 0.012,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
          )



        ],
      ),
    );
  }
}
