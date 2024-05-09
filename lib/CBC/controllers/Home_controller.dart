import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_ecommerce/CBC/models/City.dart';
import 'package:ui_ecommerce/CBC/models/Discount.dart';
import '../../Installments/Services/RemoteServices.dart';
import '../../Installments/models/Product.dart';
import '../../Installments/models/Slider.dart';
import '../views/HomeView.dart';

class Chome_controller extends GetxController {
  final fixedItem = City(
    id: -1,
    title: 'المحافظات',
    image: 'https://static.vecteezy.com/system/resources/previews/019/633/209/original/doodle-freehand-drawing-of-iraq-map-free-png.png',
    active: 1,
  );

  int selectedIndex = 0;
  int index = 0;
  var isLoadingRecently= true.obs;
  var isLoadingHighest= true.obs;
  var isLoadingSliders= true.obs;
  List<String> productNames = [];
  var isLoadingCities= true.obs;
  var recentlyList = <Discount>[].obs;
  var highestList = <Discount>[].obs;
  var slidersList = <SliderBar>[].obs;
  var filterProducts = <Product>[].obs;
  var citiesList = <City>[].obs;

  void onItemTapped(int index) {
    selectedIndex = index;
    print('tap: ${index}');
    update();
  }
  //fetch RecentlyDiscount
  void fetchRecently() async{
    isLoadingRecently(true);
    try {
      var recentlylist = await RemoteServices.fetchDiscountRecently();
      if(recentlylist != null){
        recentlyList.value = recentlylist;
      }else{
      }
    }finally{
      isLoadingRecently(false);
    }
    update();
  }
  //fetch HighestDiscount
  void fetchHighest() async{
    isLoadingHighest(true);
    try {
      var highestlylist = await RemoteServices.fetchDiscountHighest();
      if(highestlylist != null){
        highestList.value = highestlylist;
      }else{
      }
    }finally{
      isLoadingHighest(false);
    }
    update();
  }
  //fetch Sliders
  void fetchSliders() async{
    isLoadingSliders(true);
    try {
      var sliders = await RemoteServices.fetchSliders();

      if(sliders != null){
        isLoadingSliders(true);
        slidersList.value = sliders;
      }
    }finally{
      isLoadingSliders(false);
    }
  }
  //fetch Categories
  void fetchCities() async {
    isLoadingCities(true);
    try {
      var cities = await RemoteServices.fetchCities();
      if (cities != null) {
        citiesList.value = cities;
        citiesList.insert(5, fixedItem); // إضافة المحافظة ذات الـ ID -1 في الموقع السادس
      }
    } finally {
      isLoadingCities(false);
    }
  }
  void searchProducts(title) async{
    try {
      var filters = await RemoteServices.filterProducts(title);
      if(filters != null){
        filterProducts.value = filters;
        productNames = filterProducts.map((product) => product.title).toList();
        print(productNames);
        update();
      }
    }finally{

    }
    update();
  }
  @override
  void onInit() {
    // TODO: implement onInit
    fetchRecently();
    fetchHighest();
    fetchCities();
    fetchSliders();
    super.onInit();
  }
  void changeindex(int i){
    index = i;
    update();
  }

}