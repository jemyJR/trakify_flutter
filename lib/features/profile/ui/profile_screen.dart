import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trakify/core/helpers/spacing.dart';
import 'package:trakify/core/widgets/bg_shape.dart';
import 'package:trakify/features/profile/ui/widgets/get_user_data_bloc_builder.dart';

import 'widgets/profile_buttons_list_view.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BgShape(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GetUserDataBlocBuilder(),
              verticalSpace(40),
              ProfileButtonsListView(),
            ],
          ),
        ),
      ),
    );
  }
}
