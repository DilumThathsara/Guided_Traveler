import 'package:flutter/material.dart';
import 'package:guided_traveler/components/customText_Field_Pass.dart';
import 'package:guided_traveler/components/custom_Button.dart';
import 'package:guided_traveler/components/custom_Text.dart';
import 'package:guided_traveler/components/customText_Field.dart';
import 'package:guided_traveler/providers/auth/login_provider.dart';
import 'package:guided_traveler/screens/auth/forgot_Password.dart';
import 'package:guided_traveler/utils/assets_Constants.dart';
import 'package:guided_traveler/utils/util_Functions.dart';
import 'package:provider/provider.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  // final _email = TextEditingController();
  // final _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final Size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 229, 229, 229),
      body: SafeArea(
        child: Container(
          width: Size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 80),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Image.asset(
                              AssetConstants.logoPath,
                              width: 140,
                              height: 200,
                            ),
                            CustomText('Time to \ntravel.'),
                          ],
                        ),
                        Image.asset(
                          AssetConstants.loginPath,
                          width: 300,
                        ),
                      ]),
                  const SizedBox(
                    height: 50,
                  ),
                  CustomTextField(
                    controller:
                        Provider.of<LoginProvider>(context).emailController,
                    hintText: 'Email',
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomTextFieldPass(
                    controller:
                        Provider.of<LoginProvider>(context).passwordController,
                    iconOne: Icons.visibility_off,
                    iconTwo: Icons.visibility,
                    isObsecure: true,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () {
                        utillFunction.navigateTo(
                            context, const forgotPassword());
                      },
                      child: const CustomText(
                        'Forgot your password?',
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Consumer<LoginProvider>(
                    builder: (context, value, child) {
                      return customButton(
                          isLoading: value.isLoading,
                          onTap: () {
                            value.startSignin(context);
                          },
                          text: 'LogIn');
                    },
                  ),
                  const SizedBox(
                    height: 23,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
