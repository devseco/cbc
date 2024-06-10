import 'package:get/get.dart';
import '../Services/RemoteServices.dart';
import '../models/AllStore.dart';
import '../models/City.dart';
class AllCategoriesController extends GetxController {
  var isLoadingStories= true.obs;
  var isLoadingFilter= true.obs;
  int id = 1;
  int id_city = 0;
  var selectedFilter = RxString('');
  var citiesList = <City>[].obs;
  int cate = 0;
  int city_id = -1;
  int orderby = 0;
  var isFilter= false.obs;
  String? city_name;
  String? cate_name;
  final List<String> items = [
    'الاحدث',
    'الاقدم'
  ];
  String? selectedValue;
  final fixedItem = City(
    id: -1,
    title: 'الكل',
    image: 'https://static.vecteezy.com/system/resources/previews/019/633/209/original/doodle-freehand-drawing-of-iraq-map-free-png.png',
    active: 1,
  );
  var storiesList = <CategoryAll>[].obs;
  void fetchStories(orderby) async{
    isLoadingStories(true);
    isFilter(true);
    storiesList.clear();
    try {
      var list = await RemoteServices.fetchFilterCategories(orderby , city_id);
      if(list != null){
        storiesList.value = list;
      }else{
        print('loading not');
        isLoadingStories(false);
        isFilter(false);
      }
    }finally{
      isLoadingStories(false);
      isFilter(false);
    }
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
      var list = await RemoteServices.fetchFilterCategories(orderby ,city );
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
    print(id);
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