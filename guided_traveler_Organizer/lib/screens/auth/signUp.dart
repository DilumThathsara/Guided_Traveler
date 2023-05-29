import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:guided_traveler/components/custom_Button.dart';
import 'package:guided_traveler/components/custom_Text.dart';
import 'package:guided_traveler/components/customText_Field.dart';
import 'package:guided_traveler/controllers/auth_Controller.dart';
import 'package:guided_traveler/providers/signup_provider.dart';
import 'package:guided_traveler/screens/auth/logIn.dart';
import 'package:guided_traveler/utils/app_Colors.dart';
import 'package:guided_traveler/utils/assets_Constants.dart';
import 'package:guided_traveler/utils/util_Functions.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 229, 229, 229),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomText(
                'SignUp',
                color: AppColors.primaryColor,
              ),
              const SizedBox(
                height: 11,
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
                controller: Provider.of<SignupProvider>(context).nameController,
                hintText: 'Name',
                labelText: 'Name',
              ),
              const SizedBox(
                height: 8,
              ),
              CustomTextField(
                controller:
                    Provider.of<SignupProvider>(context).emailController,
                hintText: 'Email',
                labelText: 'Email',
              ),
              const SizedBox(
                height: 8,
              ),
              CustomTextField(
                controller:
                    Provider.of<SignupProvider>(context).passwordController,
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
                    utillFunction.navigateTo(context, const login());
                  },
                  child: const CustomText(
                    'Already have an account',
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 25),
              Consumer<SignupProvider>(
                builder: (context, value, child) {
                  return customButton(
                      isLoading: value.isLoading,
                      onTap: () {
                        value.startSignup(context);
                      },
                      text: 'SignUp');
                },
              )
            ],
          ),
        ),
      )),
    );
  }
}
