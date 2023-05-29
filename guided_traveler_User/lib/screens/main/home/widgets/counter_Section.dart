import 'package:flutter/material.dart';
import 'package:guided_traveler/components/custom_Text.dart';

class counterSection extends StatelessWidget {
  const counterSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Icon(
          Icons.add,
          size: 18,
        ),
        SizedBox(
          width: 10,
        ),
        CustomText(
          "1",
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
        SizedBox(
          width: 10,
        ),
        Icon(
          Icons.remove,
          size: 18,
        )
      ],
    );
  }
}
