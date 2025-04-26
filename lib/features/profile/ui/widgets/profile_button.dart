import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trakify/core/helpers/extensions.dart';
import 'package:trakify/core/helpers/spacing.dart';
import 'package:trakify/core/routing/routes.dart';
import 'package:trakify/core/theming/app_colors.dart';
import 'package:trakify/core/theming/app_styles.dart';
import 'package:trakify/features/profile/ui/widgets/logout_dialog.dart';

class ProfileButton extends StatelessWidget {
  const ProfileButton({
    super.key,
    required this.title,
    this.textStyle,
    required this.icon,
    required this.routeName,
  });
  final String title;
  final TextStyle? textStyle;
  final IconData icon;
  final String routeName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        routeName == Routes.loginScreen
            ? logoutDialog(context)
            : context.pushNamed(routeName);
      },
      child: Container(
        height: 70.h,
        decoration: BoxDecoration(
          color: AppColors.primaryLight,
          borderRadius: BorderRadius.circular(15).r,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            children: [
              FaIcon(icon, color: AppColors.primary, size: 25.sp),
              horizontalSpace(10),
              Text(title, style: textStyle ?? AppStyles.font16w500Black),
            ],
          ),
        ),
      ),
    );
  }
}
