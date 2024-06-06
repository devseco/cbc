import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ui_ecommerce/main.dart';
import '../../res/colors.dart';
import '../controllers/CardController.dart';

class cardType extends StatelessWidget {
  cardType({super.key});
  final CardController controller = Get.put(CardController());

  @override
  Widget build(BuildContext context) {
    final cardType = controller.cardType;
    if (cardType == null || cardType.type.isEmpty) {
      return Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('20'.tr),
            SizedBox(width: Get.width * 0.02),
            FaIcon(FontAwesomeIcons.faceSadTear),
          ],
        ),
      );
    }
    return Padding(
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
          SizedBox(
            height: Get.width * 0.02,
          ),
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
          SizedBox(
            height: Get.width * 0.4,
            child: ListView.builder(
              shrinkWrap: true,
              physics: PageScrollPhysics(),
              padding: EdgeInsetsDirectional.only(
                start: Get.width * 0.02,
                end: Get.width * 0.02,
              ),
              itemCount: cardType.type.length,
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
                          cardType.type[index].type ?? 'No type',
                          style: TextStyle(
                            fontSize: Get.height * 0.0115,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          '${formatter.format(cardType.type[index].price)} دينار عراقي',
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
          ),
          Text(
            '113'.tr,
            style: TextStyle(
              color: AppColors.cbcRed,
              fontWeight: FontWeight.bold,
              fontSize: Get.width * 0.04,
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: PageScrollPhysics(),
            padding: EdgeInsetsDirectional.only(
              start: Get.width * 0.02,
              end: Get.width * 0.02,
            ),
            itemCount: cardType.offer?.length ?? 0,
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
                        cardType.offer?[index].title ?? 'No title',
                        style: TextStyle(
                          fontSize: Get.height * 0.0125,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Get.width * 0.01,
                    ),
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
                        '${formatter.format(cardType.offer?[index].price ?? 0)} دينار عراقي',
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
          ),
        ],
      ),
    );
  }
}
