import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:test_mdc/core/app_colors.dart';
import 'package:test_mdc/core/app_text_style.dart';
import 'package:test_mdc/core/route_name.dart';
import 'package:test_mdc/modules/auth/presentation/widgets/forgot_password_option.dart';
import 'package:test_mdc/widgets/app_button.dart';
import 'package:test_mdc/widgets/default_appbar.dart';

import 'widgets/app_text_field.dart';

class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordPage({super.key});

  final TextEditingController emailTEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.bgColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DefaultAppbar(
              title: 'Forgot Password',
              backTap: Modular.to.pop,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Stack(
                  children: [Container(color: AppColors.appbarBgColor), _buildBody()],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(32),
              child: AppButton(
                  buttonText: 'Send Link Recovery',
                  onPress: () {
                    Modular.to.pushNamed(RouteName.phoneVerify);
                  }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 24),
        decoration: BoxDecoration(
          color: AppColors.bgColor,
        ),
        child: _buildSelectOption());
  }

  Widget _buildRecoveryEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Password Recovery',
          style: AppTextStyle.header,
        ),
        SizedBox(height: 8),
        Text(
          'We will send password recovery \ncode on this email',
          style: AppTextStyle.subheader.copyWith(color: AppColors.subtitle),
        ),
        SizedBox(height: 40),
        AppTextField(title: 'Email Address', placeholder: 'Email', controller: emailTEC, isShowSuffix: false),
      ],
    );
  }

  Widget _buildSelectOption() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Forgot Password',
          style: AppTextStyle.header,
        ),
        SizedBox(height: 8),
        Text(
          'Please select option to send link \nreset password',
          style: AppTextStyle.subheader.copyWith(color: AppColors.subtitle),
        ),
        SizedBox(height: 24),
        ForgotPasswordOption(
          title: 'Reset via email',
          subtitle: 'If you have email linked to account',
          isSelected: true,
          icon: Icons.email_outlined,
        ),
        SizedBox(
          height: 20,
        ),
        ForgotPasswordOption(
          title: 'Reset via SMS',
          subtitle: 'If you have number linked to account',
          isSelected: false,
          icon: Icons.phone_android_outlined,
        ),
      ],
    );
  }
}
