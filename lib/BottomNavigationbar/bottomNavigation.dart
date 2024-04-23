import 'package:demoproject/BottomNavigationbar/MainController.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

GlassmorphicContainer bottomnavigationbar(MainController _mainController) {
  return GlassmorphicContainer(
    width: double.infinity,
    height: 83,
    borderRadius: 8,
    blur: 30,
    alignment: Alignment.center,
    border: 0,
    linearGradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Colors.white.withOpacity(0.1),
          Color(0xFFFFFFFF).withOpacity(0.05),
        ],
        stops: [
          0.1,
          1,
        ]),
    borderGradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xff3A3A3A),
        Color(0xFF3A3A3A),
      ],
    ),
    child: BottomNavigationBar(
      // backgroundColor: ,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Color(0xFFFFFFFF).withOpacity(0),
      showUnselectedLabels: true,
      selectedItemColor: Colors.white,
      unselectedItemColor: Color(0xFF676767),
      unselectedLabelStyle: TextStyle(
          fontSize: 10,
          color: Color(0xFF676767),
          fontWeight: FontWeight.w400,
          fontFamily: 'manrope'),
      selectedLabelStyle: TextStyle(
          fontSize: 10,
          color: Color(0xFFFFFFFF),
          fontWeight: FontWeight.w400,
          fontFamily: 'manrope'),
      currentIndex: _mainController.selectedIndex.value,
      onTap: (index) {
        _mainController.updateTab(index);
      },
      items: [
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/images/png/sidemenu/inactivehome.png',
            height: 26,
            width: 26,
          ),
          // Icon(
          //   Icons.home,
          //   color: Color(0xFF676767),
          // ),
          activeIcon: Stack(
            children: [
              if (_mainController.selectedIndex.value == 0)
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 15,
                        blurRadius: 5,
                        offset: Offset(0, 10),
                      ),
                    ],
                  ),
                ),
              Positioned(
                top: 0,
                bottom: 0,
                right: 0,
                left: 0,
                child: Center(
                  child: Image.asset(
                    'assets/images/png/sidemenu/activehome.png',
                    height: 30,
                    width: 30,
                  ),
                ),
              )
            ],
          ),

          // activeIcon: SvgPicture.asset('assets/image/svg/active_home.svg'),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/images/png/sidemenu/inactiveshorttrade.png',
            height: 26,
            width: 26,
          ),
          activeIcon: Stack(
            children: [
              if (_mainController.selectedIndex.value == 1)
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.4),
                        spreadRadius: 15,
                        blurRadius: 10,
                        offset: Offset(0, 10),
                      ),
                    ],
                  ),
                ),
              Positioned(
                  left: 0,
                  right: 0,
                  top: 0,
                  bottom: 0,
                  child: Center(
                    child: Image.asset(
                      'assets/images/png/sidemenu/activetrade.png',
                      height: 30,
                      width: 30,
                    ),
                  ))
            ],
          ),

          // SvgPicture.asset('assets/image/svg/active_shortTrade.svg'),
          label: 'Short Trade',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/images/png/sidemenu/inactiveprotfolio.png',
            height: 26,
            width: 26,
          ),
          activeIcon: Stack(
            children: [
              if (_mainController.selectedIndex.value == 2)
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.4),
                        spreadRadius: 15,
                        blurRadius: 10,
                        offset: Offset(0, 10),
                      ),
                    ],
                  ),
                ),
              Positioned(
                  left: 0,
                  right: 0,
                  top: 0,
                  bottom: 0,
                  child: Center(
                    child: Image.asset(
                      'assets/images/png/sidemenu/activeprotfolio.png',
                      height: 30,
                      width: 30,
                    ),
                  ))
            ],
          ),

          // SvgPicture.asset('assets/image/svg/active_protfolio.svg'),
          label: 'Portfolio',
        ),
      ],
    ),
  );
}
















// CurvedNavigationBar(
//                     backgroundColor: Colors.transparent,
//                     iconPadding: 20.r,
//                     index: _selectedIndex,
//                     color: Colors.white,
//                     buttonBackgroundColor: Color(0xFF052857),
//                     height: 70.h,
//                     items: [
//                       CurvedNavigationBarItem(
//                         labelStyle: TextStyle(
//                           fontFamily: "Nunito Sans",
//                           fontWeight: FontWeight.w400,
//                           fontSize: 10.sp,
//                           color: Color(0xFF090909),
//                         ),
//                         child: SvgPicture.asset(
//                           'assets/logos/Home.svg',
//                           color: _selectedIndex == 0
//                               ? Colors.white
//                               : Color(0xFF090909),
//                         ),
//                         label: 'Home',
//                       ),
//                       CurvedNavigationBarItem(
//                         labelStyle: TextStyle(
//                           fontFamily: "Nunito Sans",
//                           fontWeight: FontWeight.w400,
//                           fontSize: 10.sp,
//                           color: Color(0xFF090909),
//                         ),
//                         child: SvgPicture.asset(
//                           'assets/logos/Passports.svg',
//                           color: _selectedIndex == 1
//                               ? Colors.white
//                               : Color(0xFF090909),
//                         ),
//                         label: 'Passports',
//                       ),
//                       CurvedNavigationBarItem(
//                         labelStyle: TextStyle(
//                           fontFamily: "Nunito Sans",
//                           fontWeight: FontWeight.w400,
//                           fontSize: 10.sp,
//                           color: Color(0xFF090909),
//                         ),
//                         child: SvgPicture.asset(
//                           'assets/logos/Explore.svg',
//                           color: _selectedIndex == 2
//                               ? Colors.white
//                               : Color(0xFF090909),
//                         ),
//                         label: 'Explore',
//                       ),
//                       CurvedNavigationBarItem(
//                         labelStyle: TextStyle(
//                           fontFamily: "Nunito Sans",
//                           fontWeight: FontWeight.w400,
//                           fontSize: 10.sp,
//                           color: Color(0xFF090909),
//                         ),
//                         child: SvgPicture.asset(
//                           'assets/logos/people.svg',
//                           color: _selectedIndex == 3
//                               ? Colors.white
//                               : Color(0xFF090909),
//                         ),
//                         label: 'Profile',
//                       ),
//                     ],
//                     onTap: (int index) {
//                       setState(() {
//                         _selectedIndex = index;
//                         selectedIndex = index;
//                       });
//                     },
//                   ),},
