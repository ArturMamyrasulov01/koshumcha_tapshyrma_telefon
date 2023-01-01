import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:koshumcha_tapshyrma_telefon/app/constants/app_colors/app_colors.dart';
import 'package:koshumcha_tapshyrma_telefon/screen/widgets/sliver_grid_widget.dart';
import 'package:koshumcha_tapshyrma_telefon/screen/widgets/title_row_widget.dart';

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

Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  return await Geolocator.getCurrentPosition();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
          future: ServicePhone.getPhone(),
          builder: (context, AsyncSnapshot<PhoneModel> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: SizedBox(
                  child: CircularProgressIndicator(),
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
                    title: const TitleRowWidget(),
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
