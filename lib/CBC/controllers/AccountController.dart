import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_ecommerce/CBC/models/Account.dart';
import 'package:ui_ecommerce/main.dart';

import '../Services/RemoteServices.dart';

class AccountController extends GetxController with SingleGetTickerProviderMixin{
  TabController? tabController;
  late TextEditingController number = TextEditingController();
  String? dateCard = '';
  String? nameCard = '';
  int? numberCard;
  var isActive= false.obs;
  var isError = false.obs;
  var isFound = false.obs;
  var accountList = <AccountModel>[].obs;
  var isLoadingAccount= true.obs;
  void is_error(){
    isError(true);
    update();
  }
  void is_added(){
    isFound(true);
    isError(false);
    update();
  }
  void fetchAccount() async{
    isLoadingAccount(true);
    try {
      var list = await RemoteServices.fetchAccount(number.text.trim());
      if(list != null){
        is_added();
        accountList.value = list;
        sharedPreferences!.setString('nameAccount', accountList[0].nameEn);
        sharedPreferences!.setInt('numberAccount', accountList[0].number);
        sharedPreferences!.setString('dateAccount', accountList[0].date);
        sharedPreferences!.setBool('accountActive', true);
        dateCard = accountList[0].date;
        numberCard = accountList[0].number;
        nameCard = accountList[0].nameEn;
        isActive(true);
      }else{
        is_error();
        print('not found');
        isLoadingAccount(false);
      }
    }finally{
      isLoadingAccount(false);
    }
    isLoadingAccount(false);
    update();
  }
  void fetchRefresh() async{
    isLoadingAccount(true);
    sharedPreferences!.clear();
    fetchAccount();
    update();
  }
  @override
  void onInit() {
    tabController = TabController(length: 2, vsync: this);
    if(sharedPreferences!.getBool('accountActive') == true){
      isActive(true);
      number.text = sharedPreferences!.getInt('numberAccount').toString();
      update();
    }else{
      isActive(false);
      update();
    }
    // TODO: implement onInit
    super.onInit();
  }
}