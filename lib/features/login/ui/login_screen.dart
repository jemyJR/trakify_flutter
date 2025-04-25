import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trakify/core/constants/assets.dart';
import 'package:trakify/core/helpers/spacing.dart';
import 'package:trakify/core/theming/app_colors.dart';
import 'package:trakify/core/theming/app_styles.dart';
import 'package:trakify/core/widgets/auth_message_and_navigate.dart';
import 'package:trakify/core/widgets/bg_shape.dart';
import 'package:trakify/core/widgets/custom_button.dart';
import 'package:trakify/core/widgets/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BgShape(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(Assets.imagesLogoFullLogo),
                  verticalSpace(20),
                  CustomTextField(
                    title: 'Email',
                    hintText: 'Enter your email',
                    iconData: Icons.email,
                  ),
                  verticalSpace(20),
                  CustomTextField(
                    title: 'Password',
                    hintText: 'Enter your password',
                    iconData: Icons.lock,
                    isPassword: true,
                  ),
                  verticalSpace(20),
                  CustomButton(
                    text: 'Login',
                    textStyle: AppStyles.font16w600White,
                    backgroundColor: AppColors.primary,
                    onPressed: () {},
                  ),

                  verticalSpace(10),
                  AuthMessageAndNavigate(
                    authMessageType: AuthMessageType.login,
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
