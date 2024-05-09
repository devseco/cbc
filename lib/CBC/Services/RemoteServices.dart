import 'package:http/http.dart' as http;
import 'package:ui_ecommerce/CBC/models/Category.dart';
import 'package:ui_ecommerce/CBC/models/City.dart';
import 'package:ui_ecommerce/CBC/models/Discount.dart';
import '../models/Slider.dart';

class RemoteServices {
  static var client = http.Client();
  static var baseUrl = 'http://127.0.0.1:3000/cbc/api/v1/';
//Login
  //fetch recently discounts
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




}