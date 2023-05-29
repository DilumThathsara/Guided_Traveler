import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:guided_traveler/components/custom_Button.dart';
import 'package:guided_traveler/components/custom_Text.dart';
import 'package:guided_traveler/components/customText_Field.dart';
import 'package:guided_traveler/providers/login_provider.dart';
import 'package:guided_traveler/providers/signup_provider.dart';
import 'package:guided_traveler/utils/assets_Constants.dart';
import 'package:guided_traveler/utils/util_Functions.dart';
import 'package:provider/provider.dart';

class forgotPassword extends StatefulWidget {
  const forgotPassword({super.key});

  @override
  State<forgotPassword> createState() => _forgotPasswordState();
}

class _forgotPasswordState extends State<forgotPassword> {
  //final _email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final Size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 229, 229, 229),
      body: Container(
        width: Size.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 56,
                ),
                Align(
                    alignment: Alignment.bottomLeft,
                    child: IconButton(
                        onPressed: () {
                          utillFunction.goBack(context);
                        },
                        icon: const Icon(
                          Icons.keyboard_arrow_left,
                          size: 30,
                        ))),
                const SizedBox(
                  height: 25,
                ),
                const CustomText(
                  'Forgot Password',
                  fontSize: 25,
                ),
                const SizedBox(
                  height: 11,
                ),
                Image.asset(
                  AssetConstants.logoPath,
                  width: 250,
                  height: 170,
                ),
                const SizedBox(
                  height: 70,
                ),
                const CustomText(
                  'Please,enter your email address.You will receive a link to create a new password via email.',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomTextField(
                    labelText: 'Email',
                    controller: Provider.of<LoginProvider>(context).resetEmail,
                    hintText: 'Email'),
                const SizedBox(
                  height: 4,
                ),
                const SizedBox(
                  height: 53,
                ),
                Consumer<LoginProvider>(
                  builder: (context, value, child) {
                    return customButton(
                        isLoading: value.isLoading,
                        onTap: () {
                          value.startSendPasswordResetEmail(context);
                        },
                        text: 'Send');
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
