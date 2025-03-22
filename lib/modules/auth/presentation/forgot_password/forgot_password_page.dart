import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:provider/provider.dart';
import 'package:test_mdc/core/app_colors.dart';
import 'package:test_mdc/core/app_text_style.dart';
import 'package:test_mdc/core/route_name.dart';
import 'package:test_mdc/modules/auth/presentation/forgot_password/forgot_password_vm.dart';
import 'package:test_mdc/modules/auth/presentation/widgets/forgot_password_option.dart';
import 'package:test_mdc/widgets/app_button.dart';
import 'package:test_mdc/widgets/default_appbar.dart';

import '../widgets/app_text_field.dart';

class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordPage({super.key});

  final TextEditingController emailTEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Modular.get<ForgotPasswordVM>(),
      builder: (context, child) => GestureDetector(
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
                    children: [
                      Container(color: AppColors.appbarBgColor),
                      _buildBody(context),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(32),
                child: Selector<ForgotPasswordVM,int>(
                  selector: (_, vm) => vm.bodyIndex,
                  builder:(context, value, child) =>  AppButton(
                      buttonText: value == 1 ? 'Send Link Recovery' : 'Select Option',
                      onPress: () {
                        final isRecoveryPage = value == 1;
                        if (!isRecoveryPage) {
                          Modular.to.pushNamed(RouteName.phoneVerify,arguments: emailTEC.text);
                        }
                        if (emailTEC.text != '') {
                          Provider.of<ForgotPasswordVM>(context, listen: false).changeBodyIndex();
                        }
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Selector<ForgotPasswordVM, int>(
      selector: (_, vm) => vm.bodyIndex,
      builder: (context, value, child) => Container(
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 24),
        decoration: BoxDecoration(
          color: AppColors.bgColor,
        ),
        child: value == 1 ? _buildRecoveryEmail(context) : _buildSelectOption(context),
      ),
    );
  }

  Widget _buildRecoveryEmail(BuildContext context) {
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
        Selector<ForgotPasswordVM, bool>(
          selector: (_, vm) => vm.isValidEmail,
          builder: (context, value, child) => AppTextField(
            title: 'Email Address',
            placeholder: 'Email',
            controller: emailTEC,
            isShowSuffix: value,
            onChanged: Provider.of<ForgotPasswordVM>(context, listen: false).onChangeEmail,
          ),
        ),
      ],
    );
  }

  Widget _buildSelectOption(BuildContext context) {
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
        Selector<ForgotPasswordVM, int>(
          selector: (_, vm) => vm.resetOption,
          builder: (context, value, child) => ForgotPasswordOption(
            title: 'Reset via email',
            subtitle: 'If you have email linked to account',
            isSelected: value == 1,
            icon: Icons.email_outlined,
            onTap: () => Provider.of<ForgotPasswordVM>(context, listen: false).changeResetOption(1),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Selector<ForgotPasswordVM, int>(
          selector: (_, vm) => vm.resetOption,
          builder: (context, value, child) => ForgotPasswordOption(
            title: 'Reset via SMS',
            subtitle: 'If you have number linked to account',
            isSelected: value == 2,
            icon: Icons.phone_android_outlined,
            onTap: () => Provider.of<ForgotPasswordVM>(context, listen: false).changeResetOption(2),
          ),
        ),
      ],
    );
  }
}
