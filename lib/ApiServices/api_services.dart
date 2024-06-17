import 'package:flutter_keychain/flutter_keychain.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:http/http.dart' as http;

import '../AppConfig/app_config.dart';
import '../Model/food_model.dart';

class ApiServices{

  getFoodList() async {
    var headers = {'Authorization': appConfig.apiToken};
    var request = http.Request(
        'GET', Uri.parse('${appConfig.baseUrl}${appConfig.businessesApiUrl}'));
    request.headers.addAll(headers);
    var response = await http.Response.fromStream(await request.send());
    return response;
  }
}