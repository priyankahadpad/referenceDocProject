import 'package:demoproject/Commons/SizedBox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  List sideBarData = [
    {"imagePath": "assets/images/svg/sidemenu/Faq.svg", "text": "FAQ’s"},
    {
      "imagePath": "assets/images/svg/sidemenu/contact.svg",
      "text": "Contact Us"
    },
    {
      "imagePath": "assets/images/svg/sidemenu/rate.svg",
      "text": "Rate this app"
    },
    {
      "imagePath": "assets/images/svg/sidemenu/terms.svg",
      "text": "Terms & Conditions"
    },
    {
      "imagePath": "assets/images/svg/sidemenu/privacy.svg",
      "text": "Privacy Policy"
    },
    {"imagePath": "assets/images/svg/sidemenu/about.svg", "text": "About Us"},
    {
      "imagePath": "assets/images/svg/sidemenu/settingmenu.svg",
      "text": "Settings"
    },
    {"imagePath": "assets/images/svg/sidemenu/logout.svg", "text": "Logout"},
  ];

  Color sideBarBackgroundColor = const Color(0xFF1B243D);
  Color whitecolor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          toolbarHeight: 60,
          elevation: 0,
          backgroundColor: Colors.black,
          leading: Container(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                onTap: () {
                  // Get.back();
                  Scaffold.of(context).closeDrawer();
                },
                child: Container(
                  width: 25,
                  height: 25,
                  decoration: ShapeDecoration(
                    color: Colors.black,
                    shape: const OvalBorder(),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: 25,
                      height: 25,
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 25,
                        weight: 25,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        body: Stack(
          children: [
            //      CommonBlurLeft(),
            //    CommonBlurRight(),
            Stack(children: [
              ListView(children: [
                // sizedBoxHeight(30),
                InkWell(
                  onTap: () {
                    setState(() {
                      // Get.toNamed(RouteName.investorprofile);
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: ShapeDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  "assets/images/png/Ellipse 560 (1).png"),
                              fit: BoxFit.fill,
                            ),
                            shape: const OvalBorder(),
                          ),
                        ),
                        // sizedBoxWidth(20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Afrid Mulla'),
                            // sizedBoxHeight(4),
                            Text('My Profile'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                // sizedBoxHeight(25.h),
                Container(
                  height: 1,
                  margin: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Color.fromRGBO(176, 176, 176, 0.5),
                        width: 1,
                      ),
                    ),
                  ),
                ),
                ListTile(
                  leading:
                      SvgPicture.asset('assets/images/svg/sidemenu/sub.svg'),
                  title: Text('My Subscription'),
                  trailing: Container(
                    height: 35,
                    width: 122,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Color(0xFF34C759),
                    ),
                    child: Center(child: Text('Upgrade')),
                  ),
                  selected: true,
                  onTap: () {
                    setState(() {
                      // Get.toNamed(RouteName.privacypolicy);
                    });
                  },
                ),
              
                
                Container(
                  height: 1,
                  margin: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Color.fromRGBO(176, 176, 176, 0.5),
                        width: 1,
                      ),
                    ),
                  ),
                ),
                ListTile(
                  leading: SvgPicture.asset(
                      'assets/images/svg/sidemenu/Group 51347.svg'),
                  title: Text('My Subscription'),
                  trailing: Container(
                    height: 35,
                    width: 122,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Color(0xFF0093FF),
                    ),
                    child: Center(child: Text('Conservative')),
                  ),
                  selected: true,
                  onTap: () {
                    setState(() {
                      // Get.toNamed(RouteName.privacypolicy);
                    });
                  },
                ),
                Column(
                  children: List.generate(sideBarData.length, (index) {
                    return sideBarTile(
                      image: sideBarData[index]["imagePath"],
                      text: sideBarData[index]["text"],
                      onTap: () {
                        navigateTo(index, context);
                      },
                    );
                  }),
                ),
                // SingleChildScrollView(
                //   physics: NeverScrollableScrollPhysics(),
                //   child: ListView.builder(
                //     shrinkWrap: true,
                //     padding: EdgeInsets.zero,
                //     itemCount: sideBarData.length,
                //     itemBuilder: (_, index) {
                //       return sideBarTile(
                //         image: sideBarData[index]["imagePath"],
                //         text: sideBarData[index]["text"],
                //         onTap: () {
                //           navigateTo(index, context);
                //         },
                //       );
                //     },
                //   ),
                // ),
                // sizedBoxHeight(80.h),
              ]),
            ]),
          ],
        ));
  }
}

