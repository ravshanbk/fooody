import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodly/core/constants/app_colors.dart';
import 'package:foodly/core/constants/app_icons.dart';
import 'package:foodly/views/widgets/cubit/buttonnavbar_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class BottomNavBarView extends StatelessWidget {
  const BottomNavBarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BottonNavBarCubit(),
      child: BlocBuilder<BottonNavBarCubit, BottonNavBarState>(
          builder: (context, stater) {
            var _context = context.watch<BottonNavBarCubit>(); 
        return Scaffold(
          body: _context.pages[_context.pageIndex],
          bottomNavigationBar: BottomNavigationBar(
             type: BottomNavigationBarType.fixed,
             
            currentIndex: _context.pageIndex,
            selectedItemColor: AppColors.greenColor,
            unselectedItemColor: AppColors.greyColor,
            items:  [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(APPIcons.home,color: _context.pageIndex == 0 ? AppColors.greenColor : AppColors.greyColor,),
                label: "Home" ,
                // hello
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(APPIcons.search,color: _context.pageIndex == 1 ? AppColors.greenColor : AppColors.greyColor,),
                label: "Search",
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(APPIcons.order,color: _context.pageIndex == 2 ? AppColors.greenColor : AppColors.greyColor,),
                label: "Orders",
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(APPIcons.profile,color: _context.pageIndex == 3 ? AppColors.greenColor : AppColors.greyColor,),
                label: "Profile",
              ),
            ],
            onTap: (int index) {
              context.read<BottonNavBarCubit>().changePage(index);
            },
          ),
        );
      }),
    );
  }
}
