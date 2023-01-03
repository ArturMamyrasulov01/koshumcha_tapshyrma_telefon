import 'package:dio/dio.dart';
import 'package:koshumcha_tapshyrma_telefon/model/lat_lon_model.dart';

class ServiceLatLon extends Object {
  static Future<ModelLatLon> getLatLon({num? lat, num? lon}) async {
    Response response = await Dio().get(
      'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=e5061b2d3f4d35ab71d1b211801413e2',
    );
    return ModelLatLon.fromJson(response.data);
  }
}
