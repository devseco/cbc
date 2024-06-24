import 'package:get/get.dart';
import 'package:ui_ecommerce/main.dart';
import 'FirstController.dart';

class ProfileController extends GetxController {
  var fullName = '';
  var phone = 0;
  var city = '';
  var address = '';
  var typeCard = '';
  var numberCard = '';
  @override
  void onInit() {
    if(sharedPreferences.getBool('remember') == true){
      fullName = sharedPreferences.getString('name')! ?? '';
      phone = sharedPreferences.getInt('phone')! ?? 0;
      city = sharedPreferences.getString('city')! ?? '';
      address = sharedPreferences.getString('address')! ?? '';
    }

    // TODO: implement onInit
    super.onInit();
  }
  void logout(){
    sharedPreferences.clear();
    //BoxCart.clear();
    FirstController controller = Get.put(FirstController());
    controller.onItemTapped(1);
  }

}