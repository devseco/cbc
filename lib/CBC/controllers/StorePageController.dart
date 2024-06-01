import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_ecommerce/CBC/models/StoreModel.dart';

import '../Services/RemoteServices.dart';

class StorePageController extends GetxController with SingleGetTickerProviderMixin{
  StoreModel? store ;
  var isLoadingItem= true.obs;
  int indexSlider = 0;
   TabController? tabController;
   int id = 0;
  dynamic argumentData = Get.arguments;
  void fetchStore() async {
    try {
      var fetchedStore = await RemoteServices.fetchStore(id);
      if (fetchedStore != null) {
        store = fetchedStore;
        print('Branches : ${store!.storeinfo.logo}');
        isLoadingItem(false);
      } else {
        isLoadingItem(false);
        // يمكنك إضافة معالجة لحالة الفشل هنا إذا كنت بحاجة إليها
      }
    } finally {
      isLoadingItem(false);
      // أي شيء تحتاج إلى القيام به بغض النظر عن نجاح أو فشل الطلب يمكنك وضعه هنا
    }
    isLoadingItem(false);
    update();
  }
  @override
  void onInit() {
    tabController = TabController(length: 4, vsync: this);
    id = argumentData[0]['id'];
    fetchStore();
    // TODO: implement onInit
    super.onInit();
  }
}
