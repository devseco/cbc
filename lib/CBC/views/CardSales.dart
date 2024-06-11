import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ui_ecommerce/CBC/controllers/StorePageController.dart';
import '../../res/colors.dart';
import '../controllers/CardController.dart';

class cardSales extends StatelessWidget {
  cardSales({super.key});
  final CardController controller = Get.put(CardController());

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsetsDirectional.only(
            start: Get.width * 0.05, end: Get.width * 0.05, top: Get.width * 0.05),
        child: RefreshIndicator(
          onRefresh: () async{
            controller.fetchCardSale();
          },
          child: ListView(
            shrinkWrap: true,
            physics: const AlwaysScrollableScrollPhysics(),
            children: [
              Text(
                '116'.tr,
                style: TextStyle(
                    color: AppColors.cbcColor,
                    fontWeight: FontWeight.bold,
                    fontSize: Get.width * 0.03),
              ),
              SizedBox(
                height: Get.width * 0.02,
              ),
              Text(
                '117'.tr,
                style: TextStyle(
                    color: AppColors.cbcRed,
                    fontWeight: FontWeight.bold,
                    fontSize: Get.width * 0.035),
              ),
              SizedBox(
                height: Get.width * 0.02,
              ),
              Obx(() {
                if (!controller.isLoadingSale.value) {
                  if (controller.cardSale != null) {
                    return  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          '118'.tr,
                          style: TextStyle(
                              color: AppColors.cbcColor,
                              fontWeight: FontWeight.bold,
                              fontSize: Get.width * 0.035),
                        ),
                        Text(
                          '${controller.cardSale!.systeminfo.phone}',
                          style: TextStyle(
                              color: AppColors.cbcGreen,
                              fontWeight: FontWeight.bold,
                              fontSize: Get.width * 0.035),
                        ),
                        GestureDetector(
                          onTap: () {
                            controller.callPhone(controller.cardSale!.systeminfo.phone);
                          },
                          child: FaIcon(
                            FontAwesomeIcons.whatsapp,
                            color: Colors.green,
                          ),
                        )
                      ],
                    );
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

              SizedBox(
                height: Get.width * 0.02,
              ),
              Text(
                '119'.tr,
                style: TextStyle(
                    color: AppColors.cbcRed,
                    fontWeight: FontWeight.bold,
                    fontSize: Get.width * 0.035),
              ),
              //sales
              Obx(() {
                if (!controller.isLoadingSale.value) {
                  if (controller.cardSale != null) {
                    return sales();
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
              SizedBox(
                height: Get.width * 0.06,
              )
            ],
          ),
        ),
      ),
    );
  }
  sales(){
    return SizedBox(
        child: ListView.builder(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          itemCount: controller.cardSale!.citiesWithSales.length, // عدد المحافظات
          itemBuilder: (BuildContext context, int index) {
            var city = controller.cardSale!.citiesWithSales[index];
            return Card(
              margin: EdgeInsets.all(8.0),
              child: ExpansionTile(
                title: Text(city.title, style: TextStyle(fontWeight: FontWeight.bold)),
                children: [
                  GridView.builder(
                    shrinkWrap: true, // هذا يجعل الGridView يأخذ المساحة اللازمة فقط
                    physics: const NeverScrollableScrollPhysics(), // يمنع التمرير داخل الGridView
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, // عدد العناصر في الصف الواحد
                      childAspectRatio: 0.8, // نسبة أبعاد العنصر
                      crossAxisSpacing: 10.0, // المسافة بين العناصر عبر الصفوف
                      mainAxisSpacing: 8.0, // المسافة بين العناصر عبر الأعمدة
                    ),
                    itemCount: city.salesInfo.length, // عدد المندوبين
                    itemBuilder: (BuildContext context, int salesIndex) {
                      var salesRep = city.salesInfo[salesIndex];
                      return Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: Get.width * 0.08, // حجم الصورة
                              child: ClipOval(
                                child: CachedNetworkImage(
                                  imageUrl: salesRep.image,
                                  imageBuilder: (context, imageProvider) => Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  placeholder: (context, url) =>
                                  const CircularProgressIndicator(),
                                  errorWidget: (context, url, error) => const Icon(Icons.error),
                                ),
                              ),
                            ),
                            SizedBox(height: 8.0), // المسافة بين الصورة والنص
                            Expanded(
                              // استخدام Expanded لجعل الContainer يمتد لكامل الارتفاع المتاح
                                child: GestureDetector(
                                  onTap: () {
                                    controller.callPhone(salesRep.phone);
                                  },
                                  child: Container(
                                    width: double.infinity, // جعل العرض يمتد لكامل العرض المتاح
                                    color: AppColors.cbcColor,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(salesRep.name,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                                fontSize: Get.width * 0.03)),
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(salesRep.phone,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                  fontSize: Get.width * 0.025,
                                                )),
                                            FaIcon(
                                              FontAwesomeIcons.phone,
                                              color: Colors.green,
                                              size: Get.width * 0.028,
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ))
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            );
          },
        ));
  }
}
