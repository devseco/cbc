import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_ecommerce/CBC/models/CardAbout.dart';

import '../Services/RemoteServices.dart';

class CardController extends GetxController with SingleGetTickerProviderMixin{
  TabController? tabController;
  var isLoadingAbout= true.obs;
  CardAbout? cardAbout;
  void fetchCardAbout() async{
    isLoadingAbout(true);
    try {
      var list = await RemoteServices.fetchCardAbout();
      if(list != null){
        cardAbout = list;
      }else{
        isLoadingAbout(false);
      }
    }finally{
      isLoadingAbout(false);
    }
    isLoadingAbout(false);
    update();
  }
  @override
  void onInit() {
    tabController = TabController(length: 3, vsync: this);
    fetchCardAbout();
    // TODO: implement onInit
    super.onInit();
  }
}