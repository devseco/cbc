import 'package:get/get.dart';
import 'package:ui_ecommerce/CBC/models/Store.dart';

import '../Services/RemoteServices.dart';

class StoreController extends GetxController {
  var isLoadingStories= true.obs;
  int id = 0;
  int cate = 0;
  int city = 0;
  String? city_name;
  String? cate_name;
  dynamic argumentData = Get.arguments;
  var storiesList = <Store>[].obs;
  void fetchStories() async{
    isLoadingStories(true);
    try {
      var list = await RemoteServices.fetchStories(cate,city);
      if(list != null){
        storiesList.value = list;
      }else{
        isLoadingStories(false);
      }
    }finally{
      isLoadingStories(false);
    }
    isLoadingStories(false);
    update();
  }

@override
  void onInit() {
    id = argumentData[0]['id'];
    city = argumentData[0]['city'];
    cate = argumentData[0]['cate'];
    cate_name = argumentData[0]['cate_name'];
    city_name = argumentData[0]['city_name'];
    fetchStories();
    // TODO: implement onInit
    super.onInit();
  }



}