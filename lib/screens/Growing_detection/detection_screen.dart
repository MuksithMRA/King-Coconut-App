import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kingcoconut/constants/app_colors.dart';
import 'package:kingcoconut/controllers/controller.dart';
import 'package:kingcoconut/widgets/atoms/app_heading.dart';
import 'package:kingcoconut/widgets/atoms/app_label.dart';
import 'package:kingcoconut/widgets/molecules/input_fields/app_input_field.dart';
import '../../widgets/molecules/buttons/filled_button.dart';

class GDetectionScreen extends StatefulWidget {
  const GDetectionScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<GDetectionScreen> createState() => _GDetectionScreenState();
}

class _GDetectionScreenState extends State<GDetectionScreen> {
  int? age = 9;
  final picker = ImagePicker();
  late Future<PickedFile?> pickedFile = Future.value(null);

  File? imageFile;

  ApiController controller = Get.put(ApiController());
  final GlobalKey<FormState> _ageKey = GlobalKey<FormState>();
  final TextEditingController _ageController = TextEditingController();
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
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppHeading(
                text: 'Home> Growing Detection',
                fontSize: 14,
                color: AppColors.appColorGray01,
              ),
              const SizedBox(
                height: 15,
              ),
              AppHeading(text: 'Growing Detection', fontSize: 18),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.1,
                  height: MediaQuery.of(context).size.height / 1.3,
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: AppColors.appColorBlack, width: 5),
                    borderRadius: const BorderRadius.all(Radius.circular(2.0)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SingleChildScrollView(
                      child: FutureBuilder<PickedFile?>(
                        future: pickedFile,
                        builder: (context, snap) {
                          if (snap.hasData) {
                            return Column(
                              children: [
                                Container(
                                  child: Image.file(
                                    File(snap.data!.path),
                                    fit: BoxFit.contain,
                                    height:
                                        MediaQuery.of(context).size.height / 2,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                AppInputField(
                                  formKey: _ageKey,
                                  controller: _ageController,
                                  inputType: TextInputType.number,
                                  validator: MultiValidator([
                                    RequiredValidator(
                                        errorText: "Age is Required"),
                                  ]),
                                  hintText: "Enter Age in month",
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                AppLabel(
                                  text: "Ages 3,4,7,11,12,15",
                                  textColor: AppColors.appColorGray,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FilledCustomButton(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                3,
                                        text: 'Detect ',
                                        bgColor: AppColors.appColorprimary,
                                        clickEvent: () async {
                                          if (_isValidate()) {
                                            print(
                                                'ImageFile ${imageFile?.path}');
                                            print('ImageFile $imageFile');
                                            File file = File(imageFile!.path);
                                            Uint8List imageBytes =
                                                await file.readAsBytes();
                                            String base64string =
                                                base64.encode(imageBytes);
                                            controller.growingDetection(
                                                image: base64string,
                                                age:
                                                    _ageController.text.trim());
                                          }
                                        }),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    FilledCustomButton(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                3,
                                        text: 'Delete ',
                                        bgColor: AppColors.appColorprimary,
                                        clickEvent: () async {
                                          setState(() {
                                            Get.back();
                                          });
                                        })
                                  ],
                                ),
                              ],
                            );
                          }
                          return SizedBox(
                              height: MediaQuery.of(context).size.height / 2,
                              // color: Colors.blue,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    AppHeading(
                                        text: 'How to capture image',
                                        fontSize: 18),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    AppLabel(
                                      text: "Upload a clear and closer full",
                                      textColor: AppColors.appColorprimary,
                                    ),
                                    AppLabel(
                                      text: "image under 2m distance ",
                                      textColor: AppColors.appColorprimary,
                                    ),
                                    AppLabel(
                                      text: "of the tree.",
                                      textColor: AppColors.appColorprimary,
                                    ),
                                    const SizedBox(
                                      height: 40,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                            alignment: Alignment.center,
                                            child: FilledCustomButton(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    3,
                                                text: 'Pick Image from Camera',
                                                bgColor:
                                                    AppColors.appColorprimary,
                                                clickEvent: () async {
                                                  pickedFile = picker
                                                      .getImage(
                                                          source: ImageSource
                                                              .camera)
                                                      .whenComplete(() =>
                                                          {setState(() {})});
                                                  final file = await pickedFile;
                                                  if (file != null) {
                                                    imageFile = File(file.path);
                                                  }
                                                })),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                            alignment: Alignment.center,
                                            child: FilledCustomButton(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    3,
                                                text: 'Pick Image from Gallery',
                                                bgColor:
                                                    AppColors.appColorprimary,
                                                clickEvent: () async {
                                                  pickedFile = picker
                                                      .getImage(
                                                        source:
                                                            ImageSource.gallery,
                                                      )
                                                      .whenComplete(() =>
                                                          {setState(() {})});
                                                  final file = await pickedFile;
                                                  if (file != null) {
                                                    imageFile = File(file.path);
                                                  }
                                                })),
                                      ],
                                    ),
                                  ],
                                ),
                              ));
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool _isValidate() {
    if (!_ageKey.currentState!.validate()) {
      return false;
    } else {
      return true;
    }
  }
}
