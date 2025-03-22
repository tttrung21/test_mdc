import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pinput/pinput.dart';
import 'package:test_mdc/core/app_colors.dart';
import 'package:test_mdc/core/app_text_style.dart';
import 'package:test_mdc/core/route_name.dart';
import 'package:test_mdc/widgets/default_appbar.dart';

class PhoneVerification extends StatelessWidget {
  PhoneVerification({super.key});

  final TextEditingController pinputTEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.bgColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DefaultAppbar(title: 'Phone Verification'),
            Expanded(
              child: SingleChildScrollView(
                child: Stack(
                  children: [Container(color: AppColors.appbarBgColor), _buildBody()],
                ),
              ),
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
        child: _buildInput());
  }

  Widget _buildInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Enter recovery code',
          style: AppTextStyle.header,
        ),
        SizedBox(height: 8),
        Text(
          'We have sent it on your email \nkadrun@gmail.com',
          style: AppTextStyle.subheader.copyWith(color: AppColors.subtitle),
        ),
        SizedBox(height: 24),
        _buildPinput(),
        SizedBox(
          height: 24,
        ),
        Text(
          'This code will expire in 5 minutes',
          style: AppTextStyle.title1.copyWith(color: AppColors.primaryColor),
        )
      ],
    );
  }

  Widget _buildPinput() {
    final defaultPinTheme = PinTheme(
      width: 54,
      height: 64,
      textStyle: const TextStyle(
        fontSize: 24,
        color: AppColors.primaryColor,
      ),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: AppColors.white),
    );
    return Row(
      children: [
        Expanded(
          child: Pinput(
            length: 4,
            defaultPinTheme: defaultPinTheme,
            controller: pinputTEC,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            onChanged: (value) async {
              // if (value.isNotEmpty) {
              //   final maskedValue = List.generate(value.length - 1, (_) => '•').join() + value[value.length - 1];
              //   pinputTEC.text = maskedValue;
              // }
              if (value.isEmpty) return;
              if (value.length == 4) {
                await Future.delayed(Duration(seconds: 1));
                Modular.to.pushNamed(RouteName.termService);
              }
            },
            separatorBuilder: (index) => SizedBox(
              width: 32,
            ),
          ),
        ),
      ],
    );
  }
}
