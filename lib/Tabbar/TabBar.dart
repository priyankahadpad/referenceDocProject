import 'package:demoproject/Sidemenu/Sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CommonTabBar extends StatefulWidget {
  const CommonTabBar({super.key});

  @override
  State<CommonTabBar> createState() => _CommonTabBarState();
}

class _CommonTabBarState extends State<CommonTabBar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          drawer: Container(width: 320.w, child: SideMenu()),
          resizeToAvoidBottomInset: true,
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(
                      Icons.arrow_back,
                      size: 24.sp,
                      color: const Color(0xff000000),
                    ),
                  ),
                  SizedBox(width: 7.w),
                  Text(
                    'Cocktail Vouchers',
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: Color(0xFF090909),
                      fontWeight: FontWeight.w600,
                      fontFamily: "Nunito Sans",
                    ),
                  ),
                ],
              ),
            ),
            elevation: 0,
            shadowColor: Colors.black,
            automaticallyImplyLeading: false,
            titleSpacing: 0,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(65.h),
              child: TabBar(
                // controller: _tabController,
                indicatorColor: Color(0xff002A5B),
                indicatorWeight: 4.h,
                dividerColor: Colors.transparent,
                tabs: [
                  Container(
                    width: 110.w,
                    child: Tab(
                      child: Text(
                        'All',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: "DM Sans",
                            fontWeight: FontWeight.w400,
                            fontSize: 16.sp,
                            color: Color(0xFF000000)),
                      ),
                    ),
                  ),
                  Container(
                    width: 110.w,
                    child: Tab(
                      child: Text(
                        'Redeemed',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: "DM Sans",
                            fontWeight: FontWeight.w400,
                            fontSize: 16.sp,
                            color: Color(0xFF000000)),
                      ),
                      // height: 50.h,
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: TabBarView(
            // controller: _tabController,
            children: [
              Tab1(),
              Tab2(),
            ],
          ),

          // Method 2
          // DefaultTabController(
          //     length: 2,
          //     initialIndex: 1,
          //     child: Column(
          //       children: [
          //         MyTabBar(),
          //         SizedBox(
          //           height: 700.h,
          //           child: TabBarView(
          //             children: [
          //               ActiveCallsTab(),
          //               ExitedCallsTab(),
          //             ],
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
        ),
      ),
    );
  }

  Tab1() {}
  Tab2() {}
}

class MyTabBar extends StatelessWidget {
  // Set the desired height

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Color(0Xff3A3A3A)),
        borderRadius: BorderRadius.circular(8.r),
      ),
      padding: const EdgeInsets.all(10.0), // Set the desired padding
      child: TabBar(
          indicator: BoxDecoration(
            color: const Color(0xff6C0000),
            borderRadius: BorderRadius.circular(5),
          ),
          dividerColor: Colors.transparent,
          labelStyle: TextStyle(
              fontSize: 18.sp,
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontFamily: 'manrope'),
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorColor: const Color(0xFFFFFFFF),
          labelColor: Colors.white,
          unselectedLabelColor: const Color(0xffFFFFFF),
          overlayColor: MaterialStateProperty.all(const Color(0xFFFFFFFF)),
          tabs: const [
            Tab(
              text: 'Active Calls',
            ),
            Tab(
              text: 'Exited Calls',
            ),
          ]),
    );
  }
}

class CommonTabBarreg extends StatelessWidget {
  // Set the desired height

  final List<Tab> tabs;
  const CommonTabBarreg({
    super.key,
    required this.tabs,
  });

  @override
  Widget build(BuildContext context) {
    return TabBar(
        dividerColor: const Color(0xFFFFFFFF).withOpacity(0.07),
        labelStyle: TextStyle(
            fontSize: 14.sp,
            color: const Color(0xFFFCFCFC),
            fontWeight: FontWeight.w400,
            fontFamily: 'Helvetica'),
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorColor: const Color(0xFFD90B2E),
        // labelColor: Colors.white,
        indicatorWeight: 2.h,
        dividerHeight: 2.h,
        unselectedLabelColor: const Color(0xFFFCFCFC),
        overlayColor: MaterialStateProperty.all(const Color(0xFFD90B2E)),
        tabs: tabs);
  }
}
