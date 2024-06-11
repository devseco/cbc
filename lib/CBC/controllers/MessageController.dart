import 'package:get/get.dart';
import 'package:ui_ecommerce/CBC/models/Message.dart';
import '../Services/RemoteServices.dart';
class MessageController extends GetxController with SingleGetTickerProviderMixin{
  var isLoadingItem= true.obs;
  var messagesList = <Message>[].obs;
  void fetchMessages() async {
    isLoadingItem(true);
    try {
      var items = await RemoteServices.fetchMessages();
      if (items != null) {
        messagesList.value = items;
          isLoadingItem(false);
      } else {
        isLoadingItem(false);
      }
    }catch(e){
      print(e.toString());
    } finally {
      isLoadingItem(false);
    }
    isLoadingItem(false);
    update();
  }
  @override
  void onInit() {
    fetchMessages();
    // TODO: implement onInit
    super.onInit();
  }
}
