import 'package:http/http.dart' as http;
import 'package:ui_ecommerce/CBC/models/Account.dart';
import 'package:ui_ecommerce/CBC/models/CallCenter.dart';
import 'package:ui_ecommerce/CBC/models/CardAbout.dart';
import 'package:ui_ecommerce/CBC/models/CardSales.dart';
import 'package:ui_ecommerce/CBC/models/CardType.dart';
import 'package:ui_ecommerce/CBC/models/Category.dart';
import 'package:ui_ecommerce/CBC/models/City.dart';
import 'package:ui_ecommerce/CBC/models/Discount.dart';
import 'package:ui_ecommerce/CBC/models/Qr.dart';
import 'package:ui_ecommerce/CBC/models/Store.dart';
import 'package:ui_ecommerce/CBC/models/StoreModel.dart';
import '../models/Slider.dart';

class RemoteServices {
  static var client = http.Client();
  static var baseUrl = 'http://127.0.0.1:3000/cbc/api/v1/';
//Login
// fetch recently discounts
  static Future<List<Discount>?> fetchDiscountRecently() async {
    var endpoint = 'getDiscountrecently';
    try {
      var response = await client.get(Uri.parse(baseUrl + endpoint));
      if (response.statusCode == 200) {
        var jsonData = response.body;
        List<Discount> stories = discountFromJson(jsonData);
        return stories;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
  //fetch categories
  static Future<List<Category>?> fetchCategories(id) async {
    var endpoint = 'getCategory/${id}';
    try {
      var response = await client.get(Uri.parse(baseUrl + endpoint));
      if (response.statusCode == 200) {
        var jsonData = response.body;
        List<Category> list = categoryFromJson(jsonData);
        return list;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
  //fetch highest Discount
  static Future<List<Discount>?> fetchDiscountHighest() async {
    var endpoint = 'getDiscountHighest';
    try {
      var response = await client.get(Uri.parse(baseUrl + endpoint));
      if (response.statusCode == 200) {
        var jsonData = response.body;
        List<Discount> stories = discountFromJson(jsonData);
        print('loooad');
        return stories;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
  //fetch cities
  static Future<List<City>?> fetchCities() async {
    var endpoint = 'getAllCities';
    try {
      var response = await client.get(Uri.parse(baseUrl + endpoint));
      if (response.statusCode == 200) {
        var jsonData = response.body;
        List<City> cities = cityFromJson(jsonData);
        return cities;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  //Fetch Sliders From Endpoint (getSliders)
  static Future<List<SliderBar>?> fetchSliders() async {
    var endpoint = 'getSliders';
    try {
      var response = await client.get(Uri.parse(baseUrl + endpoint));
      if (response.statusCode == 200) {
        var jsonData = response.body;
        List<SliderBar> sliders = sliderFromJson(jsonData);
        return sliders;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }


  //Fetch Stories From Endpoint (getStories)
  static Future<Store?> fetchStories(cate , city) async {
    var endpoint = 'getStories/${cate}/${city}';
    try {
      var response = await client.get(Uri.parse(baseUrl + endpoint));
      if (response.statusCode == 200) {
        var jsonData = response.body;
        Store? sliders = storeFromJson(jsonData);
        return sliders;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

//Fetch Stories From Endpoint (getStories)
  static Future<StoreModel?> fetchStore(id) async {
    var endpoint = 'getStore/${id}';
    try {
      var response = await client.get(Uri.parse(baseUrl + endpoint));
      if (response.statusCode == 200) {
        var jsonData = response.body;
        StoreModel store = storeModelFromJson(jsonData);
        return store;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
  //Fetch Card About From Endpoint (getCardAbout)
  static Future<CardAbout?> fetchCardAbout() async {
    var endpoint = 'getCardAbout';
    try {
      var response = await client.get(Uri.parse(baseUrl + endpoint));
      if (response.statusCode == 200) {
        var jsonData = response.body;
        CardAbout cardAbout = cardAboutFromJson(jsonData);
        return cardAbout;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
  //Fetch Card Types From Endpoint (getCardType)
  static Future<CardType?> fetchCardTypes() async {
    var endpoint = 'getCardType';
    try {
      var response = await client.get(Uri.parse(baseUrl + endpoint));
      if (response.statusCode == 200) {
        var jsonData = response.body;
        CardType cardType = cardTypeFromJson(jsonData);
        return cardType;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
  //Fetch Card Sales From Endpoint (getCardSales)
  static Future<CardSale?> fetchCardSales() async {
    var endpoint = 'getCardSales';
    try {
      var response = await client.get(Uri.parse(baseUrl + endpoint));
      if (response.statusCode == 200) {
        var jsonData = response.body;
        CardSale cardSale = cardSaleFromJson(jsonData);
        return cardSale;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
  //Fetch Account From Endpoint (getAccount)
  static Future<List<AccountModel>?> fetchAccount(id) async {
    var endpoint = 'getAccount/${id}';
    try {
      var response = await client.get(Uri.parse(baseUrl + endpoint));
      if (response.statusCode == 200) {
        var jsonData = response.body;
        List<AccountModel> account = accountModelFromJson(jsonData);
        return account;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
  //Fetch CallCenter From Endpoint (getCallCenter)
  static Future<List<CallCenterModel>?> fetchCallCenter() async {
    var endpoint = 'getCallCenter';
    try {
      var response = await client.get(Uri.parse(baseUrl + endpoint));
      if (response.statusCode == 200) {
        var jsonData = response.body;
        List<CallCenterModel> callCenter = callCenterModelFromJson(jsonData);
        return callCenter;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
  //Fetch Qr From Endpoint (getQr)
  static Future<List<QrModel>?> fetchQr() async {
    var endpoint = 'getQr';
    try {
      var response = await client.get(Uri.parse(baseUrl + endpoint));
      if (response.statusCode == 200) {
        var jsonData = response.body;
        List<QrModel> qr = qrModelFromJson(jsonData);
        return qr;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }



}