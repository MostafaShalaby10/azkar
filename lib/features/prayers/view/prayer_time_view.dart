import 'package:azkar/core/utils/service_locator.dart';
import 'package:azkar/core/widgets/custom_text_widget.dart';
import 'package:azkar/features/prayers/model/repos/prayer_repo_imp.dart';
import 'package:azkar/features/prayers/model_view/cubit/prayer_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrayerTimeView extends StatelessWidget {
  const PrayerTimeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PrayerCubit(getIt<PrayerRepoImp>())..getTimes(),
      child: BlocBuilder<PrayerCubit, PrayerState>(
        builder: (context, state) {
          return Scaffold(
            body: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  "assets/mosque.jpg",
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),

                state is! LoadingGetPrayerTime
                    ? Column(
                      spacing: 15.h,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        PrayerContainer(
                          prayerName: "الفجر",
                          prayerTime:
                              PrayerCubit.get(context).prayerTimes["Fajr"],
                        ),
                        PrayerContainer(
                          prayerName: "الشروق",
                          prayerTime:
                              PrayerCubit.get(context).prayerTimes["Sunrise"],
                        ),
                        PrayerContainer(
                          prayerName: "الظهر",
                          prayerTime:
                              PrayerCubit.get(context).prayerTimes["Dhuhr"],
                        ),
                        PrayerContainer(
                          prayerName: "العصر",
                          prayerTime:
                              PrayerCubit.get(context).prayerTimes["Asr"],
                        ),
                        PrayerContainer(
                          prayerName: "المغرب",
                          prayerTime:
                              PrayerCubit.get(context).prayerTimes["Maghrib"],
                        ),

                        PrayerContainer(
                          prayerName: "العشاء",
                          prayerTime:
                              PrayerCubit.get(context).prayerTimes["Isha"],
                        ),
                      ],
                    )
                    : const Center(child: CircularProgressIndicator()),
              ],
            ),
          );
        },
      ),
    );
  }
}

class PrayerContainer extends StatelessWidget {
  const PrayerContainer({
    super.key,
    required this.prayerName,
    required this.prayerTime,
  });
  final String prayerName;
  final String prayerTime;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
      decoration: BoxDecoration(
        color: Colors.white54,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          CustomTextWidget(
            text: prayerTime,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
          const Spacer(),

          CustomTextWidget(
            text: prayerName,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ],
      ),
    );
  }
}
