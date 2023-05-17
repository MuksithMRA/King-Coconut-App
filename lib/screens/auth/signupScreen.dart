import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:kingcoconut/constants/app_colors.dart';
import 'package:kingcoconut/constants/routes.dart';
import 'package:kingcoconut/controllers/controller.dart';
import 'package:kingcoconut/localization/language_constants.dart';
import 'package:kingcoconut/widgets/atoms/app_heading.dart';
import 'package:kingcoconut/widgets/atoms/app_label.dart';
import 'package:kingcoconut/widgets/molecules/buttons/filled_button.dart';
import 'package:kingcoconut/widgets/molecules/buttons/ghost_button.dart';
import 'package:kingcoconut/widgets/molecules/input_fields/app_input_field.dart';

class SignupScreen extends StatefulWidget {
  SignupScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final GlobalKey<FormState> _emailKey = GlobalKey<FormState>();

  final GlobalKey<FormState> _usernameKey = GlobalKey<FormState>();

  final GlobalKey<FormState> _passwordKey = GlobalKey<FormState>();

  final GlobalKey<FormState> _confirmPasswordKey = GlobalKey<FormState>();

  final GlobalKey<FormState> _mobileNumberKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _usernameController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();

  bool _showPassword = true;
  bool _showPassword01 = true;
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
        title: Image.asset(
          "assets/images/kingcoco.png",
          width: 250,
          height: 85,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(
            height: 10,
          ),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppHeading(text: 'Sign Up', fontSize: 20),
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
                AppInputField(
                  formKey: _usernameKey,
                  controller: _usernameController,
                  inputType: TextInputType.text,
                  validator: MultiValidator([
                    RequiredValidator(errorText: "Username is Required"),
                  ]),
                  hintText: "Enter your Username",
                ),

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
                AppInputField(
                  formKey: _emailKey,
                  controller: _emailController,
                  inputType: TextInputType.text,
                  validator: MultiValidator([
                    RequiredValidator(errorText: "Email is Required"),
                    EmailValidator(errorText: "Enter valid email")
                  ]),
                  hintText: "Enter your Email",
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
                //
                //
                //   ]),
                //   hintText: "Enter your Mobile Number",
                // ),

                Form(
                  key: _mobileNumberKey,
                  child: IntlPhoneField(
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: AppColors.appColorGray02,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide.none)),
                    style: const TextStyle(
                        color: AppColors.appColorBlack, fontSize: 14),
                    initialCountryCode: 'LK',
                    showDropdownIcon: false,
                    dropdownIconPosition: IconPosition.trailing,
                    onChanged: (phonevalue) {
                      _mobileNumberController.text = phonevalue.number;
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
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
                          color: AppColors.appColorGray01, fontSize: 14),
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
                      RequiredValidator(errorText: "Password is Required"),
                    ]),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                AppLabel(
                  text: "Confirm password",
                  fontSize: 14,
                ),
                const SizedBox(
                  height: 10,
                ),
                Form(
                  key: _confirmPasswordKey,
                  child: TextFormField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.appColorGray02,
                      hintStyle: const TextStyle(
                          color: AppColors.appColorGray01, fontSize: 14),
                      hintText: "Enter your Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _showPassword01 = !_showPassword01;
                          });
                        },
                        child: Icon(
                          _showPassword01
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: AppColors.appColorGray01,
                        ),
                      ),
                    ),
                    obscureText: _showPassword01,
                    controller: _confirmPasswordController,
                    validator: MultiValidator([
                      RequiredValidator(errorText: "Password is Required"),
                    ]),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),

                Container(
                    alignment: Alignment.center,
                    child: FilledCustomButton(
                        text: 'Sing Up',
                        bgColor: AppColors.appColorprimary,
                        clickEvent: () {
                          if (_isValidate()) {
                            controller.userSignup(
                                _usernameController.text.trim(),
                                _emailController.text.trim(),
                                _mobileNumberController.text.trim(),
                                _passwordController.text.trim());
                          }
                        })),
                // Container(
                //     alignment: Alignment.center,
                //     child: ElevatedButton(
                //         style: ButtonStyle(
                //             foregroundColor: MaterialStateProperty.all<Color>(
                //                 AppColors.appColorWhite),
                //             backgroundColor: MaterialStateProperty.all<Color>(
                //                 AppColors.appColorprimary),
                //             shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                //                 RoundedRectangleBorder(
                //                     borderRadius: BorderRadius.circular(6.0),
                //                     side: const BorderSide(
                //                         color: AppColors
                //                             .appColorFacebookBlue)))),
                //         onPressed: () {
                //           if (_isValidate()) {
                //             controller.userSignup(_usernameController.text.trim(), _emailController.text.trim(), _mobileNumberController.text.trim(), _passwordController.text.trim());
                //           }
                //         },
                //         child: Text(
                //             'Sign up',
                //             style:
                //             const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)))),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppLabel(
                      text: "Already  have an account? ",
                      fontSize: 14,
                      textColor: AppColors.appColorGray,
                    ),
                    GhostButton(
                      text: "Log In",
                      clickEvent: () {
                        Get.toNamed(Routes.LOGIN);
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }

  String? validateMobile(String value) {
// Indian Mobile number are of 10 digit only
    if (value.length != 10)
      return 'Mobile Number must be of 10 digit';
    else
      return null;
  }

  bool _isValidate() {
    if (!_emailKey.currentState!.validate()) {
      return false;
    } else if (!_passwordKey.currentState!.validate()) {
      return false;
    } else if (!_confirmPasswordKey.currentState!.validate()) {
      return false;
    } else if (!_mobileNumberKey.currentState!.validate()) {
      return false;
    } else {
      return true;
    }
  }
}
