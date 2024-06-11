import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ui_ecommerce/AQS/Bindings/Landing_bindings.dart';
import 'package:ui_ecommerce/AQS/controllers/Favorite_controller.dart';
import 'package:ui_ecommerce/res/app_pages.dart';
import 'package:ui_ecommerce/locale/Locale_controller.dart';
import 'package:ui_ecommerce/locale/locale.dart';
import 'package:ui_ecommerce/AQS/models/CartModel.dart';
import 'package:ui_ecommerce/AQS/models/FavoriteModel.dart';
import '/AQS/controllers/Cart_controller.dart';
import 'package:intl/intl.dart';
import 'firebase_options.dart';
SharedPreferences? sharedPreferences;
var formatter = NumberFormat("#,###");
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print("Handling a background message: ${message.messageId}");
}
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();
  await Hive.initFlutter();
  Hive.registerAdapter(CartModelAdapter());
  Hive.registerAdapter(FavoriteModelAdapter());
  BoxCart = await Hive.openBox<CartModel>('Cart');
  BoxFavorite = await Hive.openBox<FavoriteModel>('Favorite');
  await Future.delayed(const Duration(milliseconds: 300));
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  if (Firebase.apps.isNotEmpty) {
    print('Firebase initialized successfully!');
    final fcmToken = await FirebaseMessaging.instance.getToken();
    print('token is : ${fcmToken}');
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    messaging.subscribeToTopic('offers');
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    print('User granted permission: ${settings.authorizationStatus}');
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
      }
    });

  } else {
    print('Failed to initialize Firebase.');
    // Handle the case where Firebase initialization failed
  }
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  runApp(const MyApp());
}

Locale_controller locale_controller = Get.put(Locale_controller());
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key); // أضف Key هنا
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
      initialBinding: Landing_bindings(),
      initialRoute: '/togather',
      getPages: appPages
    );
  }
}
