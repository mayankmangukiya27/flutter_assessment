import 'dart:convert';
import 'dart:developer';

import 'package:flutter_keychain/flutter_keychain.dart';
import 'package:get/get.dart';
import 'package:interview_project/AppConfig/app_config.dart';
import 'package:http/http.dart' as http;
import 'package:interview_project/Model/food_model.dart';

class FoodController extends GetxController {
  FoodModel? foodModelResponse;
  RxInt apiStatusCode = 0.obs;

  @override
  void onInit() async {
    getFoodList();
    update();
    super.onInit();
  }

  getFoodList() async {
    await FlutterKeychain.get(key: "foodList");
    var headers = {'Authorization': appConfig.apiToken};
    var request = http.Request(
        'GET', Uri.parse('${appConfig.baseUrl}${appConfig.businessesApiUrl}'));
    request.headers.addAll(headers);
    var response = await http.Response.fromStream(await request.send());
    apiStatusCode.value = response.statusCode;
    update();
    if (response.statusCode == 200) {
      await FlutterKeychain.put(key: "foodList", value: response.body);
      await getKeychainFoodList();
    } else if (response.statusCode == 404) {
//somethng went wrong
    }
  }

  getKeychainFoodList() async {
    var firstStart = await FlutterKeychain.get(key: "foodList");
    if (firstStart != null) {
      foodModelResponse = FoodModel.fromJson(jsonDecode(firstStart));
      update();
    }
  }
}
