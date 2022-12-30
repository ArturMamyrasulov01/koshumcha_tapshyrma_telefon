import 'package:flutter/material.dart';
import 'package:koshumcha_tapshyrma_telefon/app/constants/app_colors/app_colors.dart';

import 'screen/pages/home_page.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.bgColor,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
