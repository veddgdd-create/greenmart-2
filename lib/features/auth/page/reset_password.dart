import 'package:flutter/material.dart';
import 'package:greenmart/core/constants/app_assets.dart';
import 'package:greenmart/core/styles/app_colors.dart';
import 'package:greenmart/core/styles/text_styles.dart';
import 'package:greenmart/core/widgets/custom_svg_picture.dart';
import 'package:greenmart/core/widgets/custom_text_field.dart';
import 'package:greenmart/core/widgets/main_button.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: CustomSvgPicture(path: AppAssets.carrotSvg),
                  ),
                  SizedBox(height: 40),
                  Text('Reset Password', style: TextStyles.title),
                  SizedBox(height: 16),
                  Text(
                    'Enter your email to reset your password',
                    style: TextStyles.body.copyWith(color: AppColors.greyColor),
                  ),
                  SizedBox(height: 40),
                  Text(
                    'Email',
                    style: TextStyles.button.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.greyColor,
                    ),
                  ),
                  SizedBox(height: 8),
                  CustomTextField(
                    hint: 'example@gmail.com',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email';
                      } else if (!value.contains('@')) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  MainButton(
                    text: 'Reset Password',
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        // Handle reset password logic here
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Password reset email sent!')),
                        );
                      }
                    },
                  ),
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.center,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Back to Login',
                        style: TextStyles.button.copyWith(
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
