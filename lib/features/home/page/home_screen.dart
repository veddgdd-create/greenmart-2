import 'dart:math';

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(top: 700),
              child: NavigationBar(
                destinations: [
                  NavigationDestination(
                    icon: const Icon(Icons.shopping_bag_outlined),
                    label: 'Shop',
                  ),
                  NavigationDestination(
                    icon: const Icon(Icons.travel_explore_rounded),
                    label: 'Explore',
                  ),
                  NavigationDestination(
                    icon: const Icon(Icons.shopping_cart_outlined),
                    label: 'cart',
                  ),
                  NavigationDestination(
                    icon: const Icon(Icons.favorite_border_outlined),
                    label: 'Favorite',
                  ),
                  NavigationDestination(
                    icon: const Icon(Icons.account_circle_outlined),
                    label: 'Account',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
