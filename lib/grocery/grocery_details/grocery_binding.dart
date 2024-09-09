import 'package:get/get.dart';

import 'grocery_controller.dart';

class GroceryBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<GroceryController>(()=>GroceryController());
  }
}