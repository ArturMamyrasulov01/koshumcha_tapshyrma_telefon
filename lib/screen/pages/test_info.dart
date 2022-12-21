import 'package:flutter/material.dart';
import 'package:koshumcha_tapshyrma_telefon/service/pokedex_service.dart';

import '../../model/phone_model.dart';

class TestInfo extends StatelessWidget {
  const TestInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
            child: FutureBuilder(
          future: ServicePhone.getPhone(),
          builder: (context, AsyncSnapshot<PhoneModel> snapshot) {
            if (!snapshot.hasData) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return const Center(
                child: Text("Service kata bar"),
              );
            } else {
              var data = snapshot.data!.bestSeller;
              return Center(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Center(child: Text(data![index].title.toString()));
                  },
                  itemCount: snapshot.data!.bestSeller!.length,
                ),
              );
            }
          },
        )),
      ),
    );
  }
}
