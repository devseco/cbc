import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_ecommerce/CBC/models/CardAbout.dart';
import 'package:ui_ecommerce/CBC/models/CardSales.dart';
import 'package:ui_ecommerce/CBC/models/CardType.dart';
import 'package:url_launcher/url_launcher_string.dart';
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
        cardAbout = list;

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
        cardType = list;
        isLoadingType(false);
    }finally{
    }
    update();
  }
  void fetchCardSale() async{
    isLoadingSale(true);
    try {
      var list = await RemoteServices.fetchCardSales();
        cardSale = list;
    }finally{
      isLoadingSale(false);
    }
    isLoadingSale(false);
    update();
  }
  void callPhone(phone){
    launchUrlString("tel://${phone}");
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