import 'package:dr_booking/utils/app_colors.dart';
import 'package:dr_booking/utils/app_icons.dart';
import 'package:dr_booking/view/screens/about_dr/about_dr_screen.dart';
import 'package:dr_booking/view/screens/home/home_screen.dart';
import 'package:dr_booking/view/screens/setting/setting_screen.dart';
import 'package:dr_booking/view/widgets/custom_image/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({super.key});

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  int selectedIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = <Widget>[
      const HomeScreen(),
      const AboutDrScreen(),
      const SettingScreen(),
    ];
    List<Widget> manuBarItems = [
      MenuBarItems(
          index: 0,
          selectedIndex: selectedIndex,
          image: AppIcons.home),
      MenuBarItems(
          index: 1,
          selectedIndex: selectedIndex,
          image: AppIcons.about),
      MenuBarItems(
          index: 2,
          selectedIndex: selectedIndex,
          image: AppIcons.settings),
    ];

    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: Colors.blue,
        extendBody: true,
        bottomNavigationBar: Container(
          height: 100,
          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.only(top: 30),
          decoration: const BoxDecoration(
            color: AppColors.foundationColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              manuBarItems.length,
                  (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: manuBarItems[index],
                );
              },
            ),
          ),
        ),
        body: screens[selectedIndex],
      ),
    );
  }
}

class MenuBarItems extends StatelessWidget {
  const MenuBarItems(
      {super.key,
        required this.image,
        required this.index,
        required this.selectedIndex,
      });

  final String image;
  final int index;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            CustomImage(
              imageType: ImageType.svg,
                imageColor: index != selectedIndex
                    ? AppColors.whiteColor
                    : AppColors.foundationGrey,
                size: 24,
                imageSrc: image),

          ],
        ),
      ],
    );
  }
}