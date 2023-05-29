import 'package:flutter/material.dart';
import 'package:guided_traveler/components/custom_Button.dart';
import 'package:guided_traveler/components/custom_Text.dart';
import 'package:guided_traveler/components/customText_Field.dart';
import 'package:guided_traveler/providers/login_provider.dart';
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
  @override
  Widget build(BuildContext context) {
    final Size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 229, 229, 229),
      body: SafeArea(
        child: Container(
          width: Size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 96,
                  ),
                  const CustomText(
                    "Login",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Image.asset(
                    AssetConstants.logoPath,
                    width: 250,
                    height: 190,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    controller:
                        Provider.of<LoginProvider>(context).emailController,
                    hintText: 'Email',
                    labelText: 'Email',
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomTextField(
                    controller:
                        Provider.of<LoginProvider>(context).passwordController,
                    hintText: 'Password',
                    labelText: 'Password',
                    isObscure: true,
                  ),
                  const SizedBox(
                    height: 16,
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
                    height: 29,
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
                  const CustomText(
                    'Or login with social account',
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          width: 92,
                          height: 64,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(24)),
                          child: Image.asset(AssetConstants.googlePath)),
                      const SizedBox(
                        width: 16,
                      ),
                      Container(
                          width: 92,
                          height: 64,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(24)),
                          child: Image.asset(AssetConstants.faceBookPath)),
                    ],
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
