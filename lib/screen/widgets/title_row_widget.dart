import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../app/constants/app_colors/app_colors.dart';

class TitleRowWidget extends StatelessWidget {
  final void Function() onClic;
  const TitleRowWidget({
    required this.onClic,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: onClic,
          icon: const Icon(
            Icons.location_on_outlined,
            color: AppColors.brown,
          ),
        ),
        const Text(
          'Zihuatanejo, Gro ',
          style: TextStyle(
            color: AppColors.purple,
            fontSize: 15,
          ),
        ),
        const FaIcon(
          Icons.keyboard_arrow_down,
          color: Color(0xffB3B3B3),
        )
      ],
    );
  }
}
