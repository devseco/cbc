import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_ecommerce/CBC/models/CallCenter.dart';

import '../Services/RemoteServices.dart';

class HelpController extends GetxController  with SingleGetTickerProviderMixin{
  TabController? tabController;
  var isLoadingCallCenter= true.obs;
  var callCenterList = <CallCenterModel>[].obs;
  void fetchCallCenter() async{
    isLoadingCallCenter(true);
    try {
      var list = await RemoteServices.fetchCallCenter();
      if(list != null){
        callCenterList.value = list;
      }else{
        isLoadingCallCenter(false);
      }
    }finally{
      isLoadingCallCenter(false);
    }
    isLoadingCallCenter(false);
    update();
  }

  @override
  void onInit() {
    tabController = TabController(length: 3, vsync: this);
    fetchCallCenter();
    // TODO: implement onInit
    super.onInit();
  }
}