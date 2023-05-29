import 'package:flutter/material.dart';
import 'package:guided_traveler/utils/app_Colors.dart';

class CustomTextFieldPass extends StatefulWidget {
  const CustomTextFieldPass({
    required this.controller,
    this.isObsecure = false,
    this.keyboardType,
    this.iconOne,
    this.iconTwo,
    Key? key,
  }) : super(key: key);

  final TextEditingController controller;
  final TextInputType? keyboardType;
  final bool isObsecure;
  final IconData? iconOne;
  final IconData? iconTwo;

  @override
  State<CustomTextFieldPass> createState() => _CustomTextFieldPassState();
}

class _CustomTextFieldPassState extends State<CustomTextFieldPass> {
  bool _pwVisible = false;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: !_pwVisible,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                _pwVisible = !_pwVisible;
              });
            },
            icon: _pwVisible ? Icon(widget.iconOne) : Icon(widget.iconTwo)),
        filled: true,
        fillColor: AppColors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(color: Colors.red)),
      ),
    );
  }
}
