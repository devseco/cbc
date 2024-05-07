import 'package:get/get.dart';

import '../../CBC/controllers/Landing_controller.dart';

class appBindings implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => Clanding_controller());
    // TODO: implement dependencies
  }

}