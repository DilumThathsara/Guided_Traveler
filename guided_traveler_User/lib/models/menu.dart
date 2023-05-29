import 'package:flutter/cupertino.dart';

class Menu {
  Menu({
    required this.id,
    required this.categoryNmae,
    required this.categoryLogo,
    required this.widget,
  });

  final int id;
  final String categoryNmae;
  final String categoryLogo;
  final Widget widget;
}
