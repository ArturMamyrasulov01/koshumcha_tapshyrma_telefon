import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

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
              return CachedNetworkImage(
                imageUrl: data[index].picture!,
                imageBuilder: (context, imageProvider) => Container(
                  alignment: Alignment.bottomCenter,
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                        colorFilter: const ColorFilter.mode(
                            Colors.transparent, BlendMode.colorBurn)),
                  ),
                  child: Chip(
                    label: Text(
                      data[index].title!,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              );
            },
          );
        },
        childCount: data.length,
      ),
    );
  }
}
