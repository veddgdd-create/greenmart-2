import 'package:flutter/material.dart';
import 'package:greenmart/core/styles/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_none,
              color: AppColors.greyColor,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: [const SizedBox(height: 10)]),
      ),
    );
  }
}
