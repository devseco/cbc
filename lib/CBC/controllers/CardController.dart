import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_ecommerce/CBC/models/CardAbout.dart';
import 'package:ui_ecommerce/CBC/models/CardSales.dart';
import 'package:ui_ecommerce/CBC/models/CardType.dart';
import '../Services/RemoteServices.dart';
class CardController extends GetxController with SingleGetTickerProviderMixin{
  TabController? tabController;
  var isLoadingAbout= true.obs;
  var isLoadingSale= true.obs;
  var isLoadingType= true.obs;
  CardAbout? cardAbout;
  CardType? cardType;
  CardSale? cardSale;
  //fetch Card about
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
  //fetch Card types
  void fetchCardType() async{
    isLoadingType(true);
    try {
      var list = await RemoteServices.fetchCardTypes();
      if(list != null){
        cardType = list;
      }else{
        isLoadingType(false);
      }
    }finally{
      isLoadingType(false);
    }
    isLoadingType(false);
    update();
  }
  void fetchCardSale() async{
    isLoadingSale(true);
    try {
      var list = await RemoteServices.fetchCardSales();
      if(list != null){
        cardSale = list;
      }else{
        isLoadingSale(false);
      }
    }finally{
      isLoadingSale(false);
    }
    isLoadingSale(false);
    update();
  }
  @override
  void onInit() {
    tabController = TabController(length: 3, vsync: this);
    fetchCardAbout();
    fetchCardType();
    fetchCardSale();
    // TODO: implement onInit
    super.onInit();
  }
}