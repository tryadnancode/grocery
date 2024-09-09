import 'package:get/get.dart';

import 'create_grocery_controller.dart';

class CreateGroceryBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<CreateGroceryController>(() => CreateGroceryController());
  }

}