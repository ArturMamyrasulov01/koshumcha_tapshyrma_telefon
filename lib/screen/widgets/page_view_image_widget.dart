import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../app/constants/app_texts/app_texts.dart';
import '../../model/phone_model.dart';
import 'text_row_widget.dart';

class PageViewImageWidget extends StatelessWidget {
  const PageViewImageWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  final List<HomeStore>? data;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 9,
      child: Column(
        children: [
          const Expanded(
            flex: 2,
            child: TextRowWidget(
              textLeft: AppTexts.hotSales,
              textRight: AppTexts.seeMore,
            ),
          ),
          Expanded(
            flex: 8,
            child: PageView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image:
                            CachedNetworkImageProvider(data![index].picture!)),
                  ),
                );
              },
              itemCount: data!.length,
            ),
          ),
          const Expanded(
            flex: 2,
            child: TextRowWidget(
              textLeft: AppTexts.bestSeller,
              textRight: AppTexts.seeMore,
            ),
          )
        ],
      ),
    );
  }
}
