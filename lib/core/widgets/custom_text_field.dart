import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trakify/core/helpers/spacing.dart';
import 'package:trakify/core/theming/app_colors.dart';
import 'package:trakify/core/theming/app_styles.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    this.title,
    required this.hintText,
    required this.iconData,
    this.isPassword = false,
  });

  final String? title;
  final String hintText;
  final IconData iconData;
  final bool isPassword;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(widget.title ?? '', style: AppStyles.font16w500Black),
        verticalSpace(5),
        TextFormField(
          obscureText: widget.isPassword ? _isObscure : false,
          decoration: InputDecoration(
            prefixIcon: Icon(widget.iconData),
            hintText: widget.hintText,
            filled: true,
            fillColor: AppColors.primaryLight,
            hintStyle: AppStyles.font14w400Black,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15).r,
              borderSide: BorderSide.none,
            ),
            suffixIcon:
                widget.isPassword
                    ? IconButton(
                      icon: Icon(
                        _isObscure ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      },
                    )
                    : null,
          ),
        ),
      ],
    );
  }
}
