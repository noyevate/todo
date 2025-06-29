import 'package:flutter/material.dart';
import 'package:todo/core/utils/reusable_text.dart';

import '../../../../core/utils/colors.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: ReuseableText(
                        title: "Home",
                        style: TextStyle(
                          fontSize: 13,
                          color: AppColors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
      ),
    );
  }
}