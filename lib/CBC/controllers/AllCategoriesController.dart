import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_ecommerce/CBC/models/AllStore.dart';
import 'package:ui_ecommerce/CBC/models/Store.dart';

import '../Services/RemoteServices.dart';
import '../models/City.dart';

class AllCategoriesController extends GetxController {
  var isLoadingStories= true.obs;
  var isLoadingFilter= true.obs;
  int id = 1;
  int id_city = 0;
  var selectedFilter = RxString('');
  var citiesList = <City>[].obs;

  RangeValues currentRangeValues = const RangeValues(0, 100);
  int cate = 0;
  int city_id = 0;
  int orderby = 0;
  var isFilter= false.obs;
  String? city_name;
  String? cate_name;
  final List<String> items = [
    'الاحدث',
    'الاقدم',
    'الاعلى خصم',
    'الادنى خصم',
  ];
  String? selectedValue;
  final fixedItem = City(
    id: -1,
    title: 'الكل',
    image: 'https://static.vecteezy.com/system/resources/previews/019/633/209/original/doodle-freehand-drawing-of-iraq-map-free-png.png',
    active: 1,
  );
  var storiesList = <AllStore>[].obs;
  void fetchStories(orderby) async{
    isLoadingStories(true);
    storiesList.clear();
    try {
      var list = await RemoteServices.fetchAllStories(orderby , city_id);
      if(list != null){
        storiesList.value = list;
      }else{
        print('loading not');
        isLoadingStories(false);
      }
    }finally{
      isLoadingStories(false);
    }
    isLoadingStories(false);
    update();
  }
  void fetchCities() async {
    isLoadingStories(true);
    try {
      var cities = await RemoteServices.fetchCities();
      if (cities != null) {
        citiesList.value = cities;
        citiesList.insert(0, fixedItem); // إضافة المحافظة ذات الـ ID -1 في الموقع السادس
      }
    } finally {
      isLoadingStories(false);
    }
  }
  void filterItems(orderby , city)  async{
    isFilter(true);
    storiesList.clear();
    try {
      var list = await RemoteServices.fetchAllStories(orderby ,city );
      if(list != null){
        storiesList.value = list;
      }else{
        print('loading not');
        isFilter(false);
      }
    }finally{
      isFilter(false);
    }
    isFilter(false);
    update();
  }

  void changeFilter(value){
    selectedValue = value;
    id = items.indexOf(value) + 1;
    filterItems(id , city_id);
    update();
  }
  void filterBillsByStatus(statusCode) {
    print(statusCode);
    city_id = statusCode;
    if (statusCode > 0) {
      filterItems(id , statusCode);
    } else {
      fetchStories(id);
    }
   // update();
  }
  @override
  void onInit() {
    fetchStories(1);
    fetchCities();
    selectedFilter('الكل');
    // TODO: implement onInit
    super.onInit();
  }



}