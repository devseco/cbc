import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../main.dart';
import '../../res/colors.dart';
import '../controllers/CardController.dart';
class CardType extends StatelessWidget {
  CardType({Key? key}) : super(key: key);
  final CardController controller = Get.put(CardController());
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsetsDirectional.only(
          start: Get.width * 0.05,
          end: Get.width * 0.05,
          top: Get.width * 0.05,
        ),
        child: ListView(
          shrinkWrap: true,
          physics: PageScrollPhysics(),
          children: [
            Text(
              '112'.tr,
              style: TextStyle(
                color: AppColors.cbcColor,
                fontWeight: FontWeight.bold,
                fontSize: Get.width * 0.035,
              ),
            ),
            SizedBox(height: Get.width * 0.02),
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    '114'.tr,
                    style: TextStyle(
                      color: AppColors.cbcRed,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '115'.tr,
                    style: TextStyle(
                      color: AppColors.cbcRed,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            Obx(() {
              if (!controller.isLoadingType.value) {
                if (controller.cardType != null) {
                  return types();
                } else {
                  return Center(
                    child: Text(
                      '${'20'.tr}',
                    ),
                  );
                }
              } else {
                return Center(
                  child: SpinKitWave(
                    color: AppColors.cbcColor,
                    size: Get.width * 0.1,
                  ),
                );
              }
            }),

            //types

            //

            Text(
              '113'.tr,
              style: TextStyle(
                color: AppColors.cbcRed,
                fontWeight: FontWeight.bold,
                fontSize: Get.width * 0.04,
              ),
            ),
            //offers
            Obx(() {
              if (!controller.isLoadingType.value) {
                if (controller.cardType != null) {
                  return offers();
                } else {
                  return Center(
                    child: Text(
                      '${'20'.tr}',
                    ),
                  );
                }
              } else {
                return Center(
                  child: SpinKitWave(
                    color: AppColors.cbcColor,
                    size: Get.width * 0.1,
                  ),
                );
              }
            }),

          ],
        ),
      ),
    );
  }
  offers(){
    return ListView.builder(
      shrinkWrap: true,
      physics: PageScrollPhysics(),
      padding: EdgeInsetsDirectional.only(
        start: Get.width * 0.02,
        end: Get.width * 0.02,
      ),
      itemCount: controller.cardType!.offer.length ?? 0,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.only(top: Get.width * 0.008),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(Get.width * 0.02),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppColors.cbcRed,
                ),
                width: Get.width * 0.9,
                height: Get.width * 0.15,
                child: Text(
                  controller.cardType!.offer[index].title ?? 'No title',
                  style: TextStyle(
                    fontSize: Get.height * 0.0125,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: Get.width * 0.01),
              Container(
                padding: EdgeInsetsDirectional.only(
                  end: Get.width * 0.05,
                  top: Get.width * 0.02,
                  bottom: Get.width * 0.02,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppColors.cbcColor,
                ),
                width: Get.width * 0.9,
                child: Text(
                  '${formatter.format(controller.cardType!.offer[index].price ?? 0)} دينار عراقي',
                  style: TextStyle(
                    fontSize: Get.height * 0.0125,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.end,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
  types(){
    return SizedBox(
      height: Get.width * 0.4,
      child: ListView.builder(
        shrinkWrap: true,
        physics: PageScrollPhysics(),
        padding: EdgeInsetsDirectional.only(
          start: Get.width * 0.02,
          end: Get.width * 0.02,
        ),
        itemCount: controller.cardType!.type.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.only(top: Get.width * 0.02),
            child: Container(
              padding: EdgeInsets.all(Get.width * 0.02),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: AppColors.cbcColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    controller.cardType!.type[index].type ?? 'No type',
                    style: TextStyle(
                      fontSize: Get.height * 0.0115,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '${formatter.format(controller.cardType!.type[index].price)} دينار عراقي',
                    style: TextStyle(
                      fontSize: Get.height * 0.0115,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
