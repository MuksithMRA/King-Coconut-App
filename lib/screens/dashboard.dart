import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kingcoconut/constants/app_colors.dart';
import 'package:kingcoconut/constants/routes.dart';
import 'package:kingcoconut/controllers/controller.dart';
import 'package:kingcoconut/services/sharedPref.dart';
import 'package:kingcoconut/widgets/atoms/app_heading.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

ApiController controller = Get.put(ApiController());

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    print(SharedPref.getToken());
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Image.asset(
          "assets/images/kingcoco.png",
          width: 250,
          height: 85,
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        // title: Image.asset(
        //   "assets/images/sarasavi_home_heading.png",
        //   width: 136,
        //   height: 32,
        // ),
        leading: IconButton(
            onPressed: () async {
              // controller.getProfile();
              Get.toNamed(Routes.PROFILE_SCREEN);
            },
            icon: const Icon(
              Icons.account_circle_rounded,
              color: AppColors.appColorGray,
              size: 50,
            )),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const SizedBox(
          height: 70,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25.0, right: 25),
          child: Row(
            children: [
              Expanded(
                  flex: 2,
                  child: InkWell(
                      onTap: () {
                        Get.toNamed(Routes.DISEASE_DETECT);
                      },
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: AppColors.appColorprimary, width: 5),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5.0)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                  child:
                                      Image.asset("assets/images/home1.jpg")),
                            ),
                          ),
                          AppHeading(text: 'Diseasses', fontSize: 18),
                          AppHeading(text: 'Detection', fontSize: 18),
                        ],
                      ))),
              const Spacer(
                flex: 1,
              ),
              Expanded(
                  flex: 2,
                  child: InkWell(
                      onTap: () {
                        Get.toNamed(Routes.GROWING_DETECT);
                      },
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: AppColors.appColorprimary, width: 5),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5.0)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                  child:
                                      Image.asset("assets/images/homegd.jpg")),
                            ),
                          ),
                          AppHeading(text: 'Growing', fontSize: 18),
                          AppHeading(text: 'Detection', fontSize: 18),
                        ],
                      )))
            ],
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25.0, right: 25),
          child: Row(
            children: [
              Expanded(
                  flex: 2,
                  child: InkWell(
                      onTap: () {
                        Get.toNamed(Routes.CHART_FILTER);
                      },
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: AppColors.appColorprimary, width: 5),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5.0)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                  child:
                                      Image.asset("assets/images/home3.jpg")),
                            ),
                          ),
                          AppHeading(text: 'Predict Export', fontSize: 18),
                          AppHeading(text: 'Details', fontSize: 18),
                        ],
                      ))),
              const Spacer(
                flex: 1,
              ),
              Expanded(
                  flex: 2,
                  child: InkWell(
                      onTap: () {
                        Get.toNamed(Routes.CHATDETAILSCREEN);
                      },
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: AppColors.appColorprimary, width: 5),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5.0)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                  child:
                                      Image.asset("assets/images/home4.jpg")),
                            ),
                          ),
                          AppHeading(text: 'FAQ', fontSize: 18),
                        ],
                      )))
            ],
          ),
        ),
      ]),
    );
  }
}
