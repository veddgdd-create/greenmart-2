import 'package:flutter/material.dart';
import 'package:greenmart/core/styles/app_colors.dart';
import 'package:greenmart/core/widgets/custom_text_field.dart';
import 'package:greenmart/core/widgets/main_button.dart';
import 'package:greenmart/features/auth/page/verfiy_code.dart';

class PhoneNumberAuth extends StatelessWidget {
  const PhoneNumberAuth({super.key});

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios, color: AppColors.blackColor),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 40,
            bottom: 40,
          ),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Enter your mobile number',
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.w800),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'We need to verify you. We will send you a one time verification code. ',
                    style: TextStyle(fontSize: 16, color: AppColors.greyColor),
                  ),
                  SizedBox(height: 40),
                  CustomTextField(
                    suffixIcon: Icon(
                      Icons.phone,
                      color: AppColors.primaryColor,
                    ),
                    hint: '01XXXXXXXXX',
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your phone number';
                      }
                      if (value.length != 11) {
                        return 'Phone number must be 11 digits';
                      }
                      if (!value.startsWith('01')) {
                        return 'Phone number must start with 01';
                      }
                      if (!['0', '1', '2', '5'].contains(value[2])) {
                        return 'Invalid third digit';
                      }
                      if (!RegExp(r'^\d+$').hasMatch(value)) {
                        return 'Phone number must contain only digits';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 50),
                  MainButton(
                    text: 'Next',
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => VerfiyCode()),
                        );
                      }
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30, left: 50),
                    child: Text(
                      'Resend confirmation code (1:23)',
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.greyColor,
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
