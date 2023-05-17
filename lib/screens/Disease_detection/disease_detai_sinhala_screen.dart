import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kingcoconut/constants/app_colors.dart';
import 'package:kingcoconut/controllers/controller.dart';
import 'package:kingcoconut/services/pdf_api.dart';
import 'package:kingcoconut/widgets/atoms/app_heading.dart';
import 'package:kingcoconut/widgets/atoms/app_label.dart';
import 'package:kingcoconut/widgets/molecules/buttons/filled_button.dart';
import 'package:screenshot/screenshot.dart';

class DDetailsSinhalaScreen extends StatefulWidget {
  const DDetailsSinhalaScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<DDetailsSinhalaScreen> createState() => _DDetailsSinhalaScreenState();
}

class _DDetailsSinhalaScreenState extends State<DDetailsSinhalaScreen> {
  ScreenshotController screenshotController = ScreenshotController();

  ApiController controller = Get.put(ApiController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.appColorBlack,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: AppHeading(
          text: 'Home> Disease Detection',
          fontSize: 14,
          color: AppColors.appColorGray01,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Screenshot(
                controller: screenshotController,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // AppHeading(
                    //     text: 'Home> Disease Detection', fontSize: 14,color: AppColors.appColorGray01,),
                    // const SizedBox(
                    //   height: 20,
                    // ),
                    AppHeading(text: 'Solutions', fontSize: 18),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 1.3,
                        // decoration: BoxDecoration(
                        //   border: Border.all(color: AppColors.appColorBlack, width: 5),
                        //   borderRadius: BorderRadius.all(Radius.circular(2.0)),
                        // ),
                        child: SingleChildScrollView(
                          child: Padding(
                              padding: const EdgeInsets.all(0),
                              child: Column(
                                children: [
                                  AppLabel(
                                    text: "Disease Name",
                                    fontWeight: FontWeight.w400,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  AutoSizeText(
                                    controller
                                        .disease.disease!.diseaseNameSinhala!,
                                    style: const TextStyle(fontSize: 15),
                                    maxLines: 5,
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  AppLabel(
                                    text: "Treatment",
                                    fontWeight: FontWeight.w400,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  AutoSizeText(
                                    controller
                                        .disease.disease!.treatmentInSinhala!,
                                    style: const TextStyle(fontSize: 15),
                                    maxLines: 65,
                                  ),
                                ],
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: FilledCustomButton(
                    text: "Download PDF",
                    clickEvent: () async {
                      screenshotController
                          .capture(delay: const Duration(seconds: 1))
                          .then((value) {
                        if (value != null) {
                          PdfApi().generatePdf(value);
                        }
                      });
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
