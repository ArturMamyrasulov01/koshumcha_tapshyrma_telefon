import 'package:flutter/material.dart';
import 'package:koshumcha_tapshyrma_telefon/screen/widgets/input_text_and_qr-code_widget.dart';

import '../../app/constants/app_colors/app_colors.dart';
import '../../app/constants/app_text_styles/app_text_style.dart';
import '../../app/constants/app_texts/app_texts.dart';
import '../../model/phone_model.dart';
import 'circule_column_widget.dart';
import 'text_row_widget.dart';
import 'title_row_widget.dart';

class SliverAppBarWidget extends StatelessWidget {
  const SliverAppBarWidget({
    required this.data,
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;
  final List<HomeStore> data;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      backgroundColor: Colors.transparent,
      
      expandedHeight: size.height * 0.7,
      centerTitle: true,
      title: const TitleRowWidget(),
      actions: const [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Icon(
            Icons.filter_alt_outlined,
            color: AppColors.purple,
          ),
        ),
      ],
      flexibleSpace: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: size.height * 0.06),
            child: const TextRowWidget(
              textLeft: AppTexts.selectCategory,
              textRight: AppTexts.viewAll,
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: EdgeInsets.all(size.height * 0.01),
              child: Row(children: [
                CirculeColumnWidget(
                  size: size,
                  textStyle: AppTextStyles.buttonTextStyle,
                  buttonColor: AppColors.brown,
                  centerIcon: Icons.phone_iphone,
                  bottomText: AppTexts.phones,
                ),
                CirculeColumnWidget(
                  size: size,
                  textStyle: AppTextStyles.categoryTextStyle,
                  buttonColor: AppColors.white,
                  centerIcon: Icons.computer,
                  bottomText: AppTexts.computer,
                ),
                CirculeColumnWidget(
                  size: size,
                  textStyle: AppTextStyles.categoryTextStyle,
                  buttonColor: AppColors.white,
                  centerIcon: Icons.heart_broken_sharp,
                  bottomText: AppTexts.health,
                ),
                CirculeColumnWidget(
                  size: size,
                  textStyle: AppTextStyles.categoryTextStyle,
                  buttonColor: AppColors.white,
                  centerIcon: Icons.book_rounded,
                  bottomText: AppTexts.books,
                ),
                CirculeColumnWidget(
                  size: size,
                  textStyle: AppTextStyles.categoryTextStyle,
                  buttonColor: AppColors.white,
                  centerIcon: Icons.phone_iphone,
                  bottomText: AppTexts.phones,
                ),
              ]),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.045,
            ),
            child: const InputTextAndQrCodeWidget(),
          ),
          const TextRowWidget(
            textLeft: AppTexts.hotSales,
            textRight: AppTexts.seeMore,
          ),
          SizedBox(
            height: size.height * 0.3,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    alignment: Alignment.topLeft,
                    width: size.width * 0.99,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.purple,
                      image: DecorationImage(
                        image: NetworkImage(
                          data[index].picture.toString(),
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            data[index].title!,
                            style: AppTextStyles.namePhoneTextStyle,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(data[index].title!),
                        ],
                      ),
                    ),
                  ),
                );
              },
              itemCount: data.length,
            ),
          ),
          const TextRowWidget(
            textLeft: AppTexts.bestSeller,
            textRight: AppTexts.seeMore,
          ),
        ],
      ),
    );
  }
}
