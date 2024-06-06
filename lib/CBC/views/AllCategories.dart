import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:ui_ecommerce/CBC/controllers/AllCategoriesController.dart';
import 'package:ui_ecommerce/CBC/views/StorePage.dart';
import '../../res/colors.dart';
class AllCategories extends StatelessWidget {
  AllCategories({super.key});
  final AllCategoriesController controller = Get.put(AllCategoriesController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: Get.height,
          width: Get.width,
          margin: EdgeInsets.only(bottom: Get.height * 0.02),
          color: Colors.white,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: Get.width * 0.05 , bottom: Get.width *  0.02),
                height: Get.width * 0.1, // Set the height as desired
                child: filterList(),
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.only(left: Get.width * 0.05 , right: Get.width * 0.05 ),
                  height: Get.width * 0.13,
                  width: Get.width ,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Center(
                        child: Text('94'.tr ,
                          style: TextStyle(
                              color: AppColors.cbcColor,
                              fontSize: Get.width * 0.05,
                              fontWeight: FontWeight.bold
                          ),),
                      ),
                      GetBuilder<AllCategoriesController>(builder: (builder){
                        return  DropdownButtonHideUnderline(

                          child: DropdownButton2<String>(
                            iconStyleData: IconStyleData(
                                icon: Icon(Icons.filter_alt_rounded)
                            ),

                            isExpanded: true,
                            hint: Center(
                              child: Text(
                                '76'.tr,
                                style: TextStyle(
                                  fontSize: Get.width * 0.03,
                                  color: Theme.of(context).hintColor,
                                ),
                              ),
                            ),
                            items: builder.items
                                .map((String item) => DropdownMenuItem<String>(
                              value: item,
                              child: Center(
                                child: Text(
                                  item,
                                  style:  TextStyle(
                                      fontSize: Get.width * 0.03,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ))
                                .toList(),
                            value: builder.selectedValue,
                            onChanged: (String? value) {
                              builder.changeFilter(value);
                            },
                            buttonStyleData:  ButtonStyleData(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              height: Get.width * 0.3,
                              width: Get.width * 0.25,
                            ),
                            menuItemStyleData:  MenuItemStyleData(
                              height: Get.width * 0.08,

                            ),
                          ),
                        );
                      }

                      )
                    ],
                  ),
                ),
              ),

              Obx(() {
                if(!controller.isFilter.value){
                  return  Expanded(child: stories());
                }else{
                  if(controller.isLoadingFilter.value){
                    return  Center(child: SpinKitWave(
                      color: AppColors.cbcColor,
                      size: Get.width * 0.1,
                    ),);
                  }else{
                    return  Expanded(child: stories());
                  }
                }
              }),

            ],
          )
      )





    );
  }
  Widget filterList() {
    return ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      scrollDirection: Axis.horizontal,
      children: controller.citiesList
          .asMap()
          .entries
          .map(
            (entry) {
          int index = entry.value.id;
          String filter = entry.value.title;
          return FilterBox(filter, index);
        },
      )
          .toList(),
    );
  }
  Widget FilterBox(String filter , int index) {
    //final controller = Get.find<Billing_controller>();
    return GestureDetector(
      onTap: () {
        controller.filterBillsByStatus(index);
        controller.selectedFilter.value = filter;
      },
      child: Obx(() => Container(
        width: Get.width * 0.25,
        padding: const EdgeInsets.all(5),
        margin: EdgeInsets.only(left: Get.width * 0.02, right: Get.width * 0.02),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
          color: controller.selectedFilter.value == filter ? AppColors.cbcColor: Colors.transparent,
        ),
        child: Center(
          child: Text(
            filter,
            style: TextStyle(
              color: controller.selectedFilter.value == filter ? Colors.white : Colors.black,
            ),
          ),
        ),
      )),
    );
  }

  stories(){
    return GridView.builder(
      padding: EdgeInsets.only(left: Get.height * 0.01, right: Get.height * 0.01, top: Get.height * 0.01 ),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20.0,
        mainAxisSpacing: 5.0,
        childAspectRatio: 1.3,
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
          Get.to(()=>StorePage() , arguments: [{"id" : id}]);
        },
        child: Container(
          margin: const EdgeInsets.all(8),
          padding: EdgeInsets.all(Get.height * 0.01),
          width: Get.height * 0.25,
          decoration: BoxDecoration(
              color: (active == 0) ? AppColors.cbcColor : Colors.white,
              border: Border.all(color: Colors.black12),
              borderRadius: const BorderRadius.all(Radius.circular(15))
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              (active == 1) ? Center(
                child:  CachedNetworkImage(
                  height: Get.height * 0.07,
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
                  placeholder: (context, url) => const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),

              ) : const SizedBox(),
              SizedBox(height: Get.height * 0.01,),
              Center(
                child: Text(title , textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: Get.width * 0.025,
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
                      fontSize: Get.width * 0.025,
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
      return const SizedBox.shrink(); // إذا كان الـ ID يساوي -1، لا تعرض أي شيء باستخدام SizedBox.shrink()
    }
  }


}
