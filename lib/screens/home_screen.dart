import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kingcoconut/constants/app_colors.dart';
import 'package:kingcoconut/constants/routes.dart';
import 'package:kingcoconut/widgets/molecules/buttons/filled_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Center(
          child: Image.asset(
            "assets/images/kingcoco.png",
            width: 250,
            height: 85,
          ),
        ),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.only(left: 25.0, right: 25, top: 20),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: FilledCustomButton(
                    text: 'Log In',
                    bgColor: AppColors.appColorprimary,
                    clickEvent: () {
                      Get.toNamed(Routes.LOGIN);
                    }),
              ),
              const Spacer(
                flex: 1,
              ),
              Expanded(
                flex: 2,
                child: FilledCustomButton(
                    text: 'Register',
                    bgColor: AppColors.appColorprimary,
                    clickEvent: () {
                      Get.toNamed(Routes.SIGNUP);
                    }),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const SizedBox(
          height: 30,
        ),
        Image.asset("assets/images/home.jpg"),
      ]),
    );
  }
}
