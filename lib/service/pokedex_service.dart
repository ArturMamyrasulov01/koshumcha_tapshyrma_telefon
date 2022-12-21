import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:koshumcha_tapshyrma_telefon/model/phone_model.dart';

class ServicePhone extends Object {
  static Future<PhoneModel> getPhone() async {
    Response response = await Dio()
        .get('https://run.mocky.io/v3/654bd15e-b121-49ba-a588-960956b15175');
    log('message');
    return PhoneModel.fromJson(response.data);
  }
}
