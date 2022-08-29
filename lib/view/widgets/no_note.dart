import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:molahzati/view/widgets/custom_app_bar.dart';
import '../../const/my_colors.dart';

class NoNote extends StatelessWidget {
  const NoNote({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              MyColors.grayColor,
              MyColors.boldColor,
            ],
          ),
        ),
        child: Stack(
          children: [
            const SizedBox(
              height: 60,
            ),
            Positioned(
                top: 60,
                right: 10,
                child: Container(width: Get.width, child: CustomAppBar())),
            Align(
              alignment: Alignment.center,
              child: Center(
                child: Lottie.asset(
                  'assets/lottie/empty.json',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
