import 'package:flutter/material.dart';
import 'package:koshumcha_tapshyrma_telefon/app/constants/app_text_styles/app_text_style.dart';
import 'package:koshumcha_tapshyrma_telefon/service/lat_lon_service.dart';

import '../../model/lat_lon_model.dart';

class GeoLocatorPage extends StatelessWidget {
  const GeoLocatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ServiceLatLon().getLatLon(),
      builder: (context, AsyncSnapshot<ModelLatLon> snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: SizedBox(
              height: 100,
              width: 100,
              child: CircularProgressIndicator(strokeWidth: 10),
            ),
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text('Error service'),
          );
        } else {
          var data = snapshot.data!;
          return Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              centerTitle: true,
              title: Text(data.name!),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data.sys!.country!,
                    style: AppTextStyles.mainTextStyle,
                  ),
                  Text(
                    "Lat==> ${data.coord!.lat}",
                    style: AppTextStyles.mainTextStyle,
                  ),
                  Text(
                    "Lon==> ${data.coord!.lon}",
                    style: AppTextStyles.mainTextStyle,
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
