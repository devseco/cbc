import 'package:get/get.dart';
import 'package:ui_ecommerce/CBC/views/Home.dart';
import 'package:ui_ecommerce/Installments/Bindings/Billing_bindings.dart';
import 'package:ui_ecommerce/Installments/Bindings/Checkout_bindings.dart';
import 'package:ui_ecommerce/Installments/Bindings/ItemBilling_bindings.dart';
import 'package:ui_ecommerce/Installments/Bindings/RecentlyProducts_bindings.dart';
import 'package:ui_ecommerce/Installments/Bindings/Cart_bindings.dart';
import 'package:ui_ecommerce/Installments/Bindings/Category_bindings.dart';
import 'package:ui_ecommerce/Installments/Bindings/Home_bindings.dart';
import 'package:ui_ecommerce/Installments/Bindings/Landing_bindings.dart';
import 'package:ui_ecommerce/Installments/Bindings/Product_bindings.dart';
import 'package:ui_ecommerce/Installments/Bindings/Products_bindings.dart';
import 'package:ui_ecommerce/Installments/middleware/auth_middleware.dart';
import 'package:ui_ecommerce/Installments/views/Billing.dart';
import 'package:ui_ecommerce/Installments/views/Checkout.dart';
import 'package:ui_ecommerce/Installments/views/Favorites.dart';
import 'package:ui_ecommerce/Installments/views/Item_Billing.dart';
import 'package:ui_ecommerce/Installments/views/RecentlyProducts.dart';
import 'package:ui_ecommerce/Installments/views/Cart.dart';
import 'package:ui_ecommerce/Installments/views/Categories.dart';
import 'package:ui_ecommerce/Installments/views/Home.dart';
import 'package:ui_ecommerce/Installments/views/Landing.dart';
import 'package:ui_ecommerce/Installments/views/Login.dart';
import 'package:ui_ecommerce/Installments/views/ProductPage.dart';
import 'package:ui_ecommerce/Installments/views/Products.dart';
import 'package:ui_ecommerce/Togather/Bindings/appBindings.dart';
import 'package:ui_ecommerce/Togather/views/landing.dart';
final List<GetPage> appPages = [
  GetPage(name: '/togather', page: ()=>  Landing_togather()  , binding: appBindings()),
  GetPage(name: '/home_cbc', page: ()=>  Home_cbc()),
  GetPage(name: '/', page: ()=>  Login() ,binding: Landing_bindings(),middlewares: [auth_middleware()]),
  GetPage(name: '/product', page: ()=>  ProductPage() ,binding: Product_bindings()),
  GetPage(name: '/landing', page: ()=>  Landing() ,binding: Landing_bindings()),
  GetPage(name: '/home', page: ()=>  Home() , binding: Home_Bindings()),
  GetPage(name: '/bestProducts', page: ()=>RecentlyProducts() , binding: RecentlyProducts_bindings()),
  GetPage(name: '/cart', page: ()=>CartPage() , binding: Cart_bindings()),
  GetPage(name: '/categories', page: ()=>Categories() , binding: Category_bindings()),
  GetPage(name: '/products', page: ()=>Products() , binding: Products_bindings()),
  GetPage(name: '/checkout', page: ()=>Checkout() , binding: Checkout_bindings()),
  GetPage(name: '/favorites', page: ()=>Favorites() , binding: Checkout_bindings()),
  GetPage(name: '/billing', page: ()=>Billing() , binding: Billing_bindings()),
  GetPage(name: '/Item_Billing', page: ()=>Item_Billing() , binding: ItemBilling_bindings()),
];
