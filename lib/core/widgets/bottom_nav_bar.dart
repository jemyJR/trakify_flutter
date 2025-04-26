import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trakify/core/di/dependency_injection.dart';
import 'package:trakify/core/helpers/extensions.dart';
import 'package:trakify/core/helpers/spacing.dart';
import 'package:trakify/core/routing/routes.dart';
import 'package:trakify/core/theming/app_colors.dart';
import 'package:trakify/core/theming/app_styles.dart';
import 'package:trakify/features/areas/ui/areas_screen.dart';
import 'package:trakify/features/home/ui/home_screen.dart';
import 'package:trakify/features/profile/logic/profile_cubit.dart';
import 'package:trakify/features/profile/ui/profile_screen.dart';
import 'package:trakify/features/progress/ui/progress_screen.dart';

class BottomNavScaffold extends StatefulWidget {
  const BottomNavScaffold({super.key});
  @override
  State<BottomNavScaffold> createState() => _BottomNavScaffoldState();
}

class _BottomNavScaffoldState extends State<BottomNavScaffold> {
  int _bottomNavIndex = 0;

  final List<Widget> iconList = [
    Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FaIcon(FontAwesomeIcons.house),
        verticalSpace(5),
        Text('Home'),
      ],
    ),
    Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FaIcon(FontAwesomeIcons.layerGroup),
        verticalSpace(5),
        Text('Areas'),
      ],
    ),
    Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FaIcon(FontAwesomeIcons.squarePollVertical),
        verticalSpace(5),
        Text('Progress'),
      ],
    ),
    Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FaIcon(FontAwesomeIcons.user),
        verticalSpace(5),
        Text('Profile'),
      ],
    ),
  ];

  final List<Widget> pageList = [
    HomeScreen(),
    AreasScreen(),
    ProgressScreen(),
    BlocProvider(
      create: (context) => getIt<ProfileCubit>()..getProfileData(),
      child: const ProfileScreen(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageList[_bottomNavIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pushNamed(Routes.addHabitScreen),

        backgroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30).r,
        ),
        child: Icon(Icons.add, size: 30.sp, color: AppColors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        height: 80.h,

        splashColor: Colors.transparent,
        splashRadius: 0,
        scaleFactor: 0.2,

        splashSpeedInMilliseconds: 0,
        backgroundColor: AppColors.primary,
        itemCount: iconList.length,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        activeIndex: _bottomNavIndex,
        onTap: (index) => setState(() => _bottomNavIndex = index),
        tabBuilder: (int index, bool isActive) {
          final color = isActive ? AppColors.white : AppColors.bgDarklow;
          return Padding(
            padding: EdgeInsets.only(top: 20.h),
            child: IconTheme(
              data: IconThemeData(color: color, size: 25.sp),
              child: DefaultTextStyle(
                style: AppStyles.font14w800Black.copyWith(color: color),
                child: iconList[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
