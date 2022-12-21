import 'package:flutter/material.dart';
import 'package:koshumcha_tapshyrma_telefon/screen/pages/home_page.dart';

import 'package:koshumcha_tapshyrma_telefon/screen/pages/test_info.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