LogOutdialog(context) {
  return showDialog(
    // barrierDismissible: false,
    context: context,
    builder: (context) => Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AlertDialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 16),
          backgroundColor:
              Get.isDarkMode ? Colors.black : const Color(0XFF1B243D),
          contentPadding: EdgeInsets.fromLTRB(29, 44, 29, 35),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          content: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 87,
                width: 80,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xFFC18948)),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    height: 79,
                    width: 73,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xFFE8C69F).withOpacity(0.5),
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/images/svg/apps 1.svg',
                        // fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ),
              // sizedBoxHeight(30.h),
              Text(
                "Are you sure you want to logout ?",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: "manrope",
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                    color: const Color(0xFFFFFFFF)),
              ),
              // sizedBoxHeight(40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // SizedBox(
                  //     width: 140.w,
                  //     child: CommonBorderNoBtn(
                  //       text: 'Yes',
                  //       onTap: () {
                  //         // prefs.clear();
                  //         // Get.offNamed(RouteName.loginScreen);
                  //       },
                  //     )),
                  // SizedBox(
                  //   width: 140.w,
                  //   child: CommonYesBtn(
                  //     text: 'No',
                  //     onTap: () {
                  //       Get.back();
                  //     },
                  //   ),
                  // ),
                ],
              )
            ],
          ),
        ),
      ],
    ),
  );
}

void navigateTo(int index, BuildContext context) {
  switch (index) {
    case 0:
      {
        // Get.toNamed(RouteName.faqscreen);
      }
      break;

    case 1:
      {
        // Get.toNamed(RouteName.feedback);
      }
      break;

    case 2:
      {
        // Get.toNamed(RouteName.settingsScreen);
      }
      break;

    case 3:
      {
        // Get.toNamed(RouteName.termsandcondition);
      }
      break;

    case 4:
      {
        // Get.toNamed(RouteName.privacypolicy);
      }
      break;

    case 5:
      {
        // Get.toNamed(RouteName.aboutus);
      }
      break;
    case 6:
      {
        // Get.toNamed(RouteName.settings);
      }
      break;

    case 7:
      {
        // Get.bottomSheet(
          // commonGlassContainer(
          //   width: double.infinity,
          //   height: 363,
          //   borderradius: 4,
          //   customWidget: Center(
          //     child: Padding(
          //       padding: EdgeInsets.symmetric(horizontal: 20.w),
          //       child: Column(
          //         children: [
          //           // sizedBoxHeight(60.h),
          //           // Image.asset(
          //           //   'assets/images/png/Group 1000003722.png',
          //           //   height: 100.h,
          //           // ),
          //           // sizedBoxHeight(25.h),
          //           Text('Confirm Logout'),
          //           sizedBoxHeight(30),
          //           Text(
          //               'Are you sure you want to logout your account?'),
          //           sizedBoxHeight(50),
          //           // CommonYesNoBtn(),
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
          // backgroundColor: Colors.black.withOpacity(0.3),
        // );
      }
      break;

    default:
      {
        null;
      }
  }
}

class sideBarTile extends StatelessWidget {
  final String image;
  final String text;
  final void Function()? onTap;

  sideBarTile({
    required this.image,
    required this.text,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 1,
          margin: EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Color.fromRGBO(176, 176, 176, 0.5),
                width: 1,
              ),
            ),
          ),
        ),
        ListTile(
            leading: SvgPicture.asset(image),
            title: Text(text),
            selected: true,
            onTap: onTap),
      ],
    );
  }
}
