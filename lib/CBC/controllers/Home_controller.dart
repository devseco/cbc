import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ui_ecommerce/CBC/models/City.dart';
import 'package:ui_ecommerce/CBC/models/Discount.dart';
import '../Services/RemoteServices.dart';
import '../models/Slider.dart';
import '../models/TestItem.dart';

class Chome_controller extends GetxController {
  final fixedItem = City(
    id: -1,
    title: 'المحافظات',
    image: 'https://static.vecteezy.com/system/resources/previews/019/633/209/original/doodle-freehand-drawing-of-iraq-map-free-png.png',
    active: 1,
  );
  late TextEditingController myController = TextEditingController();
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
  var citiesList = <City>[].obs;
  Future<List<TestItem>> fetchData() async {
    await Future.delayed(Duration(milliseconds: 2000));
    List<TestItem> _list = [];
    String _inputText = myController.text;
    List<dynamic> filters = await RemoteServices.filterStories(_inputText);
    for (var jsonItem in filters) {
      _list.add(TestItem.fromJson(jsonItem));
    }
    return _list;
  }

  _printLatestValue() {
    print("Textfield value: ${myController.text}");

    //print("Textfield value: ${myController.text}");
  }
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
    update();
  }
  //fetch Categories
  void fetchCities() async {
    isLoadingCities(true);
    try {
      var cities = await RemoteServices.fetchCities();
      if (cities != null) {
        citiesList.value = cities;
        if (citiesList.length >= 5) {
          citiesList.insert(5, fixedItem);
          isLoadingCities(false);
        } else {
          citiesList.add(fixedItem);
          isLoadingCities(false);
        }
      }
    } finally {

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