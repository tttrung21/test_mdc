import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:test_mdc/core/app_colors.dart';
import 'package:test_mdc/core/app_text_style.dart';
import 'package:test_mdc/core/route_name.dart';
import 'package:test_mdc/modules/auth/presentation/widgets/app_text_field.dart';
import 'package:test_mdc/widgets/app_button.dart';
import 'package:test_mdc/widgets/appbar_no_background.dart';

class NewPasswordPage extends StatelessWidget {
  NewPasswordPage({super.key});

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
            SizedBox(
              height: 30,
            ),
            AppbarNoBackground(
              title: 'New Password',
              backTap: Modular.to.pop,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: _buildBody(),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.transparent,
          padding: EdgeInsets.only(bottom: 24, right: 24, left: 24),
          child: AppButton(
              buttonText: 'I Agree Term and Condition',
              onPress: () {
                if (passwordTEC.text.isNotEmpty) {
                  passwordTEC.clear();
                  Modular.to.pushNamed(RouteName.pwChangeDone);
                }
              }),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 24),
          color: AppColors.bgColor,
          child: SingleChildScrollView(
            child: _buildInput(),
          ),
        ),
      ],
    );
  }

  Widget _buildInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Create a new password',
          style: AppTextStyle.header,
        ),
        SizedBox(height: 16),
        Text(
          'Create strong and secure password that protect your account',
          style: AppTextStyle.subheader.copyWith(color: AppColors.subtitle),
        ),
        SizedBox(height: 16),
        AppTextField(title: 'Password', placeholder: '', controller: passwordTEC, isShowSuffix: false, onChanged: (value ) {  },),
        SizedBox(height: 40),
        Row(
          children: [
            Icon(
              Icons.check_circle,
              color: Colors.green,
            ),
            SizedBox(
              width: 16,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  'At least 8 symbols',
                  style: AppTextStyle.title2.copyWith(color: AppColors.subtitle),
                  softWrap: true,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 16),
        Row(
          children: [
            Icon(
              Icons.check_circle,
              color: Colors.green,
            ),
            SizedBox(
              width: 16,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  'Contain at least one number',
                  style: AppTextStyle.title2.copyWith(color: AppColors.subtitle),
                  softWrap: true,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
