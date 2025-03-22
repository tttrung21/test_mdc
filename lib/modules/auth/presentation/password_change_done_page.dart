import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:test_mdc/core/app_colors.dart';
import 'package:test_mdc/core/app_text_style.dart';
import 'package:test_mdc/widgets/appbar_no_background.dart';

class PasswordChangeDonePage extends StatelessWidget {
  const PasswordChangeDonePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(height: 30,),
              AppbarNoBackground(
                closeTap: () => Modular.to.popUntil(
                  (p0) => p0.isFirst,
                ),
              ),
            ],
          ),
          Center(child: _buildBody())
        ],
      ),
    );
  }

  Widget _buildBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.check_circle,
          color: AppColors.primaryColor,
          size: 84,
        ),
        SizedBox(
          height: 32,
        ),
        Text(
          'Your password was \nsuccessfully changed',
          style: AppTextStyle.header.copyWith(fontSize: 20),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 16,
        ),
        Text(
          'Please close this window and \nlogin again',
          style: AppTextStyle.subheader.copyWith(color: AppColors.subtitle),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 32,
        ),
      ],
    );
  }
}
