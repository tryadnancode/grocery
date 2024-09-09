import 'package:get/get.dart';
import 'package:grocery/grocery/create_grocery/create_grocery_binding.dart';
import 'package:grocery/grocery/view/grocery_screen.dart';
import 'package:grocery/routes/app_route.dart';
import 'package:grocery/widget/shopping_list.dart';
import '../grocery/create_grocery/create_grocery_list_screen.dart';
import '../grocery/grocery_details/grocery_details_screen.dart';

class AppPages{
  static final List<GetPage> pages = [
    GetPage(name: AppRoute.screen, page: ()=>  GroceryScreen()),
    GetPage(name: AppRoute.detail, page: ()=>   GroceryDetailsScreen(categoryTitle: '',)),
    GetPage(name: AppRoute.create, page: ()=> const CreateGroceryListScreen(),binding: CreateGroceryBinding()),
    GetPage(name: AppRoute.shopping, page: ()=>const ShoppingList()),
  ];

}

