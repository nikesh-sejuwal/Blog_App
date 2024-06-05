import 'package:flutter/material.dart';

import 'lower_first.dart';
import 'upper_first.dart';

class First_Page extends StatelessWidget {
  const First_Page({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          UpperFirst(),
          SizedBox(height: 15),
          LowerFirst(),
        ],
      ),
    );
  }
}
