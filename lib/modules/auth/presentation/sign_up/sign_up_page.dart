import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:provider/provider.dart';
import 'package:test_mdc/core/app_colors.dart';
import 'package:test_mdc/core/app_text_style.dart';
import 'package:test_mdc/core/route_name.dart';
import 'package:test_mdc/modules/auth/presentation/sign_up/sign_up_vm.dart';
import 'package:test_mdc/widgets/app_button.dart';
import 'package:test_mdc/widgets/default_appbar.dart';

import '../widgets/app_text_field.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  final TextEditingController nameTEC = TextEditingController();
  final TextEditingController emailTEC = TextEditingController();
  final TextEditingController passwordTEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => Modular.get<SignUpVM>(),
      builder: (context, child) => GestureDetector(
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
                            _buildTextField(context),
                            SizedBox(height: 20),
                            _buildAgreeTerm(),
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
      ),
    );
  }

  Widget _buildTextField(BuildContext context) {
    final vm = Provider.of<SignUpVM>(context, listen: false);
    return Column(
      children: [
        AppTextField(
          title: 'Your Name',
          placeholder: 'Full Name',
          controller: nameTEC,
          isShowSuffix: false,
          onChanged: vm.onChangeFullName,
        ),
        SizedBox(height: 16),
        Selector<SignUpVM, bool>(
          selector: (_, vm) => vm.isValidEmail,
          builder: (context, value, child) => AppTextField(
            title: 'Email Address',
            placeholder: 'Email',
            controller: emailTEC,
            isShowSuffix: value,
            onChanged: vm.onChangeEmail,
          ),
        ),
        SizedBox(height: 16),
        Selector<SignUpVM, bool>(
          selector: (_, vm) => vm.showPassword,
          builder: (context, value, child) => AppTextField(
            title: 'Password',
            placeholder: '',
            controller: passwordTEC,
            isShowSuffix: true,
            isShowPassword: value,
            togglePassword: () {
              vm.togglePassword();
            },
            onChanged: vm.onChangePassword,
          ),
        ),
      ],
    );
  }

  Widget _buildAgreeTerm(){
    return Row(
      children: [
        Selector<SignUpVM,bool>(
          selector: (p0, vm) => vm.isAgreeTerm,
          builder:(context, value, child) =>  InkWell(
            onTap: (){
              Provider.of<SignUpVM>(context,listen: false).toggleAgreeTerm();
            },
            child: Icon(
              Icons.check_circle,
              color: value ? Colors.green : AppColors.subtitle,
              size: 20,
            ),
          ),
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
    );
  }
}
