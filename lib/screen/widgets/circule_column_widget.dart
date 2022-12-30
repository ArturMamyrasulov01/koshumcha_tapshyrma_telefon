import 'package:flutter/material.dart';
import 'package:koshumcha_tapshyrma_telefon/app/constants/app_colors/app_colors.dart';

class CirculeColumnWidget extends StatelessWidget {
  final IconData? centerIcon;
  final String? bottomText;
  final Color? buttonColor;
  final TextStyle? textStyle;
  final Size? size;
  const CirculeColumnWidget({
    super.key,
    this.size,
    required this.textStyle,
    required this.buttonColor,
    required this.centerIcon,
    required this.bottomText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size!.height * 0.02,
          ),
          child: FloatingActionButton(
            elevation: 0.0,
            backgroundColor: buttonColor,
            onPressed: () {},
            child: Icon(
              centerIcon,
              color: AppColors.iconColor,
              size: 30,
            ),
          ),
        ),
        Text(
          bottomText!,
          style: textStyle,
        ),
      ],
    );
  }
}
