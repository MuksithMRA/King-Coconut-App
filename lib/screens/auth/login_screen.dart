import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:kingcoconut/constants/app_colors.dart';
import 'package:kingcoconut/constants/routes.dart';
import 'package:kingcoconut/controllers/controller.dart';
import 'package:kingcoconut/widgets/atoms/app_heading.dart';
import 'package:kingcoconut/widgets/atoms/app_label.dart';
import 'package:kingcoconut/widgets/molecules/buttons/filled_button.dart';
import 'package:kingcoconut/widgets/molecules/buttons/ghost_button.dart';
import 'package:kingcoconut/widgets/molecules/input_fields/app_input_field.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _emailKey = GlobalKey<FormState>();

  final GlobalKey<FormState> _passwordKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  bool _showPassword = true;
  ApiController controller = Get.put(ApiController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: false,
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
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(
              height: 40,
            ),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AppHeading(text: 'Login', fontSize: 20),
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
                    height: 10,
                  ),
                  AppLabel(
                    text: "Username",
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
                      RequiredValidator(errorText: "Username is Required"),
                    ]),
                    hintText: "Enter your Username",
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
                            color: AppColors.appColorGray,
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
                    height: 10,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                      alignment: Alignment.center,
                      child: FilledCustomButton(
                          text: 'Log In',
                          bgColor: AppColors.appColorprimary,
                          clickEvent: () {
                            if (_isValidate()) {
                              controller.userlogin(_emailController.text.trim(),
                                  _passwordController.text.trim());
                            }
                          })),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppLabel(
                        text: "Don’t have an account? ",
                        fontSize: 14,
                        textColor: AppColors.appColorGray,
                      ),
                      GhostButton(
                        text: "Sign Up",
                        clickEvent: () {
                          Get.toNamed(Routes.SIGNUP);
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ]),
        ));
  }

  bool _isValidate() {
    if (!_emailKey.currentState!.validate()) {
      return false;
    } else if (!_passwordKey.currentState!.validate()) {
      return false;
    } else {
      return true;
    }
  }
}
