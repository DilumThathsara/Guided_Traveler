// import 'package:flutter/material.dart';
// import 'package:guided_traveler/components/custom_Text.dart';
// import 'package:guided_traveler/screens/main/home/widgets/menu_Grid.dart';
// import 'package:guided_traveler/utils/app_Colors.dart';

// class homeScreen extends StatefulWidget {
//   const homeScreen({super.key});

//   @override
//   State<homeScreen> createState() => _homeScreenState();
// }

// class _homeScreenState extends State<homeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return SafeArea(
//       child: Scaffold(
//         // appBar: AppBar(
//         //     backgroundColor: AppColors.primaryColor,
//         //     title: const CustomText(
//         //       'Menu',
//         //       fontSize: 24,
//         //       color: Colors.white,
//         //     ),
//         //     elevation: 10.0,
//         //     leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu))),
//         body: Container(
//           width: size.width,
//           height: size.height,
//           padding: const EdgeInsets.symmetric(horizontal: 27),
//           child: Column(
//             children: [
//               menuGrid(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
