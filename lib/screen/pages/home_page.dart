import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:koshumcha_tapshyrma_telefon/app/constants/app_colors/app_colors.dart';
import 'package:koshumcha_tapshyrma_telefon/app/constants/app_text_styles/app_text_style.dart';
import 'package:koshumcha_tapshyrma_telefon/app/constants/app_texts/app_texts.dart';
import 'package:koshumcha_tapshyrma_telefon/screen/widgets/circule_column_widget.dart';
import 'package:koshumcha_tapshyrma_telefon/service/pokedex_service.dart';

import '../../model/phone_model.dart';
import '../widgets/input_text_and_qr-code_widget.dart';
import '../widgets/text_row_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //List<String> textList = [AppTexts.bestSeller, AppTexts.phones,];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppColors.bgColor,
        title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.location_on_outlined,
              color: AppColors.brown,
            ),
          ),
          const Text(
            'Zihuatanejo, Gro 🌨',
            style: TextStyle(
              color: AppColors.purple,
              fontSize: 15,
            ),
          ),
          const FaIcon(
            Icons.keyboard_arrow_down,
            color: Color(0xffB3B3B3),
          )
        ]),
        actions: const [
          Icon(
            Icons.filter_alt_outlined,
            color: AppColors.purple,
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      backgroundColor: AppColors.bgColor,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const TextRowWidget(
              textLeft: AppTexts.selectCategory,
              textRight: AppTexts.viewAll,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: const [
                CirculeColumnWidget(
                  textStyle: AppTextStyles.buttonTextStyle,
                  buttonColor: AppColors.brown,
                  centerIcon: Icons.phone_iphone,
                  bottomText: AppTexts.phones,
                ),
                CirculeColumnWidget(
                  textStyle: AppTextStyles.categoryTextStyle,
                  buttonColor: AppColors.white,
                  centerIcon: Icons.computer,
                  bottomText: AppTexts.computer,
                ),
                CirculeColumnWidget(
                  textStyle: AppTextStyles.categoryTextStyle,
                  buttonColor: AppColors.white,
                  centerIcon: Icons.heart_broken_sharp,
                  bottomText: AppTexts.health,
                ),
                CirculeColumnWidget(
                  textStyle: AppTextStyles.categoryTextStyle,
                  buttonColor: AppColors.white,
                  centerIcon: Icons.book_rounded,
                  bottomText: AppTexts.books,
                ),
                CirculeColumnWidget(
                  textStyle: AppTextStyles.categoryTextStyle,
                  buttonColor: AppColors.white,
                  centerIcon: Icons.phone_iphone,
                  bottomText: AppTexts.phones,
                ),
              ]),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                vertical: 20,
              ),
              child: InputTextAndQrCodeWidget(),
            ),
            SizedBox(
              child: Column(
                children: [
                  const TextRowWidget(
                    textLeft: AppTexts.hotSales,
                    textRight: AppTexts.seeMore,
                  ),
                  SizedBox(
                    height: 200,
                    child: FutureBuilder(
                      future: ServicePhone.getPhone(),
                      builder: (context, AsyncSnapshot<PhoneModel> snapshot) {
                        if (!snapshot.hasData) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (snapshot.hasError) {
                          return const Center(
                            child: Text("Error"),
                          );
                        } else {
                          var data = snapshot.data!.homeStore;
                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Container(
                                width: MediaQuery.of(context).size.width * 0.95,
                                height: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: AppColors.purple,
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      data[index].picture.toString(),
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            },
                            itemCount: data!.length,
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
