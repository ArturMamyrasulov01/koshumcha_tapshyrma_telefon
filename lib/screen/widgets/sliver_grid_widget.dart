import 'package:flutter/material.dart';

import '../../app/constants/app_colors/app_colors.dart';
import '../../model/phone_model.dart';
import '../../service/phone_service.dart';

class SliverGridWidget extends StatelessWidget {
  const SliverGridWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  final List<BestSeller> data;

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return FutureBuilder(
            future: ServicePhone.getPhone(),
            builder: (context, AsyncSnapshot<PhoneModel> snapshot) {
              return Container(
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.brown,
                  borderRadius: BorderRadius.circular(20.0),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      data[index].picture!,
                    ),
                  ),
                ),
              );
            },
          );
        },
        childCount: data.length,
      ),
    );
  }
}
