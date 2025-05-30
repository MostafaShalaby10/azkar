import 'package:azkar/core/widgets/custom_text_widget.dart';
import 'package:azkar/features/azkar/view/azkar_view.dart';
import 'package:azkar/features/sebha/view/sebha_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../notification/views/notification_settings.dart';
import '../../prayers/view/prayer_time_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> titles = [
      "أذكار الصباح",
      "أذكار المساء",
      "مواقيت الصلاة",
      "السبحة",
    ];
    List<String> images = [
      "assets/duas.svg",
      "assets/duas.svg",
      "assets/prayer_time.svg",
      "assets/tasbih.svg",
    ];
    return Scaffold(
      backgroundColor: Colors.white24,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            "assets/background.jpg",
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: images.length,
            itemBuilder:
                (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      if (index < 2) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => AzkarView(
                                  isMorning: index == 0 ? true : false,
                                ),
                          ),
                        );
                      } else if (index == 2) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PrayerTimeView(),
                          ),
                        );
                      } else {
                        // Handle the action for the last item
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SebhaView(),
                          ),
                        );
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.black, width: 1.w),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            images[index],
                            fit: BoxFit.cover,
                            width: 70.w,
                            height: 70.h,
                            // color: Colors.amber,
                          ),
                          CustomTextWidget(
                            textAlign: TextAlign.center,
                            text: titles[index],
                            fontSize: 24,
                            fontWeight: FontWeight.w900,
                            // textColor: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
          ),
          Positioned(
            top: 50.h,
            right: 10.w,
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NotificationSettings(),
                  ),
                );
              },
              icon: const Icon(Icons.notifications_outlined, size: 30),
            ),
          ),
        ],
      ),
    );
  }
}
