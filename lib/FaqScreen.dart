import 'package:demoproject/Appbar/appbar.dart';
import 'package:demoproject/Commons/SizedBox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/accordion/gf_accordion.dart';

class FAQScreen extends StatefulWidget {
  const FAQScreen({super.key});

  @override
  State<FAQScreen> createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
  late RxList<bool> isExpandedList;
  late Future myfuture;

  @override
  void initState() {
    isExpandedList = RxList.generate(Faqcard.length, (index) => index == 0);
    super.initState();
  }

  void toggleExpansion(int index) {
    isExpandedList[index] = !isExpandedList[index];
  }

  List<Map<String, String>> Faqcard = [
    {
      'title': 'How to create new account?',
      'content':
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. Lorem Ipsum has been the industry's standard dummy text ever since.",
    },
    {
      'title': 'What is Traders Circuits ?',
      'content':
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. Lorem Ipsum has been the industry's standard dummy text ever since.",
    },
    {
      'title': 'What is Traders Circuits ?',
      'content':
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. Lorem Ipsum has been the industry's standard dummy text ever since.",
    },
    {
      'title': 'What is Traders Circuits ?',
      'content':
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. Lorem Ipsum has been the industry's standard dummy text ever since.",
    },
    {
      'title': 'What is Traders Circuits ?',
      'content':
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. Lorem Ipsum has been the industry's standard dummy text ever since.",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffFFFFFF),
        appBar: CommonAppbar(
          titleTxt: 'Frequently Asked Questions',
          // calendarWidget: false,
          // preferredSize: Size.fromHeight(50.h),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: Faqcard.length,
                  itemBuilder: (BuildContext context, int index) {
                    return
                        // GFAccordion(
                        //   title: 'First Accordion',
                        //   content: 'This is the content of the first accordion.',
                        //   expandedTitleBackgroundColor:
                        //       Colors.blue, // Customization
                        //   collapsedIcon: Icon(Icons.arrow_drop_down),
                        //   expandedIcon: Icon(Icons.arrow_drop_up),
                        // );

                        Obx(() {
                      return customExpandableItem(
                        isExpanded: isExpandedList[index],
                        title: Faqcard[index]['title'] ?? '',
                        content: Faqcard[index]['content'] ?? '',
                        toggleExpansion: () => toggleExpansion(index),
                      );
                    });
                  },
                ),
              ),
            ],
          ),
        ));
  }

  Widget customExpandableItem({
    required bool isExpanded,
    required String title,
    required String content,
    required VoidCallback toggleExpansion,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 46.h,
          decoration: BoxDecoration(
            // border:
            //     isExpanded ? null : Border.all(color: const Color(0xffCCCCCC)),
            color: isExpanded ? const Color(0xFF3192D8) : Colors.white,
            borderRadius: BorderRadius.circular(8.r),
            boxShadow: const [
              BoxShadow(
                offset: Offset(0.0, 4.0),
                blurRadius: 10.0,
                spreadRadius: 0.0,
                color: Color.fromRGBO(207, 207, 207, 0.25),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.only(right: 19.56, left: 13),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: "Nunito Sans",
                    fontSize: 14.sp,
                    fontWeight: isExpanded ? FontWeight.w700 : FontWeight.w400,
                    color: isExpanded ? Colors.white : Colors.black,
                  ),
                ),
                Spacer(),
                GestureDetector(
                  onTap: toggleExpansion,
                  child: Icon(
                    isExpanded
                        ? Icons.keyboard_arrow_up_outlined
                        : Icons.keyboard_arrow_down_outlined,
                    color: isExpanded ? Colors.white : Colors.black,
                    size: 25.sp,
                  ),
                ),
              ],
            ),
          ),
        ),
        Visibility(
          visible: isExpanded,
          child: Container(
            height: 136.h,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8.r),
                bottomRight: Radius.circular(8.r),
              ),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  offset: Offset(0.0, 4.0),
                  blurRadius: 10.0,
                  spreadRadius: 0.0,
                  color: Color.fromRGBO(207, 207, 207, 0.25),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 11, left: 14, bottom: 25, right: 28),
              child: Text(
                content,
                style: TextStyle(
                  color: Color(0xff868686),
                  fontFamily: "DM Sans",
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ),
        isExpanded ? sizedBoxHeight(26.h) : sizedBoxHeight(18.h),
      ],
    );
  }
}
