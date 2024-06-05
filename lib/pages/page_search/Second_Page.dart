import 'package:blog_project/pages/page_search/Upper_Search.dart';
import 'package:flutter/material.dart';

class Second_Page extends StatelessWidget {
  const Second_Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UpperSearch(),
      ],
    );
  }
}
