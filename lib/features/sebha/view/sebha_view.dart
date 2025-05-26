import 'dart:developer';
import 'dart:math';

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
                    CustomTextWidget(
                      text:
                          sebhaCubit.counter == 1
                              ? sebhaCubit.zekr1counterLocal.toString()
                              : sebhaCubit.counter == 2
                              ? sebhaCubit.zekr2counterLocal.toString()
                              : sebhaCubit.zekr3counterLocal.toString(),
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      textColor: Colors.black87,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        PopupMenuButton(
                          itemBuilder:
                              (context) => [
                                PopupMenuItem(
                                  onTap: () {
                                    sebhaCubit.changeIndex(1);
                                    // sebhaCubit.getCounter(boxName: "zekr1");
                                  },
                                  child: const CustomTextWidget(
                                    text: "سبحان الله",
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                PopupMenuItem(
                                  onTap: () {
                                    sebhaCubit.changeIndex(2);

                                    // sebhaCubit.getCounter(boxName: "zekr2");
                                  },
                                  child: const CustomTextWidget(
                                    text: "الحمد لله",
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                PopupMenuItem(
                                  onTap: () {
                                    sebhaCubit.changeIndex(3);

                                    // sebhaCubit.getCounter(boxName: "zekr3");
                                  },
                                  child: const CustomTextWidget(
                                    text: "الله أكبر",
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                        ),

                        CustomButtonWidget(
                          text:
                              sebhaCubit.counter == 1
                                  ? "سبحان الله"
                                  : sebhaCubit.counter == 2
                                  ? "الحمد لله"
                                  : "الله أكبر",
                          onPressed: () {
                            if (sebhaCubit.counter == 1) {
                              sebhaCubit.zekr1counterLocal++;
                              sebhaCubit.addCounterOnDataBase(
                                sebhaCubit.zekr1counterDB + 1,
                                "zekr1",
                              );
                              sebhaCubit.getCounter(boxName: "zekr1");
                            } else if (sebhaCubit.counter == 2) {
                              sebhaCubit.zekr2counterLocal++;
                              sebhaCubit.addCounterOnDataBase(
                                sebhaCubit.zekr2counterDB + 1,
                                "zekr2",
                              );
                              sebhaCubit.getCounter(boxName: "zekr2");
                            } else if (sebhaCubit.counter == 3) {
                              sebhaCubit.zekr3counterLocal++;
                              sebhaCubit.addCounterOnDataBase(
                                sebhaCubit.zekr3counterDB + 1,
                                "zekr3",
                              );
                              sebhaCubit.getCounter(boxName: "zekr3");
                            }
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                          onPressed: () {
                            sebhaCubit.resetCounter();
                          },
                          icon: Icon(Icons.refresh, size: 30.sp),
                        ),
                        CustomTextWidget(
                          text:
                              "${sebhaCubit.zekr1counterLocal + sebhaCubit.zekr2counterLocal + sebhaCubit.zekr3counterLocal}",
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                        const CustomTextWidget(
                          text: "الاجمالي",
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                  ],
                ),
                Positioned(
                  top: 50.h,
                  right: 30.w,
                  child: IconButton(
                    onPressed: () {
                      showDialog<void>(
                        context: context,
                        barrierDismissible:
                            false, // User must tap a button to dismiss
                        builder: (BuildContext dialogContext) {
                          return AlertDialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            backgroundColor: Colors.white.withOpacity(0.9),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    sebhaCubit.clearDB(boxName: "zekr1");
                                    sebhaCubit.clearDB(boxName: "zekr2");
                                    sebhaCubit.clearDB(boxName: "zekr3");
                                    sebhaCubit.resetCounter();
                                    
                                    Navigator.of(dialogContext).pop(
                                      'Cancelled',
                                    ); // Dismiss and pass a value
                                  },
                                  icon: const Icon(
                                    Icons.delete_rounded,
                                    color: Colors.red,
                                  ),
                                ),
                                const CustomTextWidget(
                                  text: "سجل التسبيحات",
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                              ],
                            ),
                            content: SingleChildScrollView(
                              child: ListBody(
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      CustomTextWidget(
                                        text:
                                            sebhaCubit.zekr1counterDB
                                                .toString(),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w300,
                                      ),
                                      const CustomTextWidget(
                                        text: "سبحان الله",
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      CustomTextWidget(
                                        text:
                                            sebhaCubit.zekr2counterDB
                                                .toString(),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w300,
                                      ),

                                      const CustomTextWidget(
                                        text: "الحمد لله",
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      CustomTextWidget(
                                        text:
                                            sebhaCubit.zekr3counterDB
                                                .toString(),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w300,
                                      ),

                                      const CustomTextWidget(
                                        text: "الله أكبر",
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ],
                                  ),
                                  const Divider(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      CustomTextWidget(
                                        text:
                                            (sebhaCubit.zekr1counterDB +
                                                    sebhaCubit.zekr2counterDB +
                                                    sebhaCubit.zekr3counterDB)
                                                .toString(),
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                      ),
                                      const CustomTextWidget(
                                        text: "الاجمالي",
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            actions: <Widget>[
                              TextButton(
                                child: const Text('Cancel'),
                                onPressed: () {
                                  Navigator.of(dialogContext).pop(
                                    'Cancelled',
                                  ); // Dismiss and pass a value
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    icon: Icon(Icons.history, size: 30.sp),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
