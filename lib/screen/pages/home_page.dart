import 'package:flutter/material.dart';
import 'package:koshumcha_tapshyrma_telefon/app/constants/app_colors/app_colors.dart';

import '../../model/phone_model.dart';
import '../../service/phone_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              slivers: [
                SliverAppBar(
                  expandedHeight: 200,
                  flexibleSpace: FlexibleSpaceBar(
                      background: Column(
                    children: [
                      Container(
                        height: 250,
                        color: AppColors.brown,
                      )
                    ],
                  )),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 200,
                          color: AppColors.purple,
                        ),
                      );
                    },
                    childCount: 10,
                  ),
                )
              ],
            );
          }
        },
      ),
    );
  }
}
