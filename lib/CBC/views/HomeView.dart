import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:textfield_search/textfield_search.dart';
import 'package:ui_ecommerce/CBC/views/Messages.dart';
import 'package:ui_ecommerce/res/colors.dart';
import '../controllers/Home_controller.dart';
import '../models/TestItem.dart';
import 'package:badges/badges.dart' as badges;
import 'StorePage.dart';
class HomeView extends StatelessWidget {
   HomeView({super.key});
  final Chome_controller  controller = Get.put(Chome_controller());
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      child: content(),
      onRefresh: () async {
        controller.fetchCountMessages();
         controller.fetchRecently();
         controller.fetchHighest();
         controller.fetchCities();
         controller.fetchSliders();

      },
    );
  }
  Container content(){
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              searchTextInput(),
   Obx(() => GestureDetector(
     onTap: (){
       Get.to(()=> MessagesView());
     },
     child: Padding(padding: EdgeInsetsDirectional.only(start: Get.height * 0.009 , end: Get.height * 0.009,top: Get.height * 0.015, ),
       child: badges.Badge(
         position: badges.BadgePosition.bottomEnd(bottom: 4, end: 15),
         badgeAnimation: badges.BadgeAnimation.slide(),
         showBadge: controller.showCartBadge.value, // Assuming your controller is named 'controller'
         badgeStyle: badges.BadgeStyle(
           badgeColor: Colors.redAccent,
         ),
         badgeContent: Text(
           controller.backgroundMessagesLength.value.toString(), // Assuming your controller is named 'controller'
           style: TextStyle(color: Colors.white),
         ),
         child: Icon(Icons.notifications_outlined, color: AppColors.cbcColor, size: Get.height * 0.035,),
       )
     ),
   )),
            ],
          ),
          SizedBox(
            height: Get.height * 0.02,
          ),

          Obx(() {
            if(!controller.isLoadingSliders.value){
              return (controller.slidersList.length > 0)? sliders() : placholder404();
            }else{
              return placholderSlider();
            }
          }),
          Expanded(child: ListView(
            children: [

             GetBuilder<Chome_controller>(builder: (builder){
               if(!builder.isLoadingCities.value){
                 if(builder.citiesList.isNotEmpty){
                   return citys();
                 }else{
                   return Center(
                     child: Text(
                         '${'20'.tr}'
                     ),
                   );
                 }
               }else{
                 return Center(child: SpinKitWave(
                   color: AppColors.cbcColor,
                   size: Get.width * 0.1,
                 ),);
               }
            }),

              SizedBox(
                height: Get.height * 0.02,
              ),
              DiscountLabel('89'.tr , 'recentlyStories'),
              SizedBox(
                height: Get.height * 0.02,
              ),
              GetBuilder<Chome_controller>(builder: (builder){
                if(!builder.isLoadingRecently.value){
                  if(builder.highestList.isNotEmpty){
                    return discountItems(builder.recentlyList);
                  }else{
                    return Center(
                      child: Text(
                          '${'20'.tr}'
                      ),
                    );
                  }
                }else{
                  return Center(child: SpinKitWave(
                    color: AppColors.cbcColor,
                    size: Get.width * 0.1,
                  ),);
                }

              }),
              SizedBox(
                height: Get.height * 0.02,
              ),
              DiscountLabel('91'.tr , 'HighestStories'),
              SizedBox(
                height: Get.height * 0.02,
              ),
              GetBuilder<Chome_controller>(builder: (builder){
                if(!builder.isLoadingHighest.value){
                  if(builder.highestList.isNotEmpty){
                    return discountItems(builder.highestList);
                  }else{
                    return Center(
                      child: Text(
                          '${'20'.tr}'
                      ),
                    );
                  }
                }else{
                  return Center(child: SpinKitWave(
                    color: AppColors.cbcColor,
                    size: Get.width * 0.1,
                  ),);
                }
              }),
            ],
          )),


        ],
      ),
    );
  }
  placholder404(){
    return Container(
      height: Get.height * 0.3,
      width: Get.width * 0.97,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.white60)
      ),
      margin: EdgeInsets.all(Get.height * 0.004),
      child: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.asset('assets/images/comingsoon.jpg' , fit: BoxFit.fill,),
          )
      ),
    );
  }
  placholderSlider(){
    return Container(
      height: Get.height * 0.3,
      width: Get.width * 0.97,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.white60)
      ),
      margin: EdgeInsets.all(Get.height * 0.004),
      child: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: const CircularProgressIndicator(),
          )
      ),
    );
  }
  discountItems(list) {
    return SizedBox(
      height: Get.height * 0.15,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: (list.length > 6) ? 6 : list.length,
        itemBuilder: (context, index) {
          var Item = list[index];
          return DiscountItem(Item.image, Item.store, Item.storeId , Item.discount);
        },
      ),
    );
  }
  DiscountItem(String url , String label  , int id , int discount) {
    return GestureDetector(
      onTap: (){
        Get.to(()=>StorePage() , arguments: [{"id" : id}]);
        //Get.toNamed('/products' , arguments: [{'id':id}]);
      },
      child: Padding(padding: EdgeInsetsDirectional.only(start: Get.height * 0.01,end: Get.height * 0.01),
        child: Column(
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15))
              ),
              height: Get.height * 0.08,
              width: Get.height * 0.08,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(45.0),
                child: CachedNetworkImage(
                  imageUrl: url,
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
            ),
            SizedBox(height: Get.height * 0.003,),
            SizedBox(
              width: Get.width * 0.24,
              child: Text(label,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: Get.height * 0.011
                  )),),
            SizedBox(height: Get.height * 0.003,),
            Row(
              children: [
                const Text('الخصم ' ,  overflow: TextOverflow.ellipsis,),
                Text('${discount}%',  overflow: TextOverflow.ellipsis,style: TextStyle(
                    color: AppColors.cbcRed,
                    fontWeight: FontWeight.bold,
                    fontSize: Get.height * 0.018
                ),),
              ],
            )
          ],
        ),
      ),
    );
  }
  DiscountLabel(title , page) {
    return Padding(padding: EdgeInsetsDirectional.only(start: Get.height * 0.02 , end: Get.height * 0.02),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: Get.height * 0.005,
                height: Get.height * 0.02,
                color: AppColors.cbcRed,
              ),
              SizedBox(
                width: Get.height * 0.01,
              ),
              Text(title , style: TextStyle(
                  fontSize: Get.height * 0.02,
                  fontWeight: FontWeight.bold
              ),)
            ],
          ),
          GestureDetector(
            onTap: (){
              Get.toNamed('${page}');

            },
            child: Row(
              children: [
                Text("90".tr , style: TextStyle(
                    fontSize: Get.height * 0.016,
                    fontWeight: FontWeight.w600
                ),),
                SizedBox(width: Get.height * 0.007,),
                const Icon(Icons.arrow_circle_left_outlined , color: AppColors.cbcRed,),
              ],
            ),
          )
        ],
      ),
    );
  }



  Padding searchTextInput() {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        start: Get.height * 0.02,
        end: Get.height * 0.002,
        top: Get.height * 0.015,
      ),
      child: SizedBox(
        width: Get.width * 0.8,
        height: Get.height * 0.05,
        child: GetBuilder<Chome_controller>(builder: (c) {
          return TextFieldSearch(
            label: 'My Label',
            controller: controller.myController,
            future: () {
              return controller.fetchData();
            },
            getSelectedValue: (value) {
              if(value != null){
                TestItem selectedItem = value as TestItem; // تأكد من أن القيمة هي من نوع TestItem
                Get.to(()=>StorePage() , arguments: [{"id" : selectedItem.value}]);
                controller.myController.clear();
              }
            },
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              hintText: '88'.tr,
              hintStyle: TextStyle(
                fontSize: Get.height * 0.015,
              ),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10) , bottomLeft: Radius.circular(10)),
                borderSide: BorderSide(
                  color: AppColors.cbcColor,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10) , bottomLeft: Radius.circular(10)),
                borderSide: BorderSide(color: AppColors.cbcColor,),
              ),
              suffixIcon: Container(
                decoration: const BoxDecoration(
                  color: AppColors.cbcColor,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10) , bottomLeft: Radius.circular(10)),
                ),


                child: Icon(Icons.search, color: Colors.white, size: Get.height * 0.03),
              ),
            ),
          );




        },),
      ),
    );
  }

  sliders() {
    return Padding(padding: EdgeInsetsDirectional.only(top: Get.height * 0.002 , end: Get.height * 0.001 ),
      child: SizedBox(
        height:  Get.height * 0.22,
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                autoPlay: true
                ,viewportFraction: 1,
                height: Get.height * 0.18,
                onPageChanged: (index, reason) {
                  controller.changeindex(index);
                },
              ),
              items: controller.slidersList
                  .map((item) => Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.white60)
                  ),
                  margin: EdgeInsets.all(Get.height * 0.002),
                  padding: EdgeInsetsDirectional.only(start: Get.height * 0.004,end: Get.height * 0.004,top: Get.height * 0.004,bottom: Get.height * 0.004),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: CachedNetworkImage(
                      imageUrl: item.image,
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      placeholder: (context, url) => const Center(child: CircularProgressIndicator(),),
                      errorWidget: (context, url, error) => const Icon(Icons.error),
                    ),
                  )
              ))
                  .toList(),
            ),
            GetBuilder<Chome_controller>(builder: (c){
              return DotsIndicator(
                dotsCount: controller.slidersList.length,
                position: c.index,
                decorator: DotsDecorator(
                  color: Colors.grey,
                  size: const Size.square(9.0),
                  activeSize:  Size(Get.height * 0.008, Get.height * 0.009,),
                  activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
  citys(){
    return GridView.builder(
      padding: EdgeInsets.only(left: Get.height * 0.04,right: Get.height * 0.04),
      physics: const NeverScrollableScrollPhysics(), // to disable GridView's scrolling
      shrinkWrap: true, // You won't see infinite size error
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 20.0,
        mainAxisSpacing: 5.0,
        childAspectRatio: 1.1,

      ),
      itemCount: (controller.citiesList.length > 8 )?  8 : controller.citiesList.length,
      itemBuilder: (BuildContext context, int index) {
        final city = controller.citiesList[index];
        return CityItem(
          city.image,
          city.title,
          city.id,
        );
      },
    );
  }
  CityItem(String url , String title , int id){
    if(id != -1){
      return  GestureDetector(
        onTap: (){
          Get.toNamed('categories_cbc' , arguments: [{'id': id , 'city' : title}]);
        },
        child: Container(
          padding: EdgeInsets.all(Get.height * 0.01),
          width: Get.height * 0.25,
          decoration: BoxDecoration(
              color: AppColors.cbcColor,
              border: Border.all(color: Colors.black12),
              borderRadius: const BorderRadius.all(Radius.circular(15))
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child:  CachedNetworkImage(
                  height: Get.height * 0.05,
                  imageUrl: url,
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
              SizedBox(height: Get.height * 0.005,),
              Center(
                child: Text(title , textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style:  TextStyle(
                    fontSize: Get.width * 0.025,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),
                ),
              )
            ],
          ),
        ),
      );
    }else {
      return  GestureDetector(
        onTap: (){
           controller.onItemTapped(1);
        },
        child: Container(
          padding: EdgeInsets.all(Get.height * 0.01),
          width: Get.height * 0.25,
          decoration: BoxDecoration(
              color: AppColors.cbcRed,
              border: Border.all(color: Colors.black12),
              borderRadius: const BorderRadius.all(Radius.circular(15))
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child:  CachedNetworkImage(
                  height: Get.height * 0.045,
                  width: Get.height * 0.055,
                  imageUrl: url,
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  placeholder: (context, url) => const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              SizedBox(height: Get.height * 0.005,),
              Center(
                child: Text(title , textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style:  TextStyle(
                      fontSize: Get.width * 0.025,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),
                ),
              )
            ],
          ),
        ),
      );
    }
  }

}
