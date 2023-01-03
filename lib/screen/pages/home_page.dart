import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:koshumcha_tapshyrma_telefon/app/constants/app_colors/app_colors.dart';
import 'package:koshumcha_tapshyrma_telefon/screen/pages/geolocator_page.dart';
import 'package:koshumcha_tapshyrma_telefon/screen/widgets/sliver_grid_widget.dart';
import 'package:koshumcha_tapshyrma_telefon/screen/widgets/title_row_widget.dart';
import 'package:koshumcha_tapshyrma_telefon/service/lat_lon_service.dart';
import 'package:koshumcha_tapshyrma_telefon/utils/geo_locator/geo_locator.dart';

import '../../model/phone_model.dart';
import '../../service/phone_service.dart';
import '../widgets/page_view_image_widget.dart';
import '../widgets/single_button_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

final PageController controller = PageController();

class _HomePageState extends State<HomePage> {
  void getGeoLocator() async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const GeoLocatorPage(),
      ),
    );
    final position = await GeoLocator.getPosition();
    ServiceLatLon.getLatLon(
      lat: position.latitude,
      lon: position.longitude,
    );
    showLatLon();
    setState(() {});
  }

  Future<void> showLatLon() async {
    final position = await GeoLocator.getPosition();
    log(position.latitude.toString());
    log(position.longitude.toString());
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
          future: ServicePhone.getPhone(),
          builder: (context, AsyncSnapshot<PhoneModel> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: SizedBox(
                  height: size.height * 0.07,
                  width: size.width * 0.15,
                  child: CircularProgressIndicator(
                    strokeWidth: size.height * 0.02,
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text("Error Service"),
              );
            } else {
              var data = snapshot.data!;
              return CustomScrollView(
                primary: true,
                shrinkWrap: true,
                slivers: [
                  SliverAppBar(
                    title: TitleRowWidget(onClic: getGeoLocator),
                    backgroundColor: AppColors.trColor,
                    expandedHeight: size.height * 0.7,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.03,
                        ),
                        child: Column(
                          children: [
                            SingleButtonWidget(size: size),
                            PageViewImageWidget(data: data.homeStore),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SliverGridWidget(
                    data: data.bestSeller!,
                  )
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
