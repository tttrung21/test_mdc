import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:test_mdc/core/app_colors.dart';
import 'package:test_mdc/core/app_text_style.dart';
import 'package:test_mdc/core/route_name.dart';
import 'package:test_mdc/widgets/app_button.dart';
import 'package:test_mdc/widgets/default_appbar.dart';

import 'widgets/app_text_field.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  final TextEditingController nameTEC = TextEditingController();
  final TextEditingController emailTEC = TextEditingController();
  final TextEditingController passwordTEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.bgColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DefaultAppbar(title: 'Register Account'),
            Expanded(
              child: SingleChildScrollView(
                child: Stack(
                  children: [
                    Container(color: AppColors.appbarBgColor),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topRight: Radius.circular(30)),
                        color: AppColors.bgColor,
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hello',
                            style: AppTextStyle.header,
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Create an account to continue',
                            style: AppTextStyle.subheader.copyWith(color: AppColors.subtitle),
                          ),
                          SizedBox(height: 16),
                          AppTextField(
                              title: 'Your Name', placeholder: 'Full Name', controller: nameTEC, isShowSuffix: false),
                          SizedBox(height: 16),
                          AppTextField(
                              title: 'Email Address',
                              placeholder: 'Your email address',
                              controller: emailTEC,
                              isShowSuffix: false),
                          SizedBox(height: 16),
                          AppTextField(
                            title: 'Password',
                            placeholder: '',
                            controller: passwordTEC,
                            isShowSuffix: true,
                            togglePassword: () {},
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              Icon(
                                Icons.check_circle,
                                color: Colors.green,
                                size: 20,
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text(
                                    'By Creating an account you agree to our Term of Service',
                                    style: AppTextStyle.title1.copyWith(color: AppColors.primaryColor),
                                    softWrap: true,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                          AppButton(buttonText: 'Create an Account', onPress: () {}),
                          SizedBox(height: 28),
                          Center(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('Already have an account? ',
                                    style: AppTextStyle.title1.copyWith(color: AppColors.subtitle)),
                                InkWell(
                                  onTap: () {
                                    Modular.to.pushReplacementNamed(RouteName.signIn);
                                  },
                                  child: Text('Sign in',
                                      style: AppTextStyle.button.copyWith(color: AppColors.primaryColor)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
