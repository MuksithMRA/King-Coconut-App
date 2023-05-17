import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:kingcoconut/constants/app_colors.dart';
import 'package:kingcoconut/controllers/controller.dart';
import 'package:kingcoconut/widgets/atoms/app_heading.dart';
import 'package:kingcoconut/widgets/atoms/app_label.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late final GlobalKey<FormState> _emailKey = GlobalKey<FormState>();

  late final GlobalKey<FormState> _usernameKey = GlobalKey<FormState>();

  late final GlobalKey<FormState> _passwordKey = GlobalKey<FormState>();

  final GlobalKey<FormState> _confirmPasswordKey = GlobalKey<FormState>();

  late final GlobalKey<FormState> _mobileNumberKey = GlobalKey<FormState>();

  late final TextEditingController _emailController = TextEditingController();

  late final TextEditingController _usernameController =
      TextEditingController();

  late final TextEditingController _passwordController =
      TextEditingController();

  late final TextEditingController _confirmPasswordController =
      TextEditingController();
  late final TextEditingController _mobileNumberController =
      TextEditingController();

  @override
  void initState() {
    controller.getProfile();
  }

  bool _showPassword = true;

  ApiController controller = Get.find<ApiController>();
  @override
  Widget build(BuildContext context) {
    // _emailController.text = "anjana";
    // controller.user.email == null
    //     ? ""
    //     : controller.user.email!;
    // _usernameController.text = "anjana";
    // controller.user.username == null
    //     ? ""
    //     : controller.user.username!;
    _passwordController.text = "******";
    // _mobileNumberController.text = "anjana";
    // controller.user.number == null
    //     ? ""
    //     : controller.user.number!;
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
        body: Obx(() {
          // return controller.isProfileLoading.value == true ?
          // print(controller.isProfileLoading.value);
          if (controller.isProfileLoading.value == true) {
            return Center(
              child: Column(
                children: [
                  AppLabel(
                    text: "Loading",
                    fontSize: 20,
                  ),
                ],
              ),
            );
          } else {
            return SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          AppHeading(text: 'Profile', fontSize: 20),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          AppLabel(
                            text: "Username",
                            fontSize: 14,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            // controller: controller,
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                                color: AppColors.appColorBlack, fontSize: 14),

                            // obscureText: isObscure!,
                            enabled: false,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: AppColors.appColorGray02,
                                // hintStyle: TextStyle(color: hintColor, fontSize: 14),
                                hintText: controller.user.username,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide.none,
                                )),
                            // validator: validator
                          ),
                          // AppInputField(
                          //   formKey: _usernameKey,
                          //   controller: _usernameController,
                          //   inputType: TextInputType.text,
                          //   isEnable: false,
                          //   validator: MultiValidator([
                          //     RequiredValidator(errorText: "Username is Required"),
                          //   ]),
                          //   hintText: "Enter your Username",
                          // ),

                          const SizedBox(
                            height: 20,
                          ),
                          AppLabel(
                            text: "Email",
                            fontSize: 14,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          // AppInputField(
                          //   formKey: _emailKey,
                          //   controller: _emailController,
                          //   inputType: TextInputType.text,
                          //   validator: MultiValidator([
                          //     RequiredValidator(errorText: "Email is Required"),
                          //     EmailValidator(errorText: "Enter valid email")
                          //   ]),
                          //   hintText: "Enter your Email",
                          // ),
                          TextFormField(
                            // controller: controller,
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                                color: AppColors.appColorBlack, fontSize: 14),

                            // obscureText: isObscure!,
                            enabled: false,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: AppColors.appColorGray02,
                                // hintStyle: TextStyle(color: hintColor, fontSize: 14),
                                hintText: controller.user.email,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide.none,
                                )),
                            // validator: validator
                          ),

                          const SizedBox(
                            height: 20,
                          ),
                          AppLabel(
                            text: "Mobile Number",
                            fontSize: 14,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          // AppInputField(
                          //   formKey: _mobileNumberKey,
                          //   controller: _mobileNumberController,
                          //   inputType: TextInputType.text,
                          //   validator: MultiValidator([
                          //     RequiredValidator(errorText: "Mobile Number is Required"),
                          //   ]),
                          //   hintText: "Enter your Mobile Number",
                          // ),
                          TextFormField(
                            // controller: controller,
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                                color: AppColors.appColorBlack, fontSize: 14),

                            // obscureText: isObscure!,
                            enabled: false,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: AppColors.appColorGray02,
                                // hintStyle: TextStyle(color: hintColor, fontSize: 14),
                                hintText: controller.user.number,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide.none,
                                )),
                            // validator: validator
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          AppLabel(text: "Password", fontSize: 14),
                          const SizedBox(
                            height: 10,
                          ),
                          Form(
                            key: _passwordKey,
                            child: TextFormField(
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: AppColors.appColorGray02,
                                hintStyle: const TextStyle(
                                    color: AppColors.appColorGray01,
                                    fontSize: 14),
                                hintText: "Enter your Password",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide.none,
                                ),
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _showPassword = !_showPassword;
                                    });
                                  },
                                  child: Icon(
                                    _showPassword
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: AppColors.appColorGray01,
                                  ),
                                ),
                              ),
                              obscureText: _showPassword,
                              controller: _passwordController,
                              validator: MultiValidator([
                                RequiredValidator(
                                    errorText: "Password is Required"),
                              ]),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),

                          Container(
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width,
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                      foregroundColor: MaterialStateProperty.all<Color>(
                                          AppColors.appColorWhite),
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              AppColors.appColorprimary),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(6.0),
                                              side: const BorderSide(
                                                  color: AppColors
                                                      .appColorFacebookBlue)))),
                                  onPressed: () {
                                    controller.deleteProfile();
                                  },
                                  child: const Text('Delete',
                                      //   getTranslated(context, 'Sign_In')!,
                                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)))),
                        ],
                      ),
                    ),
                  ]),
            );
          }
        }));
  }
}
