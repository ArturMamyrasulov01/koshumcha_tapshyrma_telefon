// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'package:koshumcha_tapshyrma_telefon/app/constants/app_texts/app_texts.dart';

import '../../app/constants/app_colors/app_colors.dart';
import '../../app/constants/app_text_styles/app_text_style.dart';

class InputTextAndQrCodeWidget extends StatelessWidget {
  const InputTextAndQrCodeWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Form(
          child: SizedBox(
            height: 40,
            width: MediaQuery.of(context).size.width * 0.7500,
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: const BorderSide(
                    width: 5,
                  ),
                ),
                hoverColor: AppColors.brown,
                hintText: AppTexts.search,
                hintStyle: AppTextStyles.searchFieldStyle,
                filled: true,
                fillColor: AppColors.white,
                prefixIcon: const Icon(
                  Icons.search,
                  color: AppColors.brown,
                ),
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: SizedBox(
            height: 40,
            child: CircleAvatar(
              backgroundColor: AppColors.brown,
              child: Icon(
                Icons.qr_code,
                color: AppColors.white,
                size: 20.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
