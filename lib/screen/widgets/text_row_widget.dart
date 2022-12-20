import 'package:flutter/material.dart';

import '../../app/constants/app_text_styles/app_text_style.dart';

class TextRowWidget extends StatelessWidget {
  final String? textLeft;
  final String? textRight;
  const TextRowWidget({
    required this.textLeft,
    required this.textRight,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          textLeft!,
          style: AppTextStyles.mainTextStyle,
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            textRight!,
            style: AppTextStyles.buttonTextStyle,
          ),
        ),
      ],
    );
  }
}
