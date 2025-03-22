import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:provider/provider.dart';
import 'package:test_mdc/core/app_colors.dart';
import 'package:test_mdc/core/app_text_style.dart';
import 'package:test_mdc/core/route_name.dart';
import 'package:test_mdc/modules/auth/presentation/sign_in/sign_in_vm.dart';
import 'package:test_mdc/modules/auth/presentation/widgets/app_text_field.dart';
import 'package:test_mdc/modules/auth/presentation/widgets/sign_in_option.dart';
import 'package:test_mdc/widgets/app_button.dart';
import 'package:test_mdc/widgets/default_appbar.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});

  final TextEditingController emailTEC = TextEditingController();
  final TextEditingController passwordTEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Modular.get<SignInVM>(),
      builder: (context, child) => GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          backgroundColor: AppColors.bgColor,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DefaultAppbar(title: 'Sign in'),
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
                              'Welcome back!',
                              style: AppTextStyle.header,
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Hello there, login to continue',
                              style: AppTextStyle.subheader.copyWith(color: AppColors.subtitle),
                            ),
                            SizedBox(height: 16),
                            _buildSignInOption(),
                            SizedBox(height: 16),
                            Center(
                                child: Text(
                              'or sign with',
                              style: AppTextStyle.title1.copyWith(color: AppColors.subtitle),
                            )),
                            SizedBox(height: 16),
                            _buildTextField(context),
                            SizedBox(height: 16),
                            Align(
                              alignment: Alignment.centerRight,
                              child: InkWell(
                                onTap: () {
                                  Modular.to.pushNamed(RouteName.forgotPassword);
                                },
                                child: Text(
                                  'Forgot password?',
                                  style: AppTextStyle.title1.copyWith(color: AppColors.primaryColor),
                                ),
                              ),
                            ),
                            SizedBox(height: 32),
                            AppButton(buttonText: 'Login Account', onPress: () {}),
                            SizedBox(height: 32),
                            Row(
                              children: [
                                Text('Don’t have an Account? ',
                                    style: AppTextStyle.title1.copyWith(color: AppColors.subtitle)),
                                InkWell(
                                  onTap: () {
                                    Modular.to.pushReplacementNamed(RouteName.signUp);
                                  },
                                  child: Text('Sign up',
                                      style: AppTextStyle.button.copyWith(color: AppColors.primaryColor)),
                                ),
                              ],
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
  Widget _buildSignInOption(){
    return Row(
      children: [
        Expanded(
          child: SignInOption(
            image: 'assets/google.png',
            title: 'Google',
            onPress: () {},
            textColor: AppColors.subtitle,
            bgColor: Colors.white,
            hasShadow: true,
          ),
        ),
        SizedBox(width: 8),
        Expanded(
          child: SignInOption(
            image: 'assets/facebook.png',
            title: 'Facebook',
            onPress: () {},
            textColor: AppColors.white,
            imageColor: AppColors.white,
            bgColor: AppColors.blue1,
            hasShadow: false,
          ),
        ),
      ],
    );
  }

  Widget _buildTextField(BuildContext context){
    final vm = Provider.of<SignInVM>(context,listen: false);
    return Column(
      children: [
        Selector<SignInVM, bool>(
          selector: (_, vm) => vm.isValidEmail,
          builder: (context, value, child) =>  AppTextField(
              title: 'Email Address',
              placeholder: 'Email',
              controller: emailTEC,
              isShowSuffix: value,
              onChanged: vm.onChangeEmail,
          ),
        ),
        SizedBox(height: 16),
        Selector<SignInVM, bool>(
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
}
