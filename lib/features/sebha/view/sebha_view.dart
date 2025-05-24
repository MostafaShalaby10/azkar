import 'package:azkar/core/utils/service_locator.dart';
import 'package:azkar/core/widgets/custom_button_widget.dart';
import 'package:azkar/core/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../model/sebha_repo_imp.dart';
import '../model_view/cubit/sebha_cubit.dart';

class SebhaView extends StatelessWidget {
  const SebhaView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              SebhaCubit(getIt<SebhaRepoImp>())
                ..getCounter(boxName: "zekr1")
                ..getCounter(boxName: "zekr2")
                ..getCounter(boxName: "zekr3"),
      child: BlocBuilder<SebhaCubit, SebhaState>(
        builder: (context, state) {
          var sebhaCubit = SebhaCubit.get(context);
          return Scaffold(
            body: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  "assets/tsbeh.jpg",
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),

                Column(
                  spacing: 20.h,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                          onPressed: () {
                            sebhaCubit.resetCounter(boxName: "zekr1");
                            sebhaCubit.getCounter(boxName: "zekr1");
                          },
                          icon: const Icon(Icons.refresh),
                        ),

                        CustomTextWidget(
                          text: sebhaCubit.zekr1counter.toString(),
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          textColor: Colors.black87,
                        ),

                        CustomButtonWidget(
                          text: "سبحان الله",
                          onPressed: () {
                            sebhaCubit.addCounter(
                              sebhaCubit.zekr1counter + 1,
                              "zekr1",
                            );
                            sebhaCubit.getCounter(boxName: "zekr1");
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                          onPressed: () {
                            sebhaCubit.resetCounter(boxName: "zekr2");
                            sebhaCubit.getCounter(boxName: "zekr2");
                          },
                          icon: const Icon(Icons.refresh),
                        ),
                        CustomTextWidget(
                          text: sebhaCubit.zekr2counter.toString(),
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          textColor: Colors.black87,
                        ),

                        CustomButtonWidget(
                          text: "الحمد لله",
                          onPressed: () {
                            sebhaCubit.addCounter(
                              sebhaCubit.zekr2counter + 1,
                              "zekr2",
                            );
                            sebhaCubit.getCounter(boxName: "zekr2");
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                          onPressed: () {
                            sebhaCubit.resetCounter(boxName: "zekr3");
                            sebhaCubit.getCounter(boxName: "zekr3");
                          },
                          icon: const Icon(Icons.refresh),
                        ),
                        CustomTextWidget(
                          text: sebhaCubit.zekr3counter.toString(),
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          textColor: Colors.black87,
                        ),

                        CustomButtonWidget(
                          text: "الله أكبر",
                          onPressed: () {
                            sebhaCubit.addCounter(
                              sebhaCubit.zekr3counter + 1,
                              "zekr3",
                            );
                            sebhaCubit.getCounter(boxName: "zekr3");
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
