import 'package:flutter/material.dart';
import 'package:koshumcha_tapshyrma_telefon/service/phone_service.dart';

import '../../model/phone_model.dart';
import '../widgets/sliver_appbar_widget.dart';
import '../widgets/sliver_grid_widget.dart';

class HomePage1 extends StatefulWidget {
  const HomePage1({super.key});

  @override
  State<HomePage1> createState() => _HomePage1State();
}

class _HomePage1State extends State<HomePage1> {
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
                  height: size.height * 0.1,
                  width: size.width * 0.2,
                  child: CircularProgressIndicator(
                    strokeWidth: size.width * 0.03,
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
                slivers: [
                  SliverAppBarWidget(
                    size: size,
                    data: data.homeStore!,
                  ),
                  SliverGridWidget(data: data.bestSeller!),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
