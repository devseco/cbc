import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ui_ecommerce/Installments/Bindings/Landing_bindings.dart';
import 'package:ui_ecommerce/Installments/controllers/Favorite_controller.dart';
import 'package:ui_ecommerce/res/app_pages.dart';
import 'package:ui_ecommerce/locale/Locale_controller.dart';
import 'package:ui_ecommerce/locale/locale.dart';
import 'package:ui_ecommerce/Installments/models/CartModel.dart';
import 'package:ui_ecommerce/Installments/models/FavoriteModel.dart';
import '/Installments/controllers/Cart_controller.dart';
import 'package:intl/intl.dart';
SharedPreferences? sharedPreferences;
var formatter = NumberFormat("#,###");
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();
  await Hive.initFlutter();
  Hive.registerAdapter(CartModelAdapter());
  Hive.registerAdapter(FavoriteModelAdapter());
  BoxCart = await Hive.openBox<CartModel>('Cart');
  BoxFavorite = await Hive.openBox<FavoriteModel>('Favorite');
  runApp(const MyApp());
}
Locale_controller locale_controller = Get.put(Locale_controller());
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: locale(),
      locale: locale_controller.inliaLang,
      title: 'CBC',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Tajawal',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/togather',
      initialBinding: Landing_bindings(),
      getPages: appPages,
    );
  }
}
