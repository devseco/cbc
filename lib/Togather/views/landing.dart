import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_ecommerce/CBC/views/Landing.dart';
import 'package:ui_ecommerce/res/colors.dart';
class Landing_togather extends StatelessWidget {
  const Landing_togather({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
        length: 2, // Define the number of tabs
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(Get.width * 0.19), // Set preferred size for the app bar
            child: AppBar(
              flexibleSpace: TabBar(
                onTap: (index) {
                  // Handle tap on tabs
                  print('Tab $index tapped!');
                },
                tabs: [
                  Tab(
                    height: Get.height * 0.9,
                    child: Container(
                      color: AppColors.cbcColor,
                      padding: EdgeInsetsDirectional.only(start: Get.height * 0.02,top: Get.height * 0.06),
                      alignment: Alignment.bottomCenter,
                      child: Center(
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/logo_cbc.png',
                              width: Get.height * 0.06,
                              height: Get.height * 0.06,
                              fit: BoxFit.contain,
                            ),
                            SizedBox(
                              width: Get.height * 0.015,
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Text(
                                '0'.tr,
                                style: TextStyle(
                                  fontSize: Get.width * 0.035,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        ),
                      ), // Add text to your tab
                    ),
                  ),
                  Tab(
                    height: Get.height * 0.9,
                    child: Container(
                        padding: EdgeInsetsDirectional.only(start: Get.height * 0.02,top: Get.height * 0.06),
                        color: AppColors.aqsatColor,
                        alignment: Alignment.center,
                        child: Center(
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/images/logo_aqsat.png',
                                width: Get.height * 0.06,
                                height: Get.height * 0.06,
                                fit: BoxFit.contain,
                              ),
                              SizedBox(
                                width: Get.height * 0.015,
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 10),
                                child: Text(
                                  '80'.tr,
                                  style: TextStyle(
                                    fontSize: Get.width * 0.035,
                                    color: AppColors.cbcGreen,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                    ),
                  ),
                ],
                padding: EdgeInsets.zero,
                indicatorPadding: EdgeInsets.zero,
                labelPadding: EdgeInsets.zero,
                indicatorSize: TabBarIndicatorSize.tab, // Stretch the indicator to fit the tab
              ),
            ),
          ),
          body: TabBarView(
            children: [
              Landing_cbc(),
              Center(child: Text('Tab 2 Content')),
            ],
          ),
        ),
      );
  }
}
