import 'package:flutter/material.dart';

import '../../app/constants/app_colors/app_colors.dart';
import '../../app/constants/app_text_styles/app_text_style.dart';
import '../../app/constants/app_texts/app_texts.dart';
import 'circule_column_widget.dart';
import 'input_text_and_qr-code_widget.dart';
import 'text_row_widget.dart';

class SingleButtonWidget extends StatelessWidget {
  const SingleButtonWidget({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 7,
      child: Column(
        children: [
          SizedBox(
            height: size.height * 0.05,
          ),
          const TextRowWidget(
            textLeft: AppTexts.selectCategory,
            textRight: AppTexts.viewAll,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: EdgeInsets.all(size.height * 0.01),
              child: Row(
                children: [
                  CirculeColumnWidget(
                    heroTag: "1",
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
                    heroTag: '2',
                  ),
                  CirculeColumnWidget(
                    heroTag: "3",
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
                    heroTag: "4",
                  ),
                  CirculeColumnWidget(
                    size: size,
                    textStyle: AppTextStyles.categoryTextStyle,
                    buttonColor: AppColors.white,
                    centerIcon: Icons.phone_iphone,
                    bottomText: AppTexts.phones,
                    heroTag: "5",
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          const InputTextAndQrCodeWidget()
        ],
      ),
    );
  }
}
